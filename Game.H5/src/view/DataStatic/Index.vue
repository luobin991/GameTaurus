<template>
    <div id="datastatic">
        <mt-header title="数据统计" :fixed="true">
            <!-- <mt-button icon="more" slot="right"></mt-button> -->
        </mt-header>
        <div class="nav">
            <div class="record">
                <ul class="list clearfix" :style="{width:130*recordList.length+'px'}">
                    <li v-for="(item,index) in recordList" :key="index" :class="selectedNum==index?'active':''" @click="selectedNum=index"> <span>{{item.title}}</span></li>
                </ul>
            </div>
            <div class="jt">
                >>
            </div>
        </div>
        <mt-tab-container v-model="selectedNum">
            <mt-tab-container-item :id="0">
                <system-give :isCurrent="selectedNum==0"></system-give>
            </mt-tab-container-item>
            <mt-tab-container-item :id="1">
                <donation-record :isCurrent="selectedNum==1"></donation-record>
            </mt-tab-container-item>
            <mt-tab-container-item :id="2">
                <give-record :isCurrent="selectedNum==2"></give-record>
            </mt-tab-container-item>
            <mt-tab-container-item :id="3">
                <user-query :isCurrent="selectedNum==3"></user-query>
            </mt-tab-container-item>
            <mt-tab-container-item :id="4">
                <bai-fen-cheng :isCurrent="selectedNum==4"></bai-fen-cheng>
            </mt-tab-container-item>
            <mt-tab-container-item :id="5">
                <bai-data :isCurrent="selectedNum==5"></bai-data>
            </mt-tab-container-item>
            <mt-tab-container-item :id="6">
                <winner-fen :isCurrent="selectedNum==6"></winner-fen>
            </mt-tab-container-item>
            <mt-tab-container-item :id="7">
                <friend :isCurrent="selectedNum==7"></friend>
            </mt-tab-container-item>
            <mt-tab-container-item :id="8">
                <jifen-change :isCurrent="selectedNum==8"></jifen-change>
            </mt-tab-container-item>
            <mt-tab-container-item :id="9">
                <tui-static :isCurrent="selectedNum==9"></tui-static>
            </mt-tab-container-item>
        </mt-tab-container>
    </div>
</template>
<script>
    // import DonationRecord from './DonationRecord'
    // import UserQuery from './UserQuery'
    // import GiveRecord from './GiveRecord'
    // import BaiFenCheng from './BaiFenCheng'
    // import BaiData from './BaiData'
    // import WinnerFen from './WinnerFen'
    // import Friend from './Friend'
    export default {
        name: "datastatic",
        components: {
            DonationRecord: resolve => require(['./DonationRecord'], resolve),
            UserQuery: resolve => require(['./UserQuery'], resolve),
            GiveRecord: resolve => require(['./GiveRecord'], resolve),
            BaiFenCheng: resolve => require(['./BaiFenCheng'], resolve),
            BaiData: resolve => require(['./BaiData'], resolve),
            WinnerFen: resolve => require(['./WinnerFen'], resolve),
            Friend: resolve => require(['./Friend'], resolve),
            SystemGive: resolve => require(['./SystemGive'], resolve),
            JifenChange: resolve => require(['./JifenChange'], resolve),
            TuiStatic: resolve => require(['.//TuiStatic'], resolve),
        },
        data() {
            return {
                selectedNum: 0,
                currentTab: 0,
                recordList: [
                    {id: 1,title: "系统赠送",typeid: 1001}, 
                    {id: 2,title: "扣除记录",typeid: 1002},
                    {id: 3,title: "赠送记录",typeid: 1003},
                    {id: 4,title: "玩牌局数",typeid: 1004},
                    {id: 5,title: "百人服务费统计",typeid: 1005},
                    {id: 6,title: "百人牌局统计",typeid: 1006},
                    {id: 7,title: "六人场服务费统计",typeid: 1007},
                    {id: 8,title: "六人牌局统计",typeid: 1008},
                    {id: 9,title: "用户积分变更",typeid: 1009},
                    {id: 10,title: "推广统计",typeid: 1010}
                ]
            }
        },
        methods: {},
        created() {},
        mounted() {}
    }
</script>

<style lang="scss" scoped>
    .mint-field-core {
        color: #929090;
    }
    #datastatic {
        padding-top: 40px;
    }
    .record {
        padding: 10px 0;
        overflow-y: hidden;
        overflow-x: scroll;
    }
    .list {
        background: #fff;
        white-space: nowrap; //处理块元素中的空白符和换行  
        overflow: hidden;
        display: block;
        width: 900px;
        li {
            float: left;
            width: 130px;
            padding: 10px 15px;
            font-size: 14px;
            text-align: center;
            color: #0d31e8;
            box-sizing: border-box;
            &.active {
                background: green;
                text-align: center;
                color: #fff;
                font-weight: 700;
            }
            button {
                background: transparent;
                padding: 10px 15px;
            }
        }
    }
    .nav {
        display: flex;
        align-items: center;
        .record {
            flex: 1;
        }
        .jt {
            width: 40px;
            text-align: center;
            color: #047ad8;
            font-size: 18px;
        }
    }
     ::-webkit-scrollbar-track,
     ::-webkit-scrollbar-thumb {
        border-radius: 999px;
        border: 0px solid transparent;
    }
     ::-webkit-scrollbar-track {
        box-shadow: 1px 1px 5px rgba(49, 49, 49, 0.2) inset;
    }
     ::-webkit-scrollbar-thumb {
        min-height: 20px;
        background-clip: content-box;
        box-shadow: 0 0 0 5px rgba(6, 31, 173, 0.5) inset;
    }
     ::-webkit-scrollbar-corner {
        background: transparent;
    }
     ::-webkit-scrollbar-track-piece {
        background-color: rgba(0, 0, 0, 0);
        border-left: 1px solid rgba(0, 0, 0, 0);
    }
</style>

