import vue from 'vue'

const state = {
    orderList: [],
    params: {}
}

const getters = {
    getOrderList: state => state.orderList
}
const actions = {
        /**
         * 异步请求
         */

        fetchOrderList({ commit, state }) {
            vue.$http.post('/getOrderList', state.params)
                .then((res) => {
                    /**
                     * 同步方法用commit，
                     * 异步方法用dispatch  再外部this.$store.dispatch("fetchOrderList  ")
                     */
                    commit('updataOrderList', res.data.list);

                }, err() = {


                })
        }
    }
    /**
     * mutations  是同步的状态修改
     */
const mutations = {
    changeOrderList(state, orderList) {
        state.orderList = orderList;
    }
}

export default {
    state,
    getters,
    actions,
    mutations

}