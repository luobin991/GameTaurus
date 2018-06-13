<template>
    <div id="ClubMember">
        <mt-header title="俱乐部成员简介" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
            <mt-button icon="more" slot="right" v-if="user.position==1&&user.nLevel==2" @click.native="toolShow=!toolShow"></mt-button>
        </mt-header>
        <div class="content">
            <div class="user">
                <div class="img"><img :src="user.szHeadPicUrl==''?require('../../assets/img/nopic.png'):user.headImgUrl" width="60" alt=""></div>
                <div class="nichen">
                    <div>昵称：{{user.userName}}<br/></div>
                    <p class="mark">ID:<span class="markname">{{user.userId}}</span> <i class="iconfont icon-edit"></i></p>
                </div>
            </div>
            <!-- <mt-cell title="已用额度/总钻石额度:" value="" v-if="user.position==2">
                <span> {{user.costDiamond +"/"+ user.diamondLimit}} <mt-button @click.native="showInput(1)" style="margin-left:10px;"   type="danger"  size="small" >修改</mt-button> </span>
            </mt-cell> -->
            <!--本俱乐部划分金币: user.coinLimit -->

            <!-- <mt-cell title="持有金币:" value="" >
                 <span> {{user.coin}} 
                <mt-button @click.native="showInput(1)" v-if="this.acess==0"  type="danger"  size="small" >+ </mt-button> 
                <mt-button @click.native="showInput(2)" v-if="this.acess==0"  type="primary"  size="small" >- </mt-button> 
                </span>
            </mt-cell> -->

            <mt-cell title="现有积分/总积分额度:" value="" > <!--  v-if="user.position==2" -->
                <span> {{user.currentScore +"/"+ user.scoreLimit}} 
                <mt-button @click.native="showInput(3)" v-if="this.acess==0"  type="danger"  size="small" >+ </mt-button> 
                <mt-button @click.native="showInput(4)" v-if="this.acess==0"  type="primary"  size="small" >- </mt-button> 
                </span>
            </mt-cell>
             
            <mt-cell title="成员加入时间">
                <span>{{user.createTimeStr}}</span>
            </mt-cell>
             <div class="ge"></div>
            <mt-button class=" nnbutton" type="danger" size="large" v-if="user.position==0">当前玩家是创建者</mt-button>
            <mt-button class=" nnbutton" type="danger" size="large" v-else-if="user.position==1">当前玩家是管理员</mt-button>
            <mt-button class="deletemember nnbutton" size="large" @click.native="$router.push(`/usergamelog?userId=${userId}&clubId=${clubId}`)">战绩记录</mt-button>
            <mt-button class="deletemember nnbutton" size="large" @click.native="$router.push(`/consumelog?userId=${userId}&clubId=${clubId}`)">消耗记录</mt-button>
        </div>
    </div>
