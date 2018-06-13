<template>
    <div id="userquery">
        <div class="select">
            <label>俱乐部选择</label>
            <select v-model="selectOne">
                 <option :value="-1"  selected>点击选择 -- 俱乐部</option>
                 <option :value="item.nClubID" :key='index' v-for="(item,index) in  $store.state.clubList">{{item.szClubName}}</option>
                 </select>
        </div>
        <mt-field label="用户id" placeholder="用户id" :disableClear="true" v-model.trim="userid"></mt-field>
        <div style="padding:15px 10px;">
            <mt-button type="danger" size="large" @click.native="search"  >查询</mt-button>
        </div>
        <div class="result"  v-show="hasClick">
            <div class="head">查询结果</div>
            <div class="hasresult">
                <div class="record" :key="index" v-for="(item,index) in group.arr">
                    <div style="width:80px;"><span class="title"><i class="iconfont icon-shijian4"></i>日期</span><br/><span>{{item.tEndTime}}</span></div>
                    <div style="flex:1;overflow:hidden"><span class="title"><i class="iconfont icon-nicheng"></i> 昵称</span><br/><span>{{item.szNickName}}</span></div>
                    <div style="width:80px;"><span class="title">玩牌局数</span><br/><span>{{item.nRound}}</span></div>
                    <div style="width:80px;"><span class="title"> 开房次数</span><br/><span>{{item.nTableIDCount}}</span></div>
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
        <!-- <mt-actionsheet :actions="actions" v-model="sheetVisible">
                                                        </mt-actionsheet> -->
    </div>
</template>
<script>
import {MessageBox} from 'mint-ui'
    export default {
        name: "userquery",
        props: {
            isCurrent: {
                type: Boolean
            }
        },
        watch: {
            isCurrent: function(curVal, oldVal) {
                if (curVal && this.group.arr.length == 0) {
                    console.log("开始网络请求")
                }
            }
        },
        data() {
            return {
                starttime: 0,
                endtime: 0,
                startDate: new Date('2017-01-01'), //时间选择器最小的时间
                endDate: new Date(), //时间选择器最大时间
                startTimestr: "",
                endTimestr: "",
                clubid: "",
                userid: "",
                selected: "1",
                selectOne: '-1',
                   hasClick:false,
                group: {
                    arr: [],
                    totalCount: 0,
                    nextPage: 0,
                    totalPages: 0
                }
            }
        },
       methods: {
            onValuesChange(picker, values) {
                if (values[0] > values[1]) {
                    picker.setSlotValue(1, values[0]);
                }
            },
            loadMore() {
                let getData = {
                    params: {
                        'functionname': "GetClubWanPaiJuShu",
                        body: JSON.stringify({
                            nPlayerId: parseInt(this.userid),
                            nClubID: (this.selectOne),
                            pageIndex: this.group.nextPage,
                            pageSize: this.PAGESIZE,
                        })
                    }
                }
                //   console.log(getData);
                this.getList(getData);
            },
            getList: function(getData) {
                let that = this;
                this.$http.get(`${this.baseUrl}/Main/GetData`, getData).then(response => {
                    let data = response.data;
                   //  console.log(data)
                    that.hasClick = true;
                    if (data.code == 1) {
                        that.group.arr = that.group.arr.concat(data.body);
                        that.group.nextPage = that.group.nextPage + 1;
                        that.group.totalPages = Math.ceil(data.totalCount / that.PAGESIZE);
                        that.group.totalCount = data.totalCount;
                        // console.log(data);
                    } else {
                        MessageBox("提示", data.msg);
                    }
                })
            },
            search() {
                if (this.selectOne == '-1') {
                    MessageBox("提示", "请先选择俱乐部");
                    return false;
                }
                if (this.userid == "") {
                    MessageBox("提示", "用户id不能为空");
                    return false;
                }
                this.group = {
                    arr: [],
                    totalCount: 0,
                    nextPage: 0,
                    totalPages: 0
                }
                let getData = {
                    params: {
                        'functionname': "GetClubWanPaiJuShu",
                        body: JSON.stringify({
                             nPlayerId: parseInt(this.userid),
                            nClubID: (this.selectOne),
                            pageIndex: this.group.nextPage,
                            pageSize: this.PAGESIZE,
                        })
                    }
                }
                 // console.log(getData);
                this.getList(getData)
            },
        },
        created() {
          
            // this.search()
        },
        mounted() {}
    }
</script>

<style lang="scss" scoped>
    .mint-field-core {
        color: #929090;
    }
    .record {
        display: flex;
        margin-top: 14px;
        background: #fff;
        &>div {
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
            &>i {
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


