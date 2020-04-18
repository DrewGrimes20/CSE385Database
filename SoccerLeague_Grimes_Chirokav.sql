CREATE TABLE Clubs (
    teamId              INT            NOT NULL        IDENTITY    PRIMARY KEY,
    playerId            INT            NOT NULL        foreign key references Players(playerId),
    managerId           INT            NOT NULL        foreign key references Manager(managerId),
    cityId              INT            NOT NULL        foreign key references City(cityId),
    age                 INT            NOT NULL,
    winCount            INT            NOT NULL        default(0),     
    lossCount           INT            NOT NULL        default(0),
    drawCount           INT            NOT NULL        default(0),
    leaguePoints        INT            NOT NULL        default(0),
    clubName            VARCHAR(100)   NOT NULL
);

CREATE TABLE PlayerStats (
    playerStatsId       INT            NOT NULL        IDENTITY   PRIMARY KEY,
    playerId            INT            NOT NULL        foreign key references Players(playerId),
    assists             INT            NOT NULL,
    appearances         INT            NOT NULL,
    yellowCards         INT            NOT NULL,
    redCards            INT            NOT NULL,
    salary              INT            NOT NULL,
    contractLength      INT            NOT NULL,
    gamesMissed         INT            NOT NULL,
    number              INT            NOT NULL,
    goals               INT            NOT NULL
);


CREATE TABLE Cleats (
    cleatId            INT            NOT NULL        IDENTITY   PRIMARY KEY,
    playerId           INT            NOT NULL        foreign key references Players(playerId),
    brand              VARCHAR(100),
    model              VARCHAR(100)
);
