<template>
    <div id="bairenfenchen">
        <div class="select">
            <label>俱乐部选择</label>
            <select v-model="selectOne">
                             <option :value="-1"  selected>点击选择 -- 俱乐部</option>
                             
                             <option :value="item.nClubID" :key='index' v-for="(item,index) in  $store.state.clubList">{{item.szClubName}}</option>
                             </select>
        </div>
        <div @click="open">
            <mt-field label="起始时间" :disableClear="true" :readonly="true" placeholder="点击选择时间" :state="startTimestr==''?'warning':''" v-model.trim="startTimestr"></mt-field>
        </div>
        <div @click="open2">
            <mt-field label="结束时间" :disableClear="true" :readonly="true" placeholder="点击选择时间" :state="endTimestr==''?'warning':''" v-model.trim="endTimestr"></mt-field>
        </div>
        <div style="padding:15px 10px;">
            <mt-button type="danger" size="large" @click.native="search">查询</mt-button>
        </div>
        <div class="result" v-show="hasClick">
            <div class="head">查询结果</div>
            <div class="hasresult">
                <div class="record" :key="index" v-for="(item,index) in group.arr">
                    <div style="width:90px;"><span class="title">日期</span><br/><span>{{item.tEndTime}}</span></div>
                    <div style="width:79px"><span class="title"> 服务费比例</span><br/><span>{{item.nTaxRateBig/10}}%</span></div>
                    <!--  <div style="width:70px"><span class="title"> 俱乐部占比</span><br/><span>{{(item.nBigRoomRoyaltyRate/10)}}%</span></div>
                            <div style="width:60px"><span class="title"> 官方占比</span><br/><span>{{100-(item.nBigRoomRoyaltyRate/10)}}%</span></div>
                            -->
                    <div style="flex:1"><span class="title">服务费数额</span><br/><span>{{(item.nTotalbet)}}</span></div>
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
    import {
        MessageBox
    } from 'mint-ui'
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
                endtime: 0,
                startDate: new Date('2017-01-01'), //时间选择器最小的时间
                endDate: new Date(), //时间选择器最大时间
                startTimestr: "",
                endTimestr: "",
                clubid: "",
                userid: "",
                selected: "1",
                selectOne: '-1',
                hasClick: false,
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
            open() {
                this.$refs.picker.open();
            },
            open2() {
                this.$refs.pickerend.open();
            },
            handleConfirmS(time) {
                this.starttime = time;
                this.startTimestr = this.formateTimeObj(time) + " 00:00:00";
                // console.log(this.startTimestr);
            },
            handleConfirmE(time) {
                this.endtime = time;
                this.endTimestr = this.formateTimeObj(time) + " 23:59:59";
                // console.log(this.endTimestr);
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
                        'functionname': "GetBaiRenFenChStatis",
                        body: JSON.stringify({
                            startDate: this.startTimestr,
                            endDate: this.endTimestr,
                            pageIndex: this.group.nextPage,
                            pageSize: this.PAGESIZE,
                            nClubID: parseInt(this.selectOne)
                        })
                    }
                }
                //  console.log(getData);
                this.getList(getData);
            },
            getList: function(getData) {
                let that = this;
                this.$http.get(`${this.baseUrl}/Main/GetData`, getData).then(response => {
                    let data = response.data;
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
                if (this.startTime == "") {
                    MessageBox("提示", "起始时间不能为空");
                    return false;
                }
                if (this.endTime == "") {
                    MessageBox("提示", "结束时间不能为空");
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
                        'functionname': "GetBaiRenFenChStatis",
                        body: JSON.stringify({
                            startDate: this.startTimestr,
                            endDate: this.endTimestr,
                            pageIndex: this.group.nextPage,
                            pageSize: this.PAGESIZE,
                            nClubID: parseInt(this.selectOne)
                        })
                    }
                }
                // console.log(getData);
                this.getList(getData)
            },
        },
        created() {},
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


