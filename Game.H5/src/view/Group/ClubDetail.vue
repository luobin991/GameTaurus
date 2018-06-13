<template>
    <div id="memberdetail">
        <mt-header title="俱乐部信息" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
        </mt-header>
        <div class="content">
            <div class="user">
                <div class="img"><img :src="require(`../../assets/images/Club_${4}.png`)" width="60" alt=""></div>
                <div class="nichen">{{club.clubName}}</div>
            </div>
            <mt-cell title="俱乐部id" class="nobckimg">
                <span>{{club.clubId}}</span>
            </mt-cell>
            <mt-cell title="俱乐部所属城市" value="">
                <span>{{club.city}}</span>
            </mt-cell>
            <mt-cell title="俱乐部人数" value="">
                <span>{{club.peopleCount}}</span>
            </mt-cell>
            <mt-cell title="俱乐部创建时间" value="123321">
                <span>{{club.createTimeStr}}</span>
            </mt-cell>
            
            <!-- 积分功能 -->
            <div class="ge"></div>
             <!-- <mt-cell title="金币池：" value=""><span>{{club.coinPool}}</span></mt-cell> -->
            <mt-cell title="底分倍率:" value="" v-if="this.position==0">
                <span> {{club.expandRate}} <mt-button @click.native="showInput(1)" style="margin-left:10px;"   type="danger"  size="small" >修改</mt-button> </span>
            </mt-cell>
            <mt-cell title="最小带入积分倍率:" value="" v-if="this.position==0">
                <span> {{club.scoreRate}}  <mt-button @click.native="showInput(2)" style="margin-left:10px;"   type="danger"  size="small" >修改</mt-button> </span>
            </mt-cell>

        </div>
    </div>
</template>
<script>
import { MessageBox } from "mint-ui";
export default {
  name: "memberdetail",
  data() {
    return {
      id: 0,
      club: {},
      //access: {},
      position: 2
    };
  },
  methods: {
    showInput(e) {
      let type = e;
      let that = this;
      MessageBox.prompt("  ", "", {
        title: type == 1 ? "底分倍率" : "最小带入积分倍率",
        message: " ",
        showCancelButton: false,
        showInput: true,
        inputValue: e==1?this.club.expandRate:this.club.scoreRate,
        inputPlaceholder: "请输入整正数"
      }).then(
        ({ value, action }) => {
          if (parseInt(value) > 0) {
            //点击确定保存编辑的操作
            if (e == 1) {
              if (parseInt(value) > 1000) {
                MessageBox("提示", "底分倍率范围在 1-1000");
              }
              this.club.expandRate=value;
            }else{
                if (parseInt(value)<10 || parseInt(value) > 1000) {
                MessageBox("提示", "最小带入积分倍率范围在 10-1000");
                return false;
              }
              this.club.scoreRate=value;
            }

            that.SetClubRate();
          } else {
            MessageBox("提示", "请正确输入整数");
          }
        },
        () => {}
      );
    },
    SetClubRate() {
      let that = this;
      let getInfoData = {
        functionname: "setClubRate",
        body: JSON.stringify({
          clubId: that.club.clubId,
          expandRate: that.club.expandRate,
          scoreRate: that.club.scoreRate
        })
      };
      this.$http.post(`${this.baseUrl}/Main/PostData`, getInfoData).then(response => {
          let data = response.data;
          if (data.code == 1) {
          
          } else {
            MessageBox("提示", data.msg);
          }
        })
        .catch(error => {
          MessageBox("提示", "出错");
        });
    },
    GetClubInfo() {
      let getInfoData = {
        params: {
          functionname: "GetClubInfo",
          body: JSON.stringify({
            nClubId: parseInt(this.id)
          })
        }
      };
      this.$http
        .get(`${this.baseUrl}/Main/GetData`, getInfoData)
        .then(response => {
          let data = response.data;
          if (data.code == 1) {
            this.club = data.body;
          } else {
            MessageBox("提示", data.msg);
          }
        })
        .catch(error => {
          MessageBox("提示", "出错了");
        });
    },
    getAcess() {
      let that = this;
      let getAcess = {
        params: {
          functionname: "GetClubAuth",
          body: JSON.stringify({
            nClubId: parseInt(this.id)
          })
        }
      };
      this.$http
        .get(`${this.baseUrl}/Main/GetData`, getAcess)
        .then(response => {
          //   console.log(response)
          let data = response.data;
          if (data.code == 1) {
            that.position = data.body.position;
            // if (that.agentLevel == 2) {
            //   that.access = JSON.parse(data.body.access);
            // }
          } else {
            MessageBox("提示", data.msg);
          }
        });
    }
  },
  created() {
    this.id = parseInt(this.$route.params.id);
    this.GetClubInfo();
    this.getAcess();
  }
};
</script>
<style lang="scss" scoped>
#memberdetail {
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
      width: 60px;
    }
  }
  .nichen {
    padding-left: 15px;
    flex: 1;
    color: #aca1a1;
    font-size: 16px;
    white-space: nowrap;
    overflow: hidden;
  }
}
.ge {
  width: 100%;
  height: 25px;
  background: #eeeeee;
}
.noimg {
}
</style>


