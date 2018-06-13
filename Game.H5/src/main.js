// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.

import Vue from 'vue'
import App from './App'
import router from './router'
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
import ('./assets/css/base.css')
import store from "./store/"
import "./api/axious";


Vue.use(MintUI)
Vue.config.productionTip = true
    //const FastClick = require("fastclick");
    //FastClick.attach(document.body);
//const baseUrl = "http://niunium.net456.cn/api"

//const baseUrl='http://localhost:8017/api'
//const baseUrl = 'http://192.168.0.157:8017/api'
const baseUrl = 'http://192.168.0.150:8013/api'
//const baseUrl = 'http://119.23.154.14:8882/api' //预定测试外网api地址

Vue.prototype.baseUrl = baseUrl;
Vue.prototype.SETTIME = 3000;
Vue.prototype.PAGESIZE = 10;
Vue.prototype.re = /^[0-9]+.?[0-9]*$/;




// 将API方法绑定到全局
Vue.config.productionTip = true; //开启编译提示

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    store,
    template: '<App/>',
    components: { App }
})