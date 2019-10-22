--Lab08 Queries 
--Author: Brian Goins (bmg23)
------------------------------

--Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT * FROM Game 
WHERE time > '2006-06-26'
ORDER BY time DESC; 

--Retrieve all the games that occurred in the past week.
SELECT * FROM Game 
WHERE time > '2019-10-20'
ORDER BY time DESC; 

--Retrieve a list of players who have (non-NULL) names.
SELECT * FROM Player 
WHERE name IS NOT NULL; 

--Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT * FROM PlayerGame
WHERE score > 2000
ORDER BY score DESC; 


--Retrieve a list of players who have gmail accounts.
SELECT * FROM Player 
WHERE emailAddress LIKE '%gmail%';

--Retrieve all “The King”’s game scores in decreasing order.
SELECT name, score FROM Player 
INNER JOIN PlayerGame
ON Player.ID = PlayerGame.playerID
WHERE Player.name LIKE '%King%'
ORDER BY score DESC; 

--Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT name, score, date FROM Game 
INNER JOIN PlayerGame



--So what does that P1.ID < P2.ID clause do in the last example query?

--The query that joined the Player table to itself seems rather contrived. 
--Can you think of a realistic situation in which you’d want to join a table to itself?