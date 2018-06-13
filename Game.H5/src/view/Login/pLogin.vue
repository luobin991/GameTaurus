<template>
  <div id="login">
    <div class="container">
    
     
    </div>
  </div>

<!-- <remote-js src="https://g.alicdn.com/dingding/dinglogin/0.0.2/ddLogin.js"></remote-js> -->

</template>

<script>
import { MessageBox } from "mint-ui";
export default {
  name: "pLogin",
  data() {
    return {
      user: "",
      session: ""
    };
  },
  methods: {
    PostLogin() {
      let getInfoData = {
        user: this.user,
        session: this.session
      };
      
      this.$http
        .post(`${this.baseUrl}/login/PostLogin`, getInfoData)
        .then(response => {
          let data = response.data;
          if (data.code == 1) {
            //写入浏览器session 存储
            //that.$store.state.userName = that.userAccount;
            sessionStorage.setItem("NIUNIUTICKET", data.body.access_token);
            this.$router.push("/");
          } else {
            MessageBox("提示", data.msg);
          }
        })
        .catch(error => {});
    }
  },
  created() {
    this.user = this.$route.query.user;
    this.session = this.$route.query.session;
    this.PostLogin();
  }
};
</script>