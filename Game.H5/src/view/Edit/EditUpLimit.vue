<template>
    <div id="gameid">
        <mt-header fixed title="修改游戏局数限制">
            <mt-button icon="back" @click.native="$router.go(-1);" slot="left">返回</mt-button>
        </mt-header>
        <div class="container">
            <mt-field class="jg" label="游戏局数"    state="value==''?'warning':''" :disableClear="true"   placeholder="游戏局数" v-model.trim="value"></mt-field>
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
        MessageBox
    } from "mint-ui"
    import {
        Popup
    } from "mint-ui";
    import {
        mapState,
        mapMutations
    } from "vuex";
    export default {
        name: "zuanshiyujin",
        data() {
            return {
                value: "",
                msg: "",
                popupVisible: false,
                Id: 0
            };
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
            saveFn: function() {
                let that = this;
                let getInfoData = {
                    functionname: "UpperLimit",
                    body: JSON.stringify({
                        id: parseInt(this.Id),
                        count: parseInt(this.value)
                    })
                };
                //  console.log(getInfoData);
                this.$http
                    .post(`${this.baseUrl}/Main/UpdateData`, getInfoData)
                    .then(response => {
                        let data = response.data;
                        // console.log(data);
                        if (data.code == 1) {
                            MessageBox("提示", "修改成功")
                            //console.log('success')
                            // this.msg = data.msg;
                            // this.popupVisible = true;
                            // let time = setTimeout(function() {
                            //     that.popupVisible = false;
                            //     clearTimeout(time);
                            // }, this.SETTIME);
                        } else {
                            MessageBox("提示", data.msg)
                        }
                    })
                    .catch(error => {});
            }
        },
        created() {
            let Id = this.$route.params.Id;
            if (Id) {
                this.Id = Id;
            }
        }
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

