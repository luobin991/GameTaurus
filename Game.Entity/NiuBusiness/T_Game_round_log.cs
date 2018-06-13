using System;
using Game.Entity.Common;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Game.Entity.NiuBusiness
{
    public class T_GameRoundBase : SearchBase
    {

        /// <summary>
        /// 房间号
        /// </summary>
        public int roomNum { get; set; }
        /// <summary>
        /// 游戏的局数 取值范围为 4-20 
        /// </summary>
        public int round { get; set; }


        /// <summary>
        /// 庄家Id，通比牛牛时没有庄家
        /// </summary>
        public string bankerId { get; set; }

        #region 1
        /// <summary>
        /// 座位1的玩家Id
        /// </summary>
        public string player1 { get; set; }
        /// <summary>
        ///  座位1的玩家的牌信息
        /// </summary>
        public string cards1 { get; set; }

        /// <summary>
        ///  	1位置的玩家的牌类型
        /// </summary>
        public int cardType1 { get; set; }

        /// <summary>
        ///  	 座位1玩家一局的押注底分，庄家不押注
        /// </summary>
        public int baseScore1 { get; set; }
        /// <summary>
        ///  座位1的玩家的一局得分
        /// </summary>
        public int getScore1 { get; set; }

        /// <summary>
        ///  座位1的玩家的一局结算分
        /// </summary>
        public int getScoreTotal1 { get; set; }

        /// <summary>
        /// 1号位置上的玩家是否抢庄 自由抢庄时用到
        /// </summary>
        public int isRobBanker1 { get; set; }

        /// <summary>
        ///  位置1的玩家的抢庄倍率 明牌抢庄的时候用到
        /// </summary>
        public int robBankerNum1 { get; set; }


        #endregion

        #region 2
        /// <summary>
        /// 座位2的玩家Id
        /// </summary>
        public string player2 { get; set; }
        /// <summary>
        ///  座位2的玩家的牌信息
        /// </summary>
        public string cards2 { get; set; }

        /// <summary>
        ///  	2位置的玩家的牌类型
        /// </summary>
        public int cardType2 { get; set; }

        /// <summary>
        ///   座位2玩家一局的押注底分，庄家不押注
        /// </summary>
        public int baseScore2 { get; set; }
        /// <summary>
        ///  座位2的玩家的一局得分
        /// </summary>
        public int getScore2 { get; set; }

        /// <summary>
        ///  座位1的玩家的一局结算分
        /// </summary>
        public int getScoreTotal2 { get; set; }
        /// <summary>
        /// 2号位置上的玩家是否抢庄 自由抢庄时用到
        /// </summary>
        public int isRobBanker2 { get; set; }

        /// <summary>
        ///  位置2的玩家的抢庄倍率 明牌抢庄的时候用到
        /// </summary>
        public int robBankerNum2 { get; set; }


        #endregion

        #region 3
        /// <summary>
        /// 座位3的玩家Id
        /// </summary>
        public string player3 { get; set; }
        /// <summary>
        ///  座位3的玩家的牌信息
        /// </summary>
        public string cards3 { get; set; }

        /// <summary>
        ///  	3位置的玩家的牌类型
        /// </summary>
        public int cardType3 { get; set; }

        /// <summary>
        ///  	 座位3玩家一局的押注底分，庄家不押注
        /// </summary>
        public int baseScore3 { get; set; }
        /// <summary>
        ///  座位3的玩家的一局得分
        /// </summary>
        public int getScore3 { get; set; }

        /// <summary>
        ///  座位的玩家的一局结算分
        /// </summary>
        public int getScoreTotal3 { get; set; }

        /// <summary>
        /// 3号位置上的玩家是否抢庄 自由抢庄时用到
        /// </summary>
        public int isRobBanker3 { get; set; }

        /// <summary>
        ///  位置3的玩家的抢庄倍率 明牌抢庄的时候用到
        /// </summary>
        public int robBankerNum3 { get; set; }


        #endregion

        #region 4
        /// <summary>
        /// 座位4的玩家Id
        /// </summary>
        public string player4 { get; set; }
        /// <summary>
        ///  座位4的玩家的牌信息
        /// </summary>
        public string cards4 { get; set; }

        /// <summary>
        ///  	4位置的玩家的牌类型
        /// </summary>
        public int cardType4 { get; set; }
        /// <summary>
        ///  	 座位4玩家一局的押注底分，庄家不押注
        /// </summary>
        public int baseScore4 { get; set; }
        /// <summary>
        ///  座位4的玩家的一局得分
        /// </summary>
        public int getScore4 { get; set; }
        /// <summary>
        ///  座位的玩家的一局结算分
        /// </summary>
        public int getScoreTotal4 { get; set; }

        /// <summary>
        /// 4号位置上的玩家是否抢庄 自由抢庄时用到
        /// </summary>
        public int isRobBanker4 { get; set; }

        /// <summary>
        ///  位置4的玩家的抢庄倍率 明牌抢庄的时候用到
        /// </summary>
        public int robBankerNum4 { get; set; }


        #endregion

        #region 5
        /// <summary>
        /// 座位5的玩家Id
        /// </summary>
        public string player5 { get; set; }
        /// <summary>
        ///  座位5的玩家的牌信息
        /// </summary>
        public string cards5 { get; set; }

        /// <summary>
        ///  	5位置的玩家的牌类型
        /// </summary>
        public int cardType5 { get; set; }

        /// <summary>
        ///  	 座位5玩家一局的押注底分，庄家不押注
        /// </summary>
        public int baseScore5 { get; set; }
        /// <summary>
        ///  座位5的玩家的一局得分
        /// </summary>
        public int getScore5 { get; set; }

        /// <summary>
        ///  座位的玩家的一局结算分
        /// </summary>
        public int getScoreTotal5 { get; set; }

        /// <summary>
        /// 5号位置上的玩家是否抢庄 自由抢庄时用到
        /// </summary>
        public int isRobBanker5 { get; set; }

        /// <summary>
        ///  位置5的玩家的抢庄倍率 明牌抢庄的时候用到
        /// </summary>
        public int robBankerNum5 { get; set; }


        #endregion

        #region 6
        /// <summary>
        /// 座位6的玩家Id
        /// </summary>
        public string player6 { get; set; }
        /// <summary>
        ///  座位6的玩家的牌信息
        /// </summary>
        public string cards6 { get; set; }

        /// <summary>
        ///  	6位置的玩家的牌类型
        /// </summary>
        public int cardType6 { get; set; }

        /// <summary>
        ///  座位6玩家一局的押注底分，庄家不押注
        /// </summary>
        public int baseScore6 { get; set; }
        /// <summary>
        ///  座位6的玩家的一局得分
        /// </summary>
        public int getScore6 { get; set; }

        /// <summary>
        ///  座位的玩家的一局结算分
        /// </summary>
        public int getScoreTotal6 { get; set; }
        /// <summary>
        /// 6号位置上的玩家是否抢庄 自由抢庄时用到
        /// </summary>
        public int isRobBanker6 { get; set; }

        /// <summary>
        ///  位置6的玩家的抢庄倍率 明牌抢庄的时候用到
        /// </summary>
        public int robBankerNum6 { get; set; }


        #endregion

        /// <summary>
        /// 
        /// </summary>
        public DateTime updateTime { get; set; }

        public string returnModern(string cards)
        {
            if (cards == null)
                return "";
            string[] array = cards.Split(',');
            string div = "<div class='card {0} {1}'><div class='small-suit'></div><div class='suit'></div></div>";
            Dictionary<string, string> dicsNum = new Dictionary<string, string> { };
            dicsNum.Add("1", "ace");
            dicsNum.Add("2", "two");
            dicsNum.Add("3", "three");
            dicsNum.Add("4", "four");
            dicsNum.Add("5", "five");
            dicsNum.Add("6", "six");
            dicsNum.Add("7", "seven");
            dicsNum.Add("8", "eight");
            dicsNum.Add("9", "nine");
            dicsNum.Add("a", "ten");
            dicsNum.Add("b", "jack");
            dicsNum.Add("c", "dame");
            dicsNum.Add("d", "king");

            Dictionary<string, string> dicsType = new Dictionary<string, string> { };
            dicsType.Add("4", "spades");
            dicsType.Add("3", "hearts");
            dicsType.Add("2", "clubs");
            dicsType.Add("1", "diamonds");

            string result = "<br/>";
            foreach (var item in array)
            {
                result += String.Format(div, dicsNum[item.Substring(2, 1)], dicsType[item.Substring(3, 1)]);
            }
            return result;
        }

    }

    public class T_Game_round_log : T_GameRoundBase
    {
        /// <summary>
        /// 局数对应的索引
        /// </summary>
        public string roundIndex { get; set; }

        /// <summary>
        /// 庄家选择分数 2/4/8/46/32
        /// </summary>
        public int chooseBaseScore { get; set; }

        /// <summary>
        /// 房主Id AA支付时没有房主
        /// </summary>
        public string roomOwner { get; set; }


        /******以下是扩展字段**************/


        public string playNickName1 { get; set; }
        public string playNickName2 { get; set; }
        public string playNickName3 { get; set; }
        public string playNickName4 { get; set; }
        public string playNickName5 { get; set; }
        public string playNickName6 { get; set; }


        public string resultNiu1 { get { return returnData(player1, cardType1, isRobBanker1, robBankerNum1, baseScore1, getScore1); } }
        public string resultNiu2 { get { return returnData(player2, cardType2, isRobBanker2, robBankerNum2, baseScore2, getScore2); } }
        public string resultNiu3 { get { return returnData(player3, cardType3, isRobBanker3, robBankerNum3, baseScore3, getScore3); } }
        public string resultNiu4 { get { return returnData(player4, cardType4, isRobBanker4, robBankerNum4, baseScore4, getScore4); } }
        public string resultNiu5 { get { return returnData(player5, cardType5, isRobBanker5, robBankerNum5, baseScore5, getScore5); } }
        public string resultNiu6 { get { return returnData(player6, cardType6, isRobBanker6, robBankerNum6, baseScore6, getScore6); } }

        public string metro1 { get { return returnModern(cards1); } }
        public string metro2 { get { return returnModern(cards2); } }
        public string metro3 { get { return returnModern(cards3); } }
        public string metro4 { get { return returnModern(cards4); } }
        public string metro5 { get { return returnModern(cards5); } }
        public string metro6 { get { return returnModern(cards6); } }

        private string returnData(string player, int cardType, int isRobBanker, int robBankerNum, int baseScore, int getScore1)
        {
            if (string.IsNullOrEmpty(player))
                return "";
            string data = System.Enum.GetName(typeof(Enum.SpecCardType), cardType);

            if (isRobBanker == 0)
            { data += "    不抢"; }
            else
            {
                data += "    抢 x " + robBankerNum;
            }
            switch (baseScore)
            {
                case 0:
                    data += "    庄家";
                    break;
                default:
                    data += "    底分:" + baseScore;
                    break;
            }

            return data + "    得分:" + getScore1;
        }

    }


    /// <summary>
    /// 俱乐部积分模式的牌局详情数据
    /// </summary>
    public class T_GameRoundLogH5 : T_GameRoundBase
    {

        public T_GameRoundLogH5()
        {}
        public int id { get; set; }
        public int clubId { get; set; }


        public string playNickName1 { get; set; }
        public string playNickName2 { get; set; }
        public string playNickName3 { get; set; }
        public string playNickName4 { get; set; }
        public string playNickName5 { get; set; }
        public string playNickName6 { get; set; }

        public string resultNiu1 { get { return returnData(player1, playNickName1, cardType1, isRobBanker1, robBankerNum1, baseScore1, getScore1); } }
        public string resultNiu2 { get { return returnData(player2, playNickName2, cardType2, isRobBanker2, robBankerNum2, baseScore2, getScore2); } }
        public string resultNiu3 { get { return returnData(player3, playNickName3, cardType3, isRobBanker3, robBankerNum3, baseScore3, getScore3); } }
        public string resultNiu4 { get { return returnData(player4, playNickName4, cardType4, isRobBanker4, robBankerNum4, baseScore4, getScore4); } }
        public string resultNiu5 { get { return returnData(player5, playNickName5, cardType5, isRobBanker5, robBankerNum5, baseScore5, getScore5); } }
        public string resultNiu6 { get { return returnData(player6, playNickName6, cardType6, isRobBanker6, robBankerNum6, baseScore6, getScore6); } }


        public string metro1 { get { return returnModern(cards1); } }
        public string metro2 { get { return returnModern(cards2); } }
        public string metro3 { get { return returnModern(cards3); } }
        public string metro4 { get { return returnModern(cards4); } }
        public string metro5 { get { return returnModern(cards5); } }
        public string metro6 { get { return returnModern(cards6); } }


        private string returnData(string player,string playNickName, int cardType, int isRobBanker, int robBankerNum, int baseScore, int getScore1)
        {

            if (string.IsNullOrEmpty(player))
                return "";

            string data = playNickName + " <br/>";

            data+= System.Enum.GetName(typeof(Enum.SpecCardType), cardType);



            if (isRobBanker == 0)
            { data += "    不抢"; }
            else
            {
                data += "    抢 x " + robBankerNum;
            }
            switch (baseScore)
            {
                case 0:
                    data += "    庄家";
                    break;
                default:
                    data += "    底分:" + baseScore;
                    break;
            }

            return data + "    得分:" + getScore1;
        }
    }

}
