<?
	class Router {
		private $routes;

		public function __construct() {
			$routesPath = ROOT.'/config/routes.php';
			$this->routes = include($routesPath);
		}

		
		private function getURI() {
			if (!empty($_SERVER['REQUEST_URI'])) {
				return trim(explode('?', $_SERVER['REQUEST_URI'])[0], '/');
			}
		}

		public function run() {

			
			$uri = $this->getURI();
			$ok = 0;
			
			foreach ($this->routes as $uriPattern => $path) {
				
				if (preg_match("~$uriPattern~", $uri)) {
					$ok++;
					
					$internalRoute = preg_replace("~$uriPattern~", $path, $uri);
					
					$segments = explode('/', $internalRoute);
					$controllerName = array_shift($segments).'Controller';
					$controllerName = ucfirst($controllerName);
					$actionName = 'action'.ucfirst(array_shift($segments));
					$parametrs = $segments;

					
					$controllerFile = ROOT . '/controllers/' . $controllerName . '.php';
					if (file_exists($controllerFile)) {
						include_once($controllerFile);
					}
					$controllerObject = new $controllerName;
					$result = call_user_func_array(array($controllerObject, $actionName), $parametrs);
						$ok = 0;
						break;
					if ($result != null) {
						break;
					}
				}
			}
			if (!$ok == 0) {
				echo "error 404";
			}
		}
	}