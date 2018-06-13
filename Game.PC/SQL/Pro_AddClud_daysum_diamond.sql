drop procedure if exists Pro_AddClud_daysum_diamond;
DELIMITER ;;
/*
	统计俱乐部开房模式
*/
create procedure Pro_AddClud_daysum_diamond()
begin
		declare _baseD bigint default 6;						#房主支付钻石的基数
		declare _AAD bigint default 2;						  #AA支付钻石的基数
		declare _clubId int default 0;
		declare _diamondSum bigint default 0;					#钻石总数

		declare _playSZ bigint default 0;					#牛牛上庄钻石总数
		declare _playGD bigint default 0;					#固定庄家钻石总数
		declare _playZY bigint default 0;					#自由抢庄钻石总数
		declare _playMP bigint default 0;					#明牌抢庄钻石总数
		declare _playTB bigint default 0;					#通比牛牛钻石总数
		declare _playLZ bigint default 0;				  #通比牛牛钻石总数

	 	#创建结束标志变量  
		declare done int default false;

		declare _startDate varchar(50) default CONCAT(DATE_SUB(DATE_SUB(CURDATE(),interval 0 day), interval 1 day),' 00:00:00');	#当前时间前一天 开始
		declare _endDate varchar(50) default CONCAT(DATE_SUB(CURDATE(), interval 1 day),' 23:59:59');		#当前时间前一天 结束

		#创建游标
 		declare cur cursor for SELECT clubId  from t_game_room_log where clubId > 0  and createTime between _startDate and _endDate  GROUP BY clubId;
	
		#指定游标循环结束时的返回值
		declare continue handler for not found set done = TRUE; 

		#打开游标  
		open cur;  
		#开始循环游标里的数据  
		read_loop:loop 
		#根据游标当前指向的一条数据  
		fetch cur into _clubId;
		if done then  
				leave read_loop;    #跳出游标循环  
		end if;  

				/*
				上庄模式 默认为牛牛上庄 1-牛牛上庄 2-固定庄家 3-自由抢庄 4-明牌抢庄 5-通比牛牛 6-轮庄牛牛
				*/
				SELECT sum(diamond) into _diamondSum from t_club_diamond_log where clubId = _clubId AND createTime between _startDate and _endDate;

				SELECT sum(diamond) into _playSZ  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=1);
				SELECT sum(diamond) into _playGD  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=2);
				SELECT sum(diamond) into _playZY  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=3);
				SELECT sum(diamond) into _playMP  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=4);
				SELECT sum(diamond) into _playTB  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=5);
				SELECT sum(diamond) into _playLZ  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=6);
				/*
				SELECT (count(*)* _baseD) into _diamondSum from t_game_log where clubId = _clubId AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playSZ from t_game_log where clubId = _clubId AND bankerMode =1 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playGD from t_game_log where clubId = _clubId AND bankerMode =2 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playZY from t_game_log where clubId = _clubId AND bankerMode =3 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playMP from t_game_log where clubId = _clubId AND bankerMode =4 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playTB from t_game_log where clubId = _clubId AND bankerMode =5 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playLZ from t_game_log where clubId = _clubId AND bankerMode =6 AND createTime between _startDate and _endDate;
				*/
				#diamondType钻石类型:1消耗
				#type类别：1个人，2俱乐部
				INSERT INTO sys_daysum_diamond(type,typeId,diamond,diamondType,createTime,playSZ,playGD,playZY,playMP,playTB,playLZ)
				VALUES(2,_clubId,_diamondSum,1,_endDate,_playSZ,_playGD,_playZY,_playMP,_playTB,_playLZ);

		#结束游标循环  
		end loop;
		#关闭游标  
		close cur;
end
;;
DELIMITER ;

