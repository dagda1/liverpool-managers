-- SQLite
--mSELECT MIN(play_at) FROM games;
SELECT *
FROM games
  INNER JOIN teams t1
  ON games.team1_id = t1.id
  INNER JOIN teams t2
  ON games.team2_id = t2.id
WHERE games.team1_id = 9
  OR games.team2_id = 9
ORDER BY games.play_at DESC;

-- SELECT *
-- from games;