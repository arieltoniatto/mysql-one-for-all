SELECT
	MIN(p.price) AS faturamento_minimo,
    MAX(p.price) AS faturamento_maximo,
    ROUND(AVG((SELECT p.price
				FROM SpotifyClone.plan AS p
            WHERE p.plan_id = u.plan_id )), 2
    ) AS faturamento_medio,
    SUM((SELECT p.price
			FROM SpotifyClone.plan AS p
        WHERE p.plan_id = u.plan_id)) AS faturamento_total
FROM SpotifyClone.plan AS p
INNER JOIN SpotifyClone.user AS u
	ON u.plan_id = p.plan_id;
