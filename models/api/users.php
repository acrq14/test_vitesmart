<?
    $users = Db::select("
        SELECT
            `player_id`,        
            `player_name`,        
            `player_sname`,        
            `player_position`,        
            `player_level`        
        FROM
            `players`,
            `teams`,
            `contracts`
        WHERE
            (`c_player_id` = `player_id`) AND
            (`c_team_id` = `team_id`) AND
            (`team_id` = '".$_GET['team']."')
        GROUP BY `player_id`
    ");

    echo json_encode($users);