drop procedure if exists Pro_AddStatistics_newuser;
DELIMITER ;;
/*
	统计每日新增=》开房数，开局数

	call Pro_AddStatistics_newuser()
	select * from t_statistics_newuserlog
*/
create procedure Pro_AddStatistics_newuser()
begin

		declare _startdate varchar(19) default date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 00:00:00');
		declare _enddate varchar(19) default date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 23:59:59');
		declare _gametype bigint default 1;  -- 游戏类型：1牛牛
		declare _roomNumber bigint default 0;	-- 开房数
		declare _roundNumber bigint default 0; -- 开局数

		
		# 个人好友场 根据新增玩家匹配开房记录的房主 得出开房数
		SELECT count(distinct(roomNum)) into _roomNumber FROM t_game_log where createTime  between _startDate and _endDate 
					 and roomOwnerId in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate);
		
		# 俱乐部开房数
		SELECT count(distinct(roomNum))+ _roomNumber  into _roomNumber FROM t_game_player_log WHERE updateTime  between _startDate and _endDate  
					AND playerId in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate);


		# distinct 作用去重
		# 个人开局数，根据新增玩家匹配开局记录中六个位置的数据，得出局数统计
		SELECT count(distinct(roundIndex)) into _roundNumber from  t_game_round_log where updateTime between _startDate and _endDate
		 and ( 	 player1 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player2 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player3 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player4 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player5 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player6 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					);
		
		# 俱乐部的数据
		SELECT count(distinct(round))+ _roundNumber into _roundNumber FROM t_game_round_log_h5 where updateTime between _startDate and _endDate 
					and (	player1 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player2 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player3 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player4 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player5 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player6 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					);

	INSERT INTO t_statistics_newuserlog (gametype,roomNumber,roundNumber,createTime)VALUES (_gametype,_roomNumber,_roundNumber,NOW());
end
;;
DELIMITER ;
