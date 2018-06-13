<template>
    <div id="managerset">
        <mt-header title="添加管理员账号" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
            <mt-button icon="more" slot="right"></mt-button>
        </mt-header>
        <div class="title">玩家信息</div>
        <mt-cell title="玩家id" class="nobckimg">
            <span>{{user.nPlayerId}}</span>
            <!-- <img slot="icon" src="../../assets/logo.png" width="24" height="24"> -->
        </mt-cell>
        <mt-cell title="玩家昵称">
            <span>{{user.szNickName}}</span>
            <!-- <img slot="icon" src="../../assets/logo.png" width="24" height="24"> -->
        </mt-cell>
        <mt-cell title="所属俱乐部">
            <span>{{user.szClubName}}</span>
            <!-- <img slot="icon" src="../../assets/logo.png" width="24" height="24"> -->
        </mt-cell>
        <div class="title">添加管理员账号</div>
        <mt-field label="管理员账号" :state="account==''?'warning':''"  :disableClear="true"  placeholder="字母开头，至少4位字母和数字组合" v-model.trim="account" class="nobckimg"></mt-field>
        <mt-field label="密码" :state="passone==''?'warning':''" :disableClear="true"   placeholder="至少6位" type="password" v-model.trim="passone"></mt-field>
        <mt-field label="确认密码" :state="passtwo==''?'warning':''"  :disableClear="true"    placeholder="至少6位" type="password" v-model.trim="passtwo"></mt-field>
        <div style="padding:15px 10px;">
            <mt-button type="danger" @click.native="addAccount" size="large">添加账号</mt-button>
        </div>
    </div>
</template>

<script>
    import {
        MessageBox
    } from 'mint-ui'
    export default {
        name: 'managerset',
        data() {
            return {
                account: "",
                passone: "",
                passtwo: "",
                user: {},
                nPlayerId: 0,
                id: 0
            }
        },
        methods: {
            addAccount() {
                let that = this;
                if (that.account == "") {
                    MessageBox('提示', "账号不能为空");
                    return false;
                }
                if (that.account.length < 4) {
                    MessageBox('提示', "账号至少为4位字母和数字组合");
                    return false;
                }
                var regUserName = /^[a-zA-Z]+[0-9]+[a-zA-Z0-9]*$/;
                if (!regUserName.test(that.account)) {
                    MessageBox('提示', "账号至少为4位字母和数字组合,并且只能以字母开头");
                    return false;
                }
                var regPassWord = /[A-Za-z0-9]/;
                if (that.passone == "" || that.passone == "") {
                    MessageBox('提示', "密码和确认密码不能为空");
                    return false;
                }
                if (that.passone != that.passtwo) {
                    MessageBox('提示', "密码和确认密码不相等");
                    return false;
                }
                if (!regPassWord.test(that.passtwo) || !regPassWord.test(that.passone)) {
                    MessageBox('提示', "密码为数字或字母及以上组合，至少6位");
                    return false;
                }
                if (that.passone.length < 6 || that.passone.length < 6) {
                    MessageBox('提示', "密码为数字或字母及以上组合，至少6位");
                    return false;
                }
                let getInfoData = {
                    'functionname': "AddManageEnterPrise",
                    body: JSON.stringify({
                        nClubId: parseInt(that.user.nClubID),
                        nPlayerId: parseInt(that.user.nPlayerId),
                        accountName: that.account,
                        passWord: that.passone
                    })
                }
                //console.log(getInfoData)
                this.$http.post(`${this.baseUrl}/Main/PostData`, getInfoData).then(response => {
                    let data = response.data;
                    if (data.code == 1) {
                        MessageBox.confirm(`${data.msg},你是否要更改该管理员的权限?`, "提示").then(action => {
                            that.$router.push(`/accessset/${that.user.nPlayerId}/${that.user.nClubID}/222`);
                        }, () => {})
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    // console.log(error);
                })
            },
            getMemberDetail() {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "GetClubMember",
                        body: JSON.stringify({
                            Id: parseInt(that.id),
                            nPlayerId: parseInt(that.user.nPlayerId)
                        })
                    }
                }
                // console.log(getInfoData)
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                    //  console.log(response)
                    if (data.code == 1) {
                        that.user = data.body;
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    // console.log(error);
                })
            }
        },
        created() {
            this.id = this.$route.params.id;
            this.nPlayerId = this.$route.params.nPlayerId;
            this.getMemberDetail();
        },
        mounted() {}
    }
</script>
<style lang="scss" scoped>
    #managerset {
        padding-top: 40px;
        .title {
            padding: 10px;
            color: #9e9e9e;
        }
    }
</style>


