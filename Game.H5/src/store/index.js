import Vue from 'vue'
import Vuex from 'vuex'
import * as getters from './getters'
import * as mutations from './mutations'
import * as actions from './ations'
import user from "./modules/user";
Vue.use(Vuex)

const state = {
    count: 0,
    isPass: true,
    time: new Date().getTime(),
    userName: "",
    passWord: "",
    msg: "",
    showMsg: false,
    userInfo: {
        a: 1
    },
    clubList: [

    ]
}

const store = new Vuex.Store({
    modules: {
        user: user
    },
    state,
    mutations,
    actions,
    getters
})

export default store