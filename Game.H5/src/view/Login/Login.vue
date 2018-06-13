<template>
  <div id="login">
    <div class="container">
      <div class="img"><img src="./../../assets/images/LOGO.png" alt=""></div>
      <mt-field label="账号" placeholder="账号" class="nobckimg" :disableClear="true" :state="userAccount!=''? '':'warning'" v-model.trim="userAccount" ></mt-field>
      <!-- <mt-field label="密码" placeholder="密码" :disableClear="true" type="password" :state="userPass!=''? '':'warning'" v-model.trim="userPass"></mt-field> -->
      <mt-field label="验证码" v-model="captcha" :disableClear="true">
        <img :src="`data:image/png;base64,${verificaCode}`" @click="getCode" height="45px" width="100px">
      </mt-field>
      <div class="loginBtn">
        <mt-button type="primary" size="large" @click.native="loginFn">登录</mt-button>
      </div>
    </div>
  </div>

<!-- <remote-js src="https://g.alicdn.com/dingding/dinglogin/0.0.2/ddLogin.js"></remote-js> -->

</template>

<script>

  import {
    MessageBox
  } from 'mint-ui';
  export default {
    name: "login",

     components: {
     'dingtalk': {
      render(createElement) {
        return createElement(
          'script',
          {
            attrs: {
              type: 'text/javascript',
              src: 'http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js',
            }
          }
        );
      }}},


    data() {
      return {
        userAccount:"13000000000",
        userPass: "123123",
        captcha: '',
        srcpic: '',
        verificaCode: '0000',
        verificaCode1: ''
      };
    },
    methods: {
      //获取用户的信息
      getInfo: function() {
        let getInfoData = {
          params: {
            'functionname': "getagentinfo"
          }
        }
        this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
          let data = response.data;
          if (data.code == 1) {
            this.$store.state.user = data.body;
            sessionStorage.setItem("info", JSON.stringify(this.$store.state.user))
          } else {
            MessageBox('提示', data.msg);
          }
        }).catch(error => {
          MessageBox("提示", "出错了")
        })
      },
      loginFn: function() {
        let that = this;
        if (this.userAccount == "") {
          MessageBox('提示', "账号不能为空!");
          return false;
        }
        if (this.userPass == "") {
          MessageBox('提示', "密码不能为空");
          return false;
        }
        if (this.captcha == "") {
          MessageBox('提示', "验证码不能为空");
          return false;
        }
        let loginData = {
          userName: this.userAccount,
          userPwd: this.userPass,
          verificaCode: this.captcha,
          verificaCode1: this.verificaCode1
        }
        // console.log(loginData);
        this.$http.post(`${this.baseUrl}/login/userlogin`, loginData).then(response => {
          let data = response.data;
          //  console.log(data)
          if (data.code == 1) {
            //写入浏览器session 存储
            that.$store.state.userName = that.userAccount;
            sessionStorage.setItem('NIUNIUTICKET', data.body.access_token);
            this.$router.push('/');
          } else {
            MessageBox("提示", data.msg)
          }
        }).catch(error => {})
      },
      getCode() {
        let that = this;
        this.$http.get(`${this.baseUrl}/login/Verify_Code`).then(response => {
          //console.log(response);
          let data = response.data;
          //data = JSON.parse(data);
          if (data.code == 1) {
            that.verificaCode = data.verificaCode;
            that.verificaCode1 = data.verificaCode1;
          } else {
            console.log(data.msg)
          }
        })
      },
      refshPic() {
        this.srcpic = `${this.baseUrl}/login/Verify_Code?v=` + (new Date()).getTime();
        //  console.log(this.srcpic);
      },
    
    },
    created() {
      this.getCode()
    }
  };
</script>

<style lang="scss" scoped>
  #login {
    .banben {
      position: fixed;
      left: 0;
      bottom: 20px;
      font-size: 12px;
      display: block;
      width: 100%;
      color: #788278;
      text-align: center;
      letter-spacing: 2px;
    }
    position: fixed;
    left: 50%;
    transform: translateX(-50%);
    -webkit-transform: translateX(-50%);
    top: 0;
    width: 100%;
    min-width: 320px;
    max-width: 640px;
    margin: 0 auto;
    height: 100%;
    display: flex;
    align-items: center;
    align-content: center;
    background: #ece6d6;
    z-index: 1100;
    .container {
      margin: 0 auto;
      padding: 30px 10px 30px 10px;
      .loginBtn {
        margin-top: 30px;
      }
    }
  }
  .img {
    width: 50%;
    margin: 0 auto 25px auto;
    img {
      display: block;
      width: 100%;
    }
  }
  .mint-button--default {
    background: green;
    float: right;
    color: #fff;
    a {
      display: block;
      width: 100%;
    }
  }
</style>
