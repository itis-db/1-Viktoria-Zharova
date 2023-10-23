CREATE TABLE ActivityType (
    ActivityTypeId INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Area (
    AreaId INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Activity (
    ActivityId INT PRIMARY KEY,
    ActivityTypeId INT,
    ParentId INT,
    AreaId INT,
    Name VARCHAR(255),
    FOREIGN KEY (ActivityTypeId) REFERENCES ActivityType(ActivityTypeId),
    FOREIGN KEY (AreaId) REFERENCES Area(AreaId)
);

CREATE TABLE Program (
    ActivityId INT PRIMARY KEY,
    AdditionalAttribute VARCHAR(255),
    FOREIGN KEY (ActivityId) REFERENCES Activity(ActivityId)
);

CREATE TABLE SubProgram (
    ActivityId INT PRIMARY KEY,
    AdditionalAttribute VARCHAR(255),
    FOREIGN KEY (ActivityId) REFERENCES Activity(ActivityId)
);

CREATE TABLE Project (
    ActivityId INT PRIMARY KEY,
    AdditionalAttribute VARCHAR(255),
    FOREIGN KEY (ActivityId) REFERENCES Activity(ActivityId)
);

CREATE TABLE Contract (
    ActivityId INT PRIMARY KEY,
    AreaId INT,
    AdditionalAttribute VARCHAR(255),
    FOREIGN KEY (ActivityId) REFERENCES Activity(ActivityId),
    FOREIGN KEY (AreaId) REFERENCES Area(AreaId)
);

CREATE TABLE Point (
    ActivityId INT PRIMARY KEY,
    AdditionalAttribute VARCHAR(255),
    FOREIGN KEY (ActivityId) REFERENCES Activity(ActivityId)
);
