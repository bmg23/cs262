CREATE DATABASE cuDating; 


--Login Info 
--Holds login info for each user. 

CREATE TABLE LoginInfo (
    ID int, 
    UserName VARCHAR(255),

    --We will change this 
    --and work on security later.
    Password VARCHAR(255),
    DisplayName VARCHAR(255)

);



--Match Info
--Matches will be added when two people match
--They will then be declared false when two 
--people unmatch. 
CREATE TABLE MatchInfo (
    User1 VARCHAR(255), 
    User2 VARCHAR(255), 
    MatchStatus SMALLINT
);


--Chat Info
CREATE TABLE ChatInfo (
    User1 VARCHAR(255), 
    User2 VARCHAR(255),
    ChatAddress INT  
);