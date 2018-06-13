
<template>
    <div id="datastatic">
        <mt-header title="我的玩家" :fixed="true">
            <!-- <mt-button icon="more" slot="right"></mt-button> -->
        </mt-header>
        <div class="nav">
            <div class="record">
                <ul class="list clearfix" :style="{width:120*recordList.length+'px'}">
                    <li v-for="(item,index) in recordList" :key="index" :class="selectedNum==index?'active':''" @click="selectedNum=index"> <span>{{item.title}}</span></li>
                </ul>
            </div>
            <!-- <div class="jt">
                >>
            </div> -->
        </div>
        <mt-tab-container v-model="selectedNum">
            <mt-tab-container-item :id="0">
                <UserQuery :isCurrent="selectedNum==0"></UserQuery>
            </mt-tab-container-item>
            <mt-tab-container-item :id="1">
                <ConsumptionLog :isCurrent="selectedNum==1"></ConsumptionLog>
            </mt-tab-container-item>
            <mt-tab-container-item :id="2">
                <BuyLog :isCurrent="selectedNum==2"></BuyLog>
            </mt-tab-container-item>
            
        </mt-tab-container>
    </div>
</template>
<script>
    export default {
        name: "datastatic",
        components: {
            
            UserQuery: resolve => require(['./UserQuery'], resolve),
            ConsumptionLog: resolve => require(['./ConsumptionLog'], resolve),
            BuyLog: resolve => require(['./BuyLog'], resolve)
        },
        data() {
            return {
                selectedNum: 0,
                currentTab: 0,
                recordList: [
                    {id: 1,title: "玩家列表",typeid: 1001}, 
                    {id: 2,title: "消耗记录",typeid: 1002},
                    {id: 3,title: "购买记录",typeid: 1003}
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
        padding: 2px 0;
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
            width: 120px;
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



