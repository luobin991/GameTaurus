<template>
    <div id="accessset">
        <mt-header title="权限设置" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
            <!-- <mt-button icon="more" slot="right"></mt-button> -->
        </mt-header>
        <mt-cell title="赠送俱乐部积分"   class="nobckimg">
            <span><mt-switch v-model="value1" >{{value1==true?'开启':'禁用'}}</mt-switch></span>
        </mt-cell>
          <mt-cell title="扣除俱乐部积分"   class="">
            <span><mt-switch v-model="value5" >{{value5==true?'开启':'禁用'}}</mt-switch></span>
        </mt-cell>
        <mt-cell title="踢出俱乐部">
            <span><mt-switch v-model="value2">{{value2==true?'开启':'禁用'}}</mt-switch></span>
        </mt-cell>
        <mt-cell title="同意加入俱乐部">
            <span><mt-switch v-model="value3">{{value3==true?'开启':'禁用'}}</mt-switch></span>
        </mt-cell>
        <mt-cell title="修改分成比例">
            <span><mt-switch v-model="value4">{{value4==true?'开启':'禁用'}}</mt-switch></span>
        </mt-cell>
        <div style="padding:15px 10px;">
            <mt-button type="danger" @click.native="SetAuth" size="large"  v-if="parseInt(isManager)==222">保存设置</mt-button>
        </div>
         <div style="padding:15px 10px;">
            <mt-button type="danger" @click.native="setManagerHttp" size="large"  v-if="parseInt(isManager)==333">保存设置</mt-button>
        </div>
    </div>
</template>
<script>
    import {
        MessageBox
    } from 'mint-ui'
    export default {
        name: "accessset",
        data() {
            return {
                value1: false,
                value2: false,
                value3: false,
                value4: false,
                value5:false,
                access: [],
                accessList: {},
                isManager: ''
            }
        },
        methods: {
            formatedata() {
                let that = this;
                that.access.forEach(element => {
                    let nLevel = element.nLevel
                    that[`value${nLevel}`] = element.nStatus == 1
                });
            },
            Compileddata() {
                let that = this;
                that.access.forEach(element => {
                    let nLevel = element.nLevel;
                    element.nStatus = that[`value${nLevel}`] == true ? 1 : 2
                });
            },
            GetAuthList() {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "GetAuthList",
                        body: JSON.stringify({
                            nClubId: parseInt(that.nClubId),
                            nPlayerId: parseInt(that.nPlayerId)
                        })
                    }
                }
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                //    console.log(data)
                    if (data.code == 1) {
                        if (data.totalCount > 0) {
                            that.access = data.body;
                            that.formatedata()
                        }
                    } else {
                        MessageBox("提示", data.msg)
                    }
                }).catch(error => {
                    MessageBox("提示", error)
                })
            },
            setManagerHttp() {
                //设置管理员账号
                let that = this;
                let accessData;
                accessData = "" + (this.value1? '1,' : '') + (this.value2? '2,' : '') + (this.value3? '3,' : '') + (this.value4? '4,' : '')+(this.value5? '5,' : '');
                if (accessData.length <= 0) {
                    MessageBox("提示", "初次设置管理器权限至少要选择一个权限");
                    return false;
                }
                if (accessData.endsWith(',')) {
                    accessData = accessData.substr(0, accessData.length - 1)
                }
                let params = {
                    functionname: "SetManage",
                    body: JSON.stringify({
                        nClubId: parseInt(that.nClubId),
                        nPlayerId: parseInt(that.nPlayerId),
                        openAuthIds: accessData
                    })
                };
                console.log(params)
                this.$http
                    .post(`${this.baseUrl}/Main/PostData`, params)
                    .then(response => {
                        let data = response.data;
                        if (data.code == 1) {
                            MessageBox.confirm(`${data.msg},你是否要查看该管理员资料?`, "提示").then(
                                action => {
                                    that.$router.go(-1)
                                },
                                () => {}
                            );
                        } else {
                            MessageBox("提示", data.msg);
                        }
                    })
                    .catch(error => {
                        MessageBox("提示", error);
                    });
            },
            SetAuth() {   
                //修改权限
                let that = this;
                that.Compileddata();
              //  console.log(that.access)
                let getInfoData = {
                    'functionname': "SetAuth",
                    body: JSON.stringify(that.access)
                }
                this.$http.post(`${this.baseUrl}/Main/PostData`, getInfoData).then(response => {
                    let data = response.data;
                    if (data.code == 1) {
                        MessageBox("提示", data.msg)
                    } else {
                        MessageBox("提示", data.msg)
                    }
                }).catch(error => {
                    MessageBox("提示", "出错了")
                })
            }
        },
        created() {
            // console.log(this.$route.params)
            this.nClubId = this.$route.params.nClubId;
            this.nPlayerId = this.$route.params.nPlayerId;
            this.isManager = this.$route.params.isManager;
            if (parseInt(this.isManager) == 222) {
                this.GetAuthList();
            }
        },
        mounted() {}
    }
</script>
<style lang="scss" scoped>
    #accessset {
        padding-top: 40px;
    }
</style>

