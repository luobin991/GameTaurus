drop procedure if exists Pro_AddStatisticsDayReport;
DELIMITER ;;
/*
	统计游戏各项指标数据

	
*/
create procedure Pro_AddStatisticsDayReport()
begin

		declare _startdate varchar(19) default date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 00:00:00');
		declare _enddate varchar(19) default  date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 23:59:59');
		
		declare _userNumber bigint default 0;  	#日有效人数
		declare _roomNumber bigint default 0;		#日有效开房数
		declare _roundNumber bigint default 0; 	#日有效局数
		declare _sumDiamond bigint default 0;		#钻石消耗
		
		drop table if exists list;  
		create temporary table list(playerId INT not null);


		/*
	SELECT playerId1 ,playerId2 ,playerId3 ,playerId4 ,playerId5 ,playerId6
	FROM t_game_log GROUP BY playerId1 ,playerId2 ,playerId3 ,playerId4 ,playerId5 ,playerId6;
	WHERE createTime BETWEEN _startDate and _endDate
	*/
		# 好友场的有效人数
		INSERT INTO list SELECT playerId1 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId1 IS NOT NULL GROUP BY playerId1;
		INSERT INTO list SELECT playerId2 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId2 IS NOT NULL GROUP BY playerId2;
		INSERT INTO list SELECT playerId3 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId3 IS NOT NULL GROUP BY playerId3;
		INSERT INTO list SELECT playerId4 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId4 IS NOT NULL GROUP BY playerId4;
		INSERT INTO list SELECT playerId5 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId5 IS NOT NULL GROUP BY playerId5;
		INSERT INTO list SELECT playerId6 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId6 IS NOT NULL GROUP BY playerId6;
		# 俱乐部的有效人数
		INSERT INTO list SELECT playerId FROM t_game_player_log where updateTime BETWEEN _startDate and _endDate  group by playerId;
		# 好友场+俱乐部 合并去重
		SELECT count(*) into _userNumber from(SELECT * from  list group by playerId) as tb;
		

		SELECT count(*) into _roomNumber from t_game_room_log where createTime between _startDate and _endDate;
		
		SELECT SUM(playedRound) into _roundNumber from t_game_room_log where createTime between _startDate and _endDate ;
		if _roundNumber is NULL 
		THEN
			set _roundNumber = 0;
		END IF;

		SELECT SUM(changedDiamond) into _sumDiamond FROM t_diamond_log  where changedType  in (1,3,4,5,6) and  updateTime between _startDate and _endDate;
		if _sumDiamond is NULL 
		THEN
				set _sumDiamond = 0;
		END IF;

		INSERT INTO t_statistics_day_report (userNumber,roomNumber,roundNumber,diamondNumber,createTime) VALUES (_userNumber,_roomNumber,_roundNumber,_sumDiamond,_endDate);

		#SELECT * FROM t_statistics_day_report
		#call Pro_AddStatisticsDayReport()
end
;;
DELIMITER ;
