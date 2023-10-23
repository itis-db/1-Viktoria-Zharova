WITH RECURSIVE ActivityHierarchy AS (
    SELECT
        A.ActivityId,
        A.Name AS ActivityName,
        AT.Name AS ActivityTypeName,
        P.Name AS ProgramName,
        SP.Name AS SubProgramName,
        AR.Name AS AreaName,
        PR.Name AS ProjectName,
        C.Name AS ContractName,
        PT.Name AS PointName,
        1 AS Level
    FROM Activity AS A
    LEFT JOIN ActivityType AS AT ON A.ActivityTypeId = AT.ActivityTypeId
    LEFT JOIN Program AS P ON A.ActivityId = P.ActivityId
    LEFT JOIN SubProgram AS SP ON A.ActivityId = SP.ActivityId
    LEFT JOIN Area AS AR ON A.AreaId = AR.AreaId
    LEFT JOIN Project AS PR ON A.ActivityId = PR.ActivityId
    LEFT JOIN Contract AS C ON A.ActivityId = C.ActivityId
    LEFT JOIN Point AS PT ON A.ActivityId = PT.ActivityId
    WHERE A.ActivityId = COALESCE(@pn_activityid, A.ActivityId)
    
    UNION ALL
    
    SELECT
        A.ActivityId,
        A.Name AS ActivityName,
        AT.Name AS ActivityTypeName,
        P.Name AS ProgramName,
        SP.Name AS SubProgramName,
        AR.Name AS AreaName,
        PR.Name AS ProjectName,
        C.Name AS ContractName,
        PT.Name AS PointName,
        AH.Level + 1
    FROM Activity AS A
    JOIN ActivityHierarchy AS AH ON A.ParentId = AH.ActivityId
    LEFT JOIN ActivityType AS AT ON A.ActivityTypeId = AT.ActivityTypeId
    LEFT JOIN Program AS P ON A.ActivityId = P.ActivityId
    LEFT JOIN SubProgram AS SP ON A.ActivityId = SP.ActivityId
    LEFT JOIN Area AS AR ON A.AreaId = AR.AreaId
    LEFT JOIN Project AS PR ON A.ActivityId = PR.ActivityId
    LEFT JOIN Contract AS C ON A.ActivityId = C.ActivityId
    LEFT JOIN Point AS PT ON A.ActivityId = PT.ActivityId
    WHERE AH.Level < 7
)
SELECT *
FROM ActivityHierarchy
WHERE Level <= 7
ORDER BY Level, ActivityId;
