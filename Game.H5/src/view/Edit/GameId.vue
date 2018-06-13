<template>
    <div id="gameid">
        <mt-header fixed title="修改游戏ID">
            <mt-button icon="back" @click.native="$router.go(-1);" slot="left">返回</mt-button>
        </mt-header>
        <div class="container">
            <mt-cell title="初始游戏ID">
                <span style="color: green">{{$store.state.user.agentId}}</span>
            </mt-cell>
            <mt-field class="jg" label="新的游戏ID"   :disableClear="true"     :state="newGameId==''?'warning':''" placeholder="新的游戏ID" v-model.trim="newGameId"></mt-field>
            <div style="padding:0 10px;">
                <mt-button type="primary" @click.native="saveFn" size="large">保存</mt-button>
            </div>
        </div>
        <mt-popup v-model="popupVisible" position="top" :modal="false" pop-transition="popup-fade">
            {{msg}}
        </mt-popup>
    </div>
</template>
<script>
    import {
        Popup,
        MessageBox
    } from "mint-ui";
    import {
        mapState,
        mapMutations
    } from "vuex";
    export default {
        name: "zuanshiyujin",
        data() {
            return {
                value: 0,
                newGameId: "",
                msg: "",
                popupVisible: false
            };
        },
        watch: {
            value: "watchvalue"
        },
        computed: {
            ...mapState({
                user: "user"
            })
        },
        methods: {
            ...mapMutations({
                editAgentId: "editAgentId"
            }),
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
                    //  console.log(error);
                })
            },
            saveFn: function() {
                let that = this;
                let getInfoData = {
                    functionname: "updateagentid",
                    body: JSON.stringify({
                        agentId: this.newGameId
                    })
                };
                this.$http
                    .post(`${this.baseUrl}/Main/UpdateData`, getInfoData)
                    .then(response => {
                        let data = response.data;
                        // console.log(data);
                        if (data.code == 1) {
                            // console.log('success')
                            // this.msg = data.msg;
                            // this.popupVisible = true;
                            // this.editAgentId({
                            //     agentId: parseInt(this.newGameId)
                            // });
                            // sessionStorage.setItem("info", JSON.stringify(this.user));
                            MessageBox("提示", "设置成功").then((action) => {
                                // console.log('1111111111111111')
                                that.getInfo();
                            }, () => {})
                            // let time = setTimeout(function() {
                            //     that.popupVisible = false;
                            //     clearTimeout(time);
                            // }, this.SETTIME);
                        } else {
                            MessageBox("提示", data.msg);
                        }
                    })
                    .catch(error => {});
            }
        },
        created() {}
    };
</script>
<style lang="scss" scoped>
    $bg: #008000;
    container {
        padding: 0 0px 50px 0px;
    }
    .jg {
        margin-bottom: 25px;
    }
</style>

