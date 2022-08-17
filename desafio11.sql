SELECT nome_musica, novo_nome
FROM (SELECT
    title AS nome_musica,
	CASE
		WHEN title LIKE '%Amar%' THEN REPLACE(title, 'Amar', 'Code Review')
        WHEN title LIKE '%SUPERSTAR%' THEN REPLACE(title, 'SUPERSTAR', 'SUPERDEV')
        WHEN title LIKE '%Bard%' THEN REPLACE(title, 'Bard', 'QA')
        WHEN title LIKE '%SOUL%' THEN REPLACE(title, 'SOUL', 'CODE')
        WHEN title LIKE '%Pais%' THEN REPLACE(title, 'Pais', 'Pull Requests')
	END AS novo_nome
FROM SpotifyClone.song) AS new_table
WHERE novo_nome IS NOT NULL
ORDER BY nome_musica DESC;
