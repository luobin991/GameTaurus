<template>
    <div id="zuanshiyujin">
        <mt-header fixed title="钻石预警">
            <mt-button icon="back" @click.native="$router.go(-1);" slot="left">返回</mt-button>
        </mt-header>
        <div class="container">
            <mt-cell title="预警提醒">
                <span style="color: green"><mt-switch v-model="value">{{value?'开':'关'}}</mt-switch></span>
            </mt-cell>
            <mt-field class="jg" label="预警值" state="warning" :disableClear="true"    placeholder="请输入新预警值" v-model="yujinnum"></mt-field>
            <div style="padding:0 10px;">
                <mt-button type="primary" @click.native="saveFn" size="large">保存</mt-button>
            </div>
        </div>
        <div class="shuoming">
            <p class="title">
                说明
            </p>
            <p class="title">
                1.代理可以自由设置钻石预警值
            </p>
            <p class="title">
                2.当钻石预警值为关闭状态，不会出现任何提示
            </p>
            <p class="title">
                3.当钻石预警为打开状态，后台钻石数量低于预警值时会提示钻石数量不足
            </p>
        </div>
    </div>
</template>
<script>
    import {
        MessageBox
    } from "mint-ui"
    import {
        mapState,
        mapMutations
    } from "vuex"
    export default {
        name: "zuanshiyujin",
        data() {
            return {
                value: 0,
                yujinnum: this.$store.state.user.prompt,
                msg: "",
                popupVisible: false
            }
        },
        watch: {
            value: 'watchvalue'
        },
        computed: {
            ...mapState({
                user: 'user'
            })
        },
        methods: {
            ...mapMutations({
                editPrompt: "editPrompt"
            }),
            watchvalue: function(nowvalue, oldvalue) {
                localStorage.setItem('yujin', nowvalue);
            },
            saveFn: function() {
                let that = this;
                //  console.log(55555)
                let putData = {
                    params: {
                        'functionname': "updateprompt",
                    }
                }
                let getInfoData = {
                    functionname: "updateprompt",
                    body: JSON.stringify({
                        prompt: this.yujinnum
                    })
                }
                this.$http.post(`${this.baseUrl}/Main/UpdateData`, getInfoData).then(
                    response => {
                        let data = response.data;
                        if (data.code == 1) {
                            //this.popupVisible = true;
                            this.editPrompt({
                                prompt: parseInt(this.yujinnum)
                            });
                            sessionStorage.setItem('info', JSON.stringify(this.user))
                            // setTimeout(function() {
                            //     this.popupVisible = false;
                            // }, this.SETTIME)
                            MessageBox("提示", "修改成功");
                        } else {
                            MessageBox("提示", data.msg);
                        }
                    }
                ).catch(error => {})
            }
        },
        created() {
            let yujin = localStorage.getItem('yujin');
            // console.log(yujin)
            if (yujin == null) {
                localStorage.setItem('yujin', 'true');
            }
            yujin = localStorage.getItem('yujin');
            if (yujin == "true") {
                yujin = true;
            } else if (yujin == "false") {
                yujin = false;
            }
            this.value = yujin;
        }
    }
</script>
<style lang="scss" scoped>
    $bg:#008000;
    container {
        padding: 0 0px 50px 0px;
    }
    .jg {
        margin-bottom: 25px;
    }
</style>

