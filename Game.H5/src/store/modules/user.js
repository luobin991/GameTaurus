import vue from 'vue'

const state = {
    nLevel: 1, //登录人的等级

}

const getters = {
    getOrderList: state => state.orderList
}
const actions = {
        /**
         * 异步请求
         */

        fetchOrderList({
            commit,
            state
        }) {
            // vue.$http.post('/getOrderList', state.params)
            //     .then((res) => {
            //         /**
            //          * 同步方法用commit，
            //          * 异步方法用dispatch  再外部this.$store.dispatch("fetchOrderList  ")
            //          */
            //         commit('updataOrderList', res.data.list);

            //     }, err() = {


            //     })
        }
    }
    /**
     * mutations  是同步的状态修改
     */
const mutations = {
    //修改代理Id
    editAgentId(state, value) {
        state.agentId = value.agentId;
    },
    //修改钻石预警
    editPrompt(state, value) {
        state.prompt = value.prompt;
    },
    //修改提现金额
    editBalance(state, value) {
        state.balance = state.balance - value.balance;

    },
    //修改钻石数量
    editBalanceMoney(state, value) {
        state.balanceMoney = state.balanceMoney - value.balanceMoney;
    },

}

export default {
    state,
    getters,
    actions,
    mutations

}