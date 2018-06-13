<template>
    <div id="chargelogdetail">
          <mt-header title="俱乐部收费明细" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
            <mt-button icon="more" slot="right" v-if="false" @click.native="toolShow=!toolShow"></mt-button>
        </mt-header>
        
        <div class="result">
            <div class="head">查询结果</div>
            <div class="hasresult">
                <div class="record" :key="index" v-for="(item,index) in group.arr" @click="showInput(index)">
                    <div style="flex:1"><span class="title">玩家</span><br/><span>{{item.nickName}}</span></div>
                    <div style="flex:1"><span class="title">时间</span><br/><span>{{item.createTimeStr}}</span></div>
                    <div style="flex:1"><span class="title">耗钻</span><br/><span>{{(item.diamond)}}</span></div>
                    <div style="flex:1"><span class="title">类型</span><br/><span>{{(item.type==6?"消耗":"返还")}}</span></div>
                </div>
                <div v-if=" group.arr.length==0" class="noresult">
                    无记录
                </div>
                <div v-if=" group.arr.length>0">
                    <div style="margin:10px 0px">
                        <mt-button type="primary" size="large" @click.native="loadMore" v-if=" group.nextPage< group.totalPages">加载更多</mt-button>
                        <mt-button type="default" size="large" v-else>已无更多数据</mt-button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { MessageBox } from "mint-ui";
export default {
  name: "bairenfenchen",
  props: {
    isCurrent: {
      type: Boolean
    }
  },
  watch: {
    isCurrent: function(curVal, oldVal) {
      if (curVal && this.group.arr.length == 0) {
        // MessageBox("提示", "网络请求中")
      }
    }
  },
  data() {
    return {
      starttime: 0,
      clubid: "",
      roomNum:0,
      group: {
        arr: [],
        totalCount: 0,
        nextPage: 0,
        totalPages: 0
      }
    };
  },
  methods: {
    setClubgamestatue(value) {
      let that = value;
      let getInfoData = {
        functionname: "SetClubCharge",
        body: JSON.stringify({
          nClubID: that.clubid,
          roomNum: that.roomNum
        })
      };
      this.$http
        .post(`${this.baseUrl}/Main/PostData`, getInfoData)
        .then(response => {
          let data = response.data;
          if (data.code == 1) {
            MessageBox("提示", data.msg);
          } else {
            MessageBox("提示", data.msg);
          }
        })
        .catch(error => {
          MessageBox("提示", "出错");
        });
    },
    loadMore() {
      let getData = {
        params: {
          functionname: "GetClubChargeDetail",
          body: JSON.stringify({
            nClubID: this.clubid,
            roomNum:this.roomNum,
            pageIndex: this.group.nextPage,
            pageSize: this.PAGESIZE
          })
        }
      };
      this.getList(getData);
    },
    getList: function(getData) {
      let that = this;
      this.$http.get(`${this.baseUrl}/Main/GetData`, getData).then(response => {
        let data = response.data;
        if (data.code == 1) {
          that.group.arr = that.group.arr.concat(data.body);
          that.group.nextPage = that.group.nextPage + 1;
          that.group.totalPages = Math.ceil(data.totalCount / that.PAGESIZE);
          that.group.totalCount = data.totalCount;
          // console.log(data);
        } else {
          MessageBox("提示", data.msg);
        }
      });
    },
    search() {
      this.group = {
        arr: [],
        totalCount: 0,
        nextPage: 0,
        totalPages: 0
      };
      let getData = {
        params: {
          functionname: "GetClubChargeDetail",
          body: JSON.stringify({
            nClubID: this.clubid,
            roomNum:this.roomNum,
            pageIndex: this.group.nextPage,
            pageSize: this.PAGESIZE
          })
        }
      };
      this.getList(getData);
    }
  },
  created() {
    this.roomNum = this.$route.query.roomNum;
    this.clubid = this.$route.query.clubId;
    this.loadMore();
  },
  mounted() {}
};
</script>

<style lang="scss" scoped>
#chargelogdetail {
  padding-top: 20px;
}
.mint-field-core {
  color: #929090;
}
.record {
  display: flex;
  margin-top: 14px;
  background: #fff;
  & > div {
    overflow: hidden;
    padding: 10px 0;
    padding-left: 5px;
    font-size: 12px;
    line-height: 2;
    color: #9e9e9e;
    text-align: center;
    .title {
      color: #634747;
    }
    & > i {
      font-size: 12px;
    }
  }
}
.picker {
  position: fixed;
  width: 100%;
  bottom: 0px;
  z-index: 111;
  background: #fff;
}
.select {
  padding: 10px 10px;
  display: flex;
  background: #fff;
  font-size: 16px;
  label {
    width: 105px;
  }
  select {
    color: #9c9292;
    background: #fff;
    flex: 1;
    font-size: 16px;
  }
}
</style>


