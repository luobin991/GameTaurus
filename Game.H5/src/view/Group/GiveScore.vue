<template>
    <div id="givescore">
        <mt-header :title="flag==1?'扣除积分':'赠送积分'" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
        </mt-header>
        <div class="title">成员信息</div>
        <mt-cell title="成员id" class="nobckimg">
            <span>{{user.nPlayerId}}</span>
        </mt-cell>
        <mt-cell title="成员昵称">
            <span>{{user.szNickName}}</span>
        </mt-cell>
        <mt-cell title="成员积分">
            <span>{{user.nScore}}</span>
        </mt-cell>
        <mt-cell title="所属俱乐部">
            <span>{{user.szClubName}}</span>
            <!-- <img slot="icon" src="../../assets/logo.png" width="24" height="24"> -->
        </mt-cell>
        <div class="title">赠送积分</div>
        <mt-field :label="flag==1?'扣除积分':'赠送积分'" type="number" :disableClear="true" :state="sendscorenum==''?'warning':''" v-model.trim="sendscorenum" placeholder="输入积分数量" class="nobckimg"></mt-field>
        <mt-field label="备注" placeholder="请输入备注" :disableClear="true" type="textarea" rows="4" v-model.trim="mark"></mt-field>
        <div style="padding:15px 10px;">
            <mt-button type="danger" @click.native="giveScore" size="large">{{flag==1?'扣除积分':'赠送积分'}}</mt-button>
        </div>
    </div>
</template>
<script>
    import {
        MessageBox,
        Indicator
    } from 'mint-ui'
   
    export default {
        name: "givescore",
        data() {
            return {
                sendscorenum: "",
                money: '',
                mark: "",
                user: {},
                nPlayerId: 0,
                id: 0,
                flag: -1
            }
        },
        methods: {
            getMemberDetail() {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "GetClubMember",
                        body: JSON.stringify({
                            Id: parseInt(that.id),
                            nPlayerId: parseInt(that.nPlayerId)
                        })
                    }
                }
                //    console.log(getInfoData)
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                    //  console.log(response)
                    if (data.code == 1) {
                        that.user = data.body;
                        Indicator.close('加载中...');
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    // console.log(error);
                })
            },
            giveScore() {
                let that = this;
                if (that.sendscorenum == "") {
                    MessageBox("提示", "赠送数量不能为空");
                    return false;
                }
                if (that.mark == "") {
                    MessageBox("提示", "备注不能为空");
                    return false;
                }
                if(that.user=={})
                {
                    MessageBox("提示", "获取个人信息中。。。");
                    return false;
                }
                let getInfoData = {
                    'functionname': "DonateScore",
                    body: JSON.stringify({
                        nClubId: parseInt(that.user.nClubID),
                        nPlayerId: parseInt(that.user.nPlayerId),
                        score: parseInt(that.sendscorenum),
                        remark: that.mark,
                        type: (that.flag == 0 ? 1 : 2)
                    })
                }
                //console.log(getInfoData)
                let str = '';
                if (that.flag == 0) {
                    str = "赠送" + parseInt(that.sendscorenum)
                }
                if (that.flag == 1) {
                    str = "扣除" + parseInt(that.sendscorenum)
                }
                MessageBox.confirm("确定要向该成员" + str + '积分', "提示").then((action) => {
                    // console.log(getInfoData)
                    that.$http.post(`${that.baseUrl}/Main/PostData`, getInfoData).then(response => {
                        let data = response.data;
                        if (data.code == 1) {
                            if (that.flag == 0) {
                                that.user.nScore = that.user.nScore + parseInt(that.sendscorenum)
                            } else if (that.flag == 1) {
                                that.user.nScore = that.user.nScore - parseInt(that.sendscorenum)
                            }
                            MessageBox("提示", data.msg);
                        } else {
                            MessageBox("提示", "网络异常");
                        }
                    })
                }, () => {})
            }
        },
        created() {
            this.id = this.$route.params.id;
            this.nPlayerId = this.$route.params.nPlayerId;
            this.flag = parseInt(this.$route.params.flagnum);
             Indicator.open('加载中...');
            this.getMemberDetail();
        },
        mounted() {}
    }
</script>
<style lang="scss" scoped>
    #givescore {
        padding-top: 40px;
        .title {
            padding: 10px;
            color: #9e9e9e;
        }
    }
</style>

