<template>
    <div id="datastatic">
        <div class="record">
            <div class="selectedtype">
                <div class="label"><label for="">俱乐部：</label></div>
                <div class="selectedlist"><button :class="gameId==1001?'active':''" @click="chooseGameId(1001)">俱乐部1</button> <button :class="gameId==1002?'active':''" @click="chooseGameId(1002)">俱乐部2</button> <button :class="gameId==1003?'active':''" @click="chooseGameId(1003)">俱乐部3</button></div>
            </div>
            <div class="selectedtype">
                <div class="label"><label for="">记录类型：</label></div>
                <div class="selectedlist"><button :class="recordType==2001?'active':''" @click="chooseRecordId(2001)">百人场分成</button> <button :class="recordType==2002?'active':''" @click="chooseRecordId(2002)">积分赠送</button> <button :class="recordType==2003?'active':''" @click="chooseRecordId(2003)">捐赠记录</button>                <button :class="recordType==2004?'active':''" @click="chooseRecordId(2004)">赢家分成</button> <button :class="recordType==2005?'active':''" @click="chooseRecordId(2005)">好友分成</button> <button :class="recordType==2006?'active':''" @click="chooseRecordId(2006)">俱乐部1</button></div>
            </div>
            <div class="selectedtype">
                <div class="label"><label for="">时间：</label></div>
                <div class="selectedlist"><button :class="timeType==3001?'active':''" @click="chooseTimeType(3001)">今天</button> <button :class="timeType==3002?'active':''" @click="chooseTimeType(3002)">3天内</button> <button :class="timeType==3003?'active':''" @click="chooseTimeType(3003)">7天内</button>                <button :class="timeType==3004?'active':''" @click="chooseTimeType(3004)">15天内</button> <button :class="timeType==3005?'active':''" @click="chooseTimeType(3005)">1个月</button> <button :class="timeType==3006?'active':''" @click="chooseTimeType(3006)">全部</button></div>
            </div>
        </div>
    </div>
</template>
<script>
import _ from 'lodash'; //引入lodash
import axios from 'axios' //引入axios
let sources = [];
    export default {
        name: "datastatic",
        data() {
            return {
                gameId: 1001,
                recordType: 2001,
                timeType: 3001
            }
        },
        methods: {
            chooseGameId(id) {
                this.gameId = id
            },
            chooseRecordId(id) {
                this.recordType = id
            },
            chooseTimeType(id) {
                this.timeType = id
            },
            //使用_.debounce控制搜索的触发频率
            //准备搜索
            search: _.debounce(
                function() {
                    let that = this;
                    //删除已经结束的请求
                    _.remove(sources, function(n) {
                        return n.source === null;
                    });
                    //取消还未结束的请求
                    sources.forEach(function(item) {
                        if (item !== null && item.source !== null && item.status === 1) {
                            item.status = 0;
                            item.source.cancel('取消上一个')
                        }
                    });
                    //创建新的请求cancelToken,并设置状态请求中
                    var sc = {
                        source: axios.CancelToken.source(),
                        status: 1 //状态1：请求中，0:取消中
                    };
                    //这个对象加入数组中
                    sources.push(sc);　　　　　　 //开始搜索数据，yourhttp替换成你自己的请求路径
                    axios.get('yourhttp', {
                        cancelToken: sc.source.token
                    }).then(function(res) {
                        //请求成功
                        sc.source = null; //置空请求canceltoken
                        //TODO这里处理搜索结果
                        console.log(res.data);
                        that.result = res.data;
                    }).catch(function(thrown) {
                        //请求失败
                        sc.source = null; //置空请求canceltoken
                        //下面的逻辑其实测试用
                        if (axios.isCancel(thrown)) {
                            console.log('Request canceled', thrown.message);
                        } else {
                            //handle error
                        }
                    });
                },
                500 //空闲时间间隔设置500ms
            )
        },
        created() {},
        mounted() {}
    }
</script>

<style lang="scss" scoped>
    .record {
        padding: 10px 0;
    }
    .selectedtype {
        display: flex;
        padding: 0px 0 5px 0;
        align-items: flex-start;
        .label {
            padding-right: 10px;
            text-align: right;
            width: 80px;
            font-size: 13px;
            padding: 6px;
        }
        .selectedlist {
            flex: 1;
            align-items: flex-start;
            button {
                background: transparent;
                padding: 4px;
                font-size: 12px;
                margin-bottom: 6px;
                margin-right: 6px;
                &.active {
                    background: green;
                    border-radius: 5px;
                    color: #fff;
                }
            }
        }
    }
</style>

