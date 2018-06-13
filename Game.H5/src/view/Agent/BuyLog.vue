<template>
    <div id="ConsumptionLog">
        <mt-field label="用户ID" placeholder="用户ID" v-model.trim="userid"></mt-field>
         <div @click="open">
            <mt-field label="起始时间" :disableClear="true" :readonly="true" placeholder="点击选择时间" :state="startTimestr==''?'warning':''" v-model.trim="startTimestr"></mt-field>
        </div>
        <div @click="open2">
            <mt-field label="结束时间" :disableClear="true" :readonly="true" placeholder="点击选择时间" :state="endTimestr==''?'warning':''" v-model.trim="endTimestr"></mt-field>
        </div>
        <div style="padding:15px 10px;">
            <mt-button type="danger" size="large" @click.native="search"  >查询</mt-button>
        </div>
        <div class="result"  v-show="hasClick">
            <div class="head">查询结果 <div style="float:right"> <span class="title">总额：</span><span> {{this.sum}}</span></div></div>
            <div class="hasresult">
                <div class="record" :key="index" v-for="(item,index) in group.arr">
                    <div style="flex:1"><span class="title">ID</span><br/><span>{{item.userId}}</span></div> 
                    <div style="flex:1"><span class="title">昵称</span><br/><span>{{item.nickName}}</span></div> 
                    <div style="flex:1"><span class="title">钻石</span><br/><span>{{item.changedDiamond}}</span></div>
                    <div style="flex:1;"><span class="title">日期</span><br/><span>{{item.time}}</span></div>
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
        <mt-datetime-picker ref="picker" type="date" :startDate="startDate" :endDate="endDate" year-format="{value}年" month-format="{value}月" date-format="{value}日" v-model.trim="starttime" @confirm="handleConfirmS">
        </mt-datetime-picker>
        <mt-datetime-picker ref="pickerend" type="date" :startDate="startDate" :endDate="endDate" year-format="{value}年" month-format="{value}月" date-format="{value}日" v-model.trim="endtime" @confirm="handleConfirmE">
        </mt-datetime-picker>
    </div>
</template>
<script>
import { MessageBox } from "mint-ui";
export default {
  name: "ConsumptionLog",
  props: {
    isCurrent: {
      type: Boolean
    }
  },
  watch: {
    isCurrent: function(curVal, oldVal) {
      if (curVal && this.group.arr.length == 0) {
        console.log("开始网络请求");
      }
    }
  },
  data() {
    return {
      starttime: 0,
      endtime: 0,
      startDate: new Date("2017-01-01"), //时间选择器最小的时间
      endDate: new Date(), //时间选择器最大时间
      startTimestr: "",
      endTimestr: "",
      userid: "",
      hasClick: false,
      sum:0,
      group: {
        arr: [],
        totalCount: 0,
        nextPage: 0,
        totalPages: 0
      }
    };
  },
  methods: {
    onValuesChange(picker, values) {
      if (values[0] > values[1]) {
        picker.setSlotValue(1, values[0]);
      }
    },
    open() {
      this.$refs.picker.open();
    },
    open2() {
      this.$refs.pickerend.open();
    },
    handleConfirmS(time) {
      this.starttime = time;
      this.startTimestr = this.formateTimeObj(time) + " 00:00:00";
    },
    handleConfirmE(time) {
      this.endtime = time;
      this.endTimestr = this.formateTimeObj(time) + " 23:59:59";
    },
    formateTimeObj: function(obj) {
      let Y = obj.getFullYear();
      let M = obj.getMonth() + 1;
      let D = obj.getDate();
      if (M < 10) {
        M = "0" + M;
      }
      if (D < 10) {
        D = "0" + D;
      }
      return `${Y}-${M}-${D}`;
    },
    loadMore() {
      let getData = {
        params: {
          functionname: "GetLowerUserBuyDiamond",
          body: JSON.stringify({
            userid: this.userid,
            pageIndex: this.group.nextPage,
            pageSize: this.PAGESIZE,
            startTimestr:this.startTimestr,
            endTimestr:this.endTimestr
          })
        }
      };
      this.getList(getData);
    },
    getList: function(getData) {
      let that = this;
      this.$http.get(`${this.baseUrl}/Main/GetData`, getData).then(response => {
        let data = response.data;
        that.hasClick = true;
        if (data.code == 1) {
          that.group.arr = that.group.arr.concat(data.body.list);
          this.sum =data.body.sum;
          that.group.nextPage = that.group.nextPage + 1;
          that.group.totalPages = Math.ceil(data.totalCount / that.PAGESIZE);
          that.group.totalCount = data.totalCount;
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
          functionname: "GetLowerUserBuyDiamond",
          body: JSON.stringify({
            userid: this.userid,
            pageIndex: this.group.nextPage,
            pageSize: this.PAGESIZE,
            startTimestr:this.startTimestr,
            endTimestr:this.endTimestr
          })
        }
      };
      this.getList(getData);
    }
  },
  created() {
    // this.search()
  },
  mounted() {}
};
</script>

<style lang="scss" scoped>
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


