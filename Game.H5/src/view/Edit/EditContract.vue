<template>
    <div id="editpass">
        <mt-header fixed title="聊天消息推送设置">
            <mt-button icon="back" @click.native="$router.go(-1);" slot="left">返回</mt-button>
        </mt-header>
        <div class="container">
            <textarea class="edittext" placeholder="俱乐部聊天设置,256字以内" v-model.trim="value">
                         
            </textarea>
            <div style="">
                <mt-button type="primary" size="large" @click.native="save">保存</mt-button>
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
                value: '',
                nClubID: 0,
                nPlayerID: 0,
                id: 0,
                club: {}
            };
        },
        methods: {
            GetClubInfo() {
                let getInfoData = {
                    params: {
                        'functionname': "GetClubInfo",
                        body: JSON.stringify({
                            nClubId: parseInt(this.id)
                        })
                    }
                }
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                    if (data.code == 1) {
                        this.club = data.body;
                        this.value = this.club.szNoteMsg;
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    MessageBox('提示', "出错了");
                })
            },
            save: function() {
                let that = this;
                if (this.value == "") {
                    MessageBox("提示", "聊天消息不能为空");
                    return false;
                }
                let getInfoData = {
                    functionname: "updateclubmsg",
                    body: JSON.stringify({
                        nClubId: parseInt(this.id),
                        szNoteMsg: this.value
                    })
                }
                //  console.log(getInfoData)
                this.$http.post(`${this.baseUrl}/Main/PostData`, getInfoData).then(
                    response => {
                        //  console.log('-----------')
                        let data = response.data;
                        // console.log(data)
                        if (data.code == 1) {
                            MessageBox("提示", "修改成功");
                        } else {
                            MessageBox("提示", data.msg)
                        }
                    }
                ).catch(error => {})
            }
        },
        computed: {},
        mounted() {},
        created() {
            this.id = parseInt(this.$route.params.nPlayerId);
            this.GetClubInfo()
        }
    };
</script>
<style lang="scss" scoped>
    #editpass {
        padding-top: 40px;
    }
    .container {
        padding: 0 10px 50px 10px;
        .edittext {
            margin: 15px 0;
            width: 100%;
            min-height: 200px;
            padding: 10px;
            color: #333;
            font-size: 16px;
        }
    }
    .jg {
        margin-bottom: 25px;
    }
</style>
