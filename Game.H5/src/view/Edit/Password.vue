<template>
  <div id="editpass">
    <mt-header fixed title="修改密码">
      <mt-button icon="back" @click.native="$router.go(-1);" slot="left">返回</mt-button>
    </mt-header>
    <div class="container">
      <mt-field label="初始密码"  type="password" placeholder="请输入初始密码" :disableClear="true"   :state="oldpass==''?'warning':''" v-model.trim="oldpass"></mt-field>
      <mt-field type="password" label="新密码" placeholder="请输入新密码" :disableClear="true"  :state="newpass==''?'warning':''" v-model.trim="newpass"></mt-field>
      <mt-field class="jg" type="password" label="确认密码"  :disableClear="true"   placeholder="请输入确认密码" :state="newpasstwo==''?'warning':''" v-model.trim="newpasstwo"></mt-field>
      <div style="padding:0 10px;">
        <mt-button type="primary" size="large" @click.native="editPass">修改</mt-button>
      </div>
    </div>
  </div>
</template>
<script>
  import {
    mapMutations
  } from 'vuex'
  import {
    MessageBox
  } from "mint-ui"
  export default {
    name: "editpass",
    data() {
      return {
        oldpass: "",
        newpass: "",
        newpasstwo: ""
      };
    },
    methods: {
      ...mapMutations({}),
      editPass: function() {
        if (this.oldpass == "") {
          MessageBox("提示", "初始密码不能为空");
          return false;
        }
        if (this.newpass == "") {
          MessageBox("提示", "密码不能为空");
          return false;
        }
        if (this.newpasstwo == "") {
          MessageBox("提示", "二次确认密码不能为空");
          return false;
        }
        if (this.newpass != this.newpasstwo) {
          MessageBox("提示", "新密码和确认密码不一致");
          return false;
        }
        let getInfoData = {
          functionname: "UpdatePwd",
          body: JSON.stringify({
            oldPwd: this.oldpass,
            newPwd: this.newpass,
          })
        }
        this.$http.post(`${this.baseUrl}/Main/PostData`, getInfoData).then(
          response => {
            //  console.log('-----------')
            let data = response.data;
            // console.log(data)
            if (data.code == 1) {
              MessageBox("提示", "修改成功").then(action => {
                this.$router.push("/login");
              }, () => {})
            } else {
              MessageBox("提示", data.msg)
            }
          }
        ).catch(error => {})
      }
    },
    computed: {},
    mounted() {},
    created() {}
  };
</script>
<style lang="scss" scoped>
  #editpass {
    padding-top: 40px;
  }
  .container {
    padding: 0 0px 50px 0px;
  }
  .jg {
    margin-bottom: 25px;
  }
</style>
