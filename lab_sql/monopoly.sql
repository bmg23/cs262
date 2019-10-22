--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Properties;
DROP TABLE IF EXISTS PlayerState; 
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer
);

--Tables added for saving a game. PlayerState holds current location and 
--cash. Properties table has each property as a primary key because the 
--properties will not change but the owner and number of houses/hotels 
--will change.  
CREATE TABLE PlayerState(
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID), 
	cash integer, 
	pLocation integer,  
	time timestamp
); 

CREATE TABLE Properties(
	gameID integer REFERENCES Game(ID),
	propertyName varchar(50), 
	propertyOwner integer REFERENCES Player(ID), 
	houses integer, 
	hotels integer 
);


-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerState TO PUBLIC;
GRANT SELECT ON Properties TO PUBLIC;




-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

--3 Current Games
INSERT INTO Game VALUES (4, '2019-10-20 08:00:00');
INSERT INTO Game VALUES (5, '2019-10-22 08:00:00');
INSERT INTO Game VALUES (6, '2019-10-23 08:00:00');


INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);

INSERT INTO PlayerGame VALUES (4, 1, 0.00);
INSERT INTO PlayerGame VALUES (4, 2, 435.00);
INSERT INTO PlayerGame VALUES (4, 3, 2350.00);
INSERT INTO PlayerGame VALUES (5, 1, 1000.00);
INSERT INTO PlayerGame VALUES (5, 2, 745.00);
INSERT INTO PlayerGame VALUES (5, 3, 500.00);
INSERT INTO PlayerGame VALUES (6, 2, 700.00);
INSERT INTO PlayerGame VALUES (6, 3, 5500.00);



--Add all properties, all other values in table can be null. 
INSERT INTO Properties
VALUES 
(1, 'Mediterranean Avenue', 2, 5, 4), 
(1, 'Baltic Avenue', 2, 0, 0), 
(1, 'Arctic Avenue', 3, 1, 1), 
(1, 'Massachusetts Avenue', 3, 2, 2),
(1, 'Oriental Avenue',1,0,0);

--40 Spaces on a classic monoply board. 
--Add player state
INSERT INTO PlayerState VALUES (1, 1, 500, 28, '2019-06-27 08:00:00');
INSERT INTO PlayerState VALUES (1, 2, 700, 23, '2019-06-27 08:00:00');
INSERT INTO PlayerState VALUES (1, 3, 100, 10, '2019-06-27 08:00:00');


--Add all properties, all other values in table can be null. 
INSERT INTO Properties
VALUES 
(4, 'Mediterranean Avenue', 2, 5, 4), 
(4, 'Baltic Avenue', 2, 0, 0), 
(4, 'Arctic Avenue', 3, 1, 1), 
(4, 'Massachusetts Avenue', 3, 2, 2),
(4, 'Oriental Avenue',1,0,0);

--40 Spaces on a classic monoply board. 
--Add player state
INSERT INTO PlayerState VALUES (4, 1, 500, 28, '2019-06-27 08:00:00');
INSERT INTO PlayerState VALUES (4, 2, 700, 23, '2019-06-27 08:00:00');
INSERT INTO PlayerState VALUES (4, 3, 100, 10, '2019-06-27 08:00:00');