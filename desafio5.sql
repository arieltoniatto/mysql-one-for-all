SELECT
	s.title AS cancao,
    COUNT(o.song_id) AS reproducoes
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.onrepeat AS o
	ON o.song_id = s.song_id
GROUP BY o.song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
