import Vue from "vue";
import axios from "axios";
import qs from "qs";
//import { Indicator } from 'mint-ui';
axios.defaults.timeout = 10000;
//axios.defaults.baseURL = "http://119.23.148.24:39091/api/";
//axios.defaults.baseURL = "http://192.168.0.220:8010/api/";
//application/x-www-form-urlencoded


axios.interceptors.request.use(

    config => {
        config.data = qs.stringify(config.data);
        config.headers["Content-Type"] = "application/x-www-form-urlencoded";
        config.headers.Ticket = sessionStorage.getItem('NIUNIUTICKET');
        // config.headers["X-Auth-Token"] = `token ${a}`;
        // console.log(config)
        // config.headers = {
        //     "Content-Type": "application/x-www-form-urlencoded"
        // };
        // console.log(config)
        // Indicator.open({
        //     text: '加载中...',
        //     spinnerType: 'fading-circle'
        // })

        return config;
    },
    err => {
        return Promise.reject(err);
    }
);

/**
 * http response 拦截器
 *
 */

axios.interceptors.response.use(

    response => {
        // console.log('end')
        //  Indicator.close();
        if (response.data.errCode == 2) {
            // router.push({
            //     path: "/login",
            //     query: { redirect: router.currentRoute.fullPath }
            // });
        } else if (response.data.errCode == 500) {
            console.log("code:500");
        }
        // console.log(response.data);
        return response;
    },
    error => {
        if (error.response) {
            switch (error.response.status) {
                case 401:
                    //500 服务器错误
                    console.log("401服务器错误");
                    // router.replace({
                    //     path: '/error',
                    //     query: { redirect: router.currentRoute.fullPath, title: "哎呀,服务器开小差了！(*^__^*) ", code: "404" }
                    // })
                    break;
                case 404:
                    //500 服务器错误
                    console.log("404服务器错误");
                    // router.replace({
                    //     path: '/error',
                    //     query: { redirect: router.currentRoute.fullPath, title: "哎呀,服务器开小差了！(*^__^*) ", code: "404" }
                    // })
                    break;
                case 500:
                    //500 服务器错误
                    // router.replace({
                    //     path: '/error',
                    //     query: { title: "哎呀,服务器开小差了！(*^__^*) ", code: "500" }
                    // })
                    break;
                default:
                    // router.replace({
                    //     path: '/error',
                    //     query: { title: "哎呀,服务器开小差了！(*^__^*) ", code: error.response.status }
                    // })
            }
        }
        return Promise.reject(error);
    }
);
/**
 * 上面是axios的默认配置
 */
Vue.prototype.$http = axios;