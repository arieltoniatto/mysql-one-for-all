SELECT
	COUNT(onr.user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.onrepeat AS onr
INNER JOIN SpotifyClone.user AS usr
	ON onr.user_id = usr.user_id
WHERE usr.name = 'Barbara Liskov';