</template>
<script>
import NnCell from "../../components/NnCell";
import { MessageBox } from "mint-ui";
export default {
  name: "ClubMember",
  components: {
    NnCell
  },
  data() {
    return {
      nPlayerId: 0,
      id: 0,
      user: {},
      acess: ""
    };
  },
  methods: {
    showInput(e) {
      //1:coinAdd 2:coinRM 3:scoreAdd 4:scoreRM
      let type = e;
      let that = this;
      let placeholder = "";

      if (type == 1) placeholder = "增加金币";
      else if (type == 2) placeholder = "减少金币";
      else if (type == 3) placeholder = "追加积分";
      else if (type == 4) placeholder = "减少积分";

      MessageBox.prompt("  ", "测试", {
        title: type <= 2 ? "调整金币" : "调整积分",
        //message: "注意：在原基础上追加",
        showCancelButton: true,
        showInput: true,
        //inputValue: 0,//this.user.diamondLimit,
        inputPlaceholder: placeholder
      }).then(
        //点击确定保存编辑的操作
        ({ value, action }) => {
          if (parseInt(value) > 0) {
            //减少
            if (type == 2 || type == 4) {
              if (value > 0) value = 0 - value;
            } else {
              //增加
              if (value < 0) {
                MessageBox("提示", "请正确输入整数");
                return false;
              }
            }
            that.setNumberPost(value, type);
          } else {
            MessageBox("提示", "请正确输入整数");
          }
        },
        ({ value, action }) => {}
      );
    },
    setNumberPost(value, type) {
      let that = this;
      let funName = "";
      if (type == 1 || type == 2) funName = "AddClubMemberCoinLimit";
      else funName = "AddClubMemberScoreLimit";
      let getInfoData = {
        functionname: funName, //type == 1 ? "SetUserClubDiamondLimit" : "AddClubMemberScoreLimit",
        body: JSON.stringify({
          nClubId: that.clubId,
          userId: that.userId,
          val: value
        })
      };
      //console.log(getInfoData)
      this.$http
        .post(`${this.baseUrl}/Main/PostData`, getInfoData)
        .then(response => {
          let data = response.data;
          if (data.code == 1) {
            if (type == 3 || type == 4) { //积分
              that.user.currentScore = data.body.currentScore;
              that.user.scoreLimit = data.body.scoreLimit;
            } else if (type == 2 || type == 1) {//金币
              //that.user.coinLimit = data.body.coinLimit;
              that.user.coin = data.body.coin;
            }
            MessageBox("提示", data.msg);
          } else {
            MessageBox("提示", data.msg);
          }
        })
        .catch(error => {
          MessageBox("提示", "出错");
        });
    },
    getMemberDetail() {
      let that = this;
      let getInfoData = {
        params: {
          functionname: "GetClubUserInfo",
          body: JSON.stringify({
            userid: parseInt(that.userId),
            nClubId: parseInt(that.clubId)
          })
        }
      };
      this.$http
        .get(`${this.baseUrl}/Main/GetData`, getInfoData)
        .then(response => {
          let data = response.data;
          if (data.code == 1) {
            that.user = data.body;
          } else {
            MessageBox("提示", data.msg);
          }
        })
        .catch(error => {});
    },
    getAcess() {
      let that = this;
      let getAcess = {
        params: {
          functionname: "GetClubAuth",
          body: JSON.stringify({
            nClubId: parseInt(this.clubId)
          })
        }
      };
      this.$http
        .get(`${this.baseUrl}/Main/GetData`, getAcess)
        .then(response => {
          //  console.log(response)
          let data = response.data;
          if (data.code == 1) {
            that.acess = data.body.position;
            console.log(that.acess);
          } else {
            MessageBox("提示", data.msg);
          }
        });
    }
  },
  created() {
    this.userId = this.$route.query.userId;
    this.clubId = this.$route.query.clubId;
    this.getAcess();
    this.getMemberDetail();
  },
  mounted() {
    let that = this;
  }
};
</script>

<style lang="scss" scoped>
@import "../../frame/BaseFrameWork/Animation.scss";
#ClubMember {
  padding-top: 40px;
}
.content {
  padding: 30px 10px 60px 10px;
}
.user {
  display: flex;
  padding: 10px 10px 10px 10px;
  margin-bottom: 20px;
  align-items: center;
  background: #ffffff;
  .img {
    width: 80px;
    img {
      display: block;
      width: 80px;
      height: 80px;
    }
  }
  .nichen {
    padding-left: 15px;
    flex: 1;
    color: #302112;
    font-size: 16px;
    white-space: nowrap;
    overflow: hidden;
    .mark {
      margin-top: 5px;
      font-size: 13px;
      .markname {
        color: #7f8484;
      }
    }
  }
}
.ge {
  width: 100%;
  height: 25px;
  background: #eeeeee;
}
.deletemember {
  color: #6b6056;
}
.nnbutton {
  margin-top: 20px;
}
.mint-cell-wrapper {
  .mint-button--primary {
    background-color: #26a2ff;
    padding: 0 10px;
    font-size: 12px;
    height: 30px;
  }
  .mint-button--danger {
    background-color: red;
    padding: 0 10px;
    font-size: 12px;
    height: 30px;
  }
}
</style>


