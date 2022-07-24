<?
    $users = Db::select("
        SELECT
            `c_team`,
            `c_year`
        FROM
            `contracts`
        WHERE
            (`c_player_id` = '".$_GET['player']."') AND
            (`c_team_id` = '".$_GET['team']."')
    ");

    echo json_encode($users);