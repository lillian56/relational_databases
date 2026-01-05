#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"
# 两队在所有比赛中的总进球数：90
echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals)+SUM(opponent_goals) as sum FROM games")"
# 获胜球队在所有比赛中的平均进球数：2.1250000000000000
echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"
# 获胜球队在所有比赛中的平均进球数（四舍五入至小数点后两位）：2.13
echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games")"
# 两队所有比赛的平均进球数：2.8125000000000000
echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals+opponent_goals) AS avg_total_goals_per_game FROM games")"
# 单场比赛中一队进球数最多：7个
echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"
# 获胜球队进球数超过两球的游戏数量：6
echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(winner_goals) FROM games WHERE winner_goals>2")"
# 2018年锦标赛冠军队伍名称：法国队
echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT teams.name FROM games LEFT JOIN teams ON games.winner_id=teams.team_id WHERE round='Final' AND year=2018 GROUP by teams.name")"
# 参加2014年“八强”赛的球队名单：阿尔及利亚、阿根廷、比利时、巴西、智利、哥伦比亚、哥斯达黎加、法国、德国、希腊、墨西哥、荷兰、尼日利亚、瑞士、美国、乌拉圭
echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT t.name FROM games AS g LEFT JOIN teams AS t ON t.team_id IN (g.winner_id, g.opponent_id) WHERE g.year = 2014 AND g.round = 'Eighth-Final' ORDER BY t.name")"
# 整个数据集中独特的获胜球队名称列表：阿根廷、比利时、巴西、哥伦比亚、哥斯达黎加、克罗地亚、英格兰、法国、德国、荷兰、俄罗斯、瑞典、乌拉圭
echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT teams.name FROM games  LEFT JOIN teams ON games.winner_id=teams.team_id ORDER BY teams.name")"
# 历届冠军年份及冠军队伍：2014年|德国队 2018年|法国队
echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year,teams.name FROM games LEFT JOIN teams ON games.winner_id=teams.team_id WHERE round='Final' ORDER BY year")"
# 以“Co”开头的球队名单：哥伦比亚、哥斯达黎加
echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"
