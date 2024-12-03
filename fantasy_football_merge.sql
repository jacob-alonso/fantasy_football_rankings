CREATE TEMP TABLE temp_calculated_data AS
WITH unpivoted_schedules AS (
    SELECT "Team", 'Week1' AS Week, "Week1" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week2' AS Week, "Week2" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week3' AS Week, "Week3" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week4' AS Week, "Week4" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week5' AS Week, "Week5" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week6' AS Week, "Week6" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week7' AS Week, "Week7" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week8' AS Week, "Week8" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week9' AS Week, "Week9" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week10' AS Week, "Week10" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week11' AS Week, "Week11" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week12' AS Week, "Week12" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week13' AS Week, "Week13" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week14' AS Week, "Week14" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week15' AS Week, "Week15" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week16' AS Week, "Week16" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week17' AS Week, "Week17" AS Opponent FROM team_schedules
    UNION ALL
    SELECT "Team", 'Week18' AS Week, "Week18" AS Opponent FROM team_schedules
),
merged_data AS (
    SELECT
        wr."Player" AS Wide_Receiver,
        wr."Receiver_Score",
        wr."Receiver_Rank",
        wr."Team" AS Team,
        o."Composite_Score" AS Offense_Composite,
        o."Pass_off_rank" AS Offense_Rank,
        d."Defensive_Score" AS Defense_Composite,
        d."Defensive_Rank" AS Defensive_Rank,
        us.Week AS Week,
        us.Opponent AS Opponent_Team
    FROM 
        wide_receiver_rankings wr
    LEFT JOIN 
        offense_rankings o ON wr."Team" = o."Team"
    LEFT JOIN 
        defense_rankings d ON wr."Team" = d."Team"
    LEFT JOIN 
        unpivoted_schedules us ON wr."Team" = us."Team"
)
SELECT 
	md.*,
    d2."Defensive_Rank" AS Opponent_Defensive_Rank,
    d2."Defensive_Score" AS Opponent_Defensive_Score,
    md."Receiver_Score" / NULLIF(d2."Defensive_Score", 0) AS Adjusted_Receiver_Score
FROM merged_data md
LEFT JOIN defense_rankings d2 ON md."opponent_team" = d2."Team"
WHERE md.Team NOT LIKE '%TM'
	AND d2."Defensive_Rank" IS NOT NULL;
--Training
SELECT *
FROM temp_calculated_data
WHERE Week <= 'Week15';

--Testing
SELECT *
FROM temp_calculated_data
WHERE Week > 'Week15';

COPY (SELECT * FROM temp_calculated_data WHERE Week <= 'Week15') TO 'C:\Users\Public\training_data.csv' CSV HEADER;

-- Export testing data
COPY (SELECT * FROM temp_calculated_data WHERE Week > 'Week15') TO 'C:\Users\Public\testing_data.csv' CSV HEADER;
