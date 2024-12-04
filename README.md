# fantasy_football_rankings

This project aims to predict the rankings of wide receivers in fantasy football based on their current season statistics, defensive stats, offensive tendencies, and team schedules. By integrating and analyzing multiple datasets, the model provides insights into wide receiver performance and projects future rankings.

Wide Receiver Statistics

Data includes total receptions, yards, touchdowns, and targets for wide receivers.
These metrics are weighted to determine the current performance rankings of wide receivers.
Defensive Statistics Against the Pass

Metrics include receptions allowed, yards allowed, and touchdowns allowed by opposing defenses.
These stats are adjusted from a fantasy football perspective to weigh their impact on wide receiver performance.
Team Offensive Tendencies

Focuses on whether a team is pass-heavy or run-heavy.
Metrics analyzed include pass attempts, pass completions, and air yards to assess which teams rely more on passing and which quarterbacks are throwing deep passes.
Team Schedule

Includes details on past opponents and upcoming matchups for each team.
This provides context for analyzing the strength of opponents faced and future challenges.


A SQL database was used to merge the datasets efficiently and perform additional data cleaning.
Training and validation datasets were created:
Training Data: Weeks 1–12 of the NFL season.
Validation Data: Weeks 13–15 of the NFL season.
This structured data was then prepared for machine learning predictions.

The machine learning component leverages the integrated and cleaned data to predict future rankings of wide receivers. The model evaluates each player's potential based on their performance trends, defensive matchups, offensive schemes, and upcoming schedules.

References
Defensive Stats: "https://www.pro-football-reference.com/years/2024/fantasy-points-against-WR.htm" 
Wide Receiver Stats:"https://www.pro-football-reference.com/years/2024/receiving.htm"
Pass or Run Offense:'https://www.pro-football-reference.com/years/2024/advanced.htm'
Team Schedules:'https://www.espn.com/nfl/schedulegrid' 
