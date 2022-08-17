SELECT
    sng.title AS nome,
	COUNT(sng.title) AS reproducoes
FROM SpotifyClone.song AS sng
INNER JOIN SpotifyClone.onrepeat AS onr
	ON onr.song_id = sng.song_id
INNER JOIN SpotifyClone.user AS usr
	ON usr.user_id = onr.user_id
INNER JOIN SpotifyClone.plan AS pln
	ON pln.plan_id = usr.plan_id
WHERE pln.name = 'gratuito' OR pln.name = 'pessoal'
GROUP BY nome
ORDER BY nome;
