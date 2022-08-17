SELECT 
	u.name as usuario,
    IF(MAX(YEAR(o.played)) >= 2021, "Usuário ativo", "Usuário inativo") AS "status_usuario"
FROM
	SpotifyClone.user AS u
INNER JOIN
	SpotifyClone.onrepeat AS o
    ON o.user_id = u.user_id
GROUP BY u.name
ORDER BY u.name;
