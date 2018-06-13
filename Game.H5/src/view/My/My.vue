<template>
    <div id="userInformation">
        <mt-header fixed title="个人设置">
           
        </mt-header>
        <div class="content">
            <div class="user">
                <div class="img"><img :src="user == null ? require('../../assets/img/nopic.png') :user.headImgUrl" width="80" alt=""></div>
                <div class="nichen">{{user.nickName}}</div>
            </div>
            <mt-cell title="游戏id "  class="nobckimg">
                <span>{{user.userId}}</span>
                 <img slot="icon"   style="margin-right:10px"    src="../../assets/images/AggentId.png" width="24" />
            </mt-cell>
            <mt-cell title="剩余钻石数 "  class="nobckimg">
                <span>{{user.diamond}}</span>
                 <img slot="icon"   style="margin-right:10px"    src="../../assets/images/AggentId.png" width="24" />
            </mt-cell>
            <div class="ge"></div>
            <mt-button class="deletemember nnbutton" size="large" @click.native="$router.push(`../BuyLog`)">购钻记录</mt-button>

            <div class="ge"></div>
            <!-- <mt-cell title="密码修改" value="123321" class="nobckimg" to="/editpass" is-link>
                <span>修改密码</span>
               <img slot="icon"  style="margin-right:10px"     src="../../assets/images/PasswordEdit.png" width="24" />
            </mt-cell> -->
            
            <!-- <mt-cell title="注销登陆" value="123321" class="nobckimg" @click.native="loginOut" is-link>
                <span>退出登陆</span>
               <img slot="icon"  style="margin-right:10px"   src="../../assets/images/LoginOut.png" width="24" />
            </mt-cell> -->
            
           
        </div>
    </div>
</template>
<script>
    import {
        MessageBox
    } from 'mint-ui'
    export default {
        name: "",
        components: {},
        data() {
            return {
                value: true,
                user: {}
            }
        },
        methods: {
            loginOut: function() {
                sessionStorage.clear();
                this.$router.push("/login")
                // console.log('login out')
            },
            getUserInfo() {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "GetEnterInfo"
                    }
                }
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                     //console.log(data);
                    if (data.code == 1) {
                        that.user = data.body;
                        that.$store.state.userInfo = data.body;
                        sessionStorage.userInfo = JSON.stringify(data.body);
                        // console.log(that.user)
                    } else {
                        MessageBox('提示', data.msg);3
                    }
                }).catch(error => {
                    MessageBox('提示', "出错了");
                })
            }
        },
        mounted() {},
        created() {
            this.getUserInfo();
        }
    }
</script>
<style lang="scss" scoped>
    #userInformation {
        padding-top: 40px;
    }
    .content {
        padding: 10px 10px 60px 10px;
    }
    .user {
        display: flex;
        padding: 10px 10px 10px 10px;
        margin-bottom: 20px;
        align-items: center;
        background: #ffffff;
        .img {
            width: 60px;
            img {
                display: block;
                width: 100%;
            }
        }
        .nichen {
            padding-left: 15px;
            flex: 1;
            color: #aca1a1;
            font-size: 16px;
            white-space: nowrap;
            overflow: hidden;
        }
    }
    .ge {
        width: 100%;
        height: 25px;
        background: #eeeeee;
    }
    .noimg {}
</style>

