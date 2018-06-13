<template>
    <div id="addmember">
        <mt-header title="添加俱乐部成员" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
        </mt-header>
        <div class="mint-searchbar">
            <div class="mint-searchbar-inner">
                <i class="mintui mintui-search"></i>
                <input type="number" placeholder="玩家id" v-model.trim="value" class="mint-searchbar-core">
            </div>
            <a class="mint-searchbar-cancel" style="" @click="search">搜索</a>
        </div>
        <div v-show="resultshow">
            <div class="result" v-show="show">
                该用户不存在
            </div>
            <div class="hasresult" v-show="!show">
                <!-- :label="`游戏id:${user.nPlayerId}`"   @click.native="$router.push('/clubmembersearchdetail')" -->
                <mt-cell :title="user.szNickName" class="nobckimg">
                    <span>
                    <span  v-if="this.user.nStatus==1">已添加</span>
                    <mt-button @click.native.stop.self="add"  v-else>添加</mt-button>
                    </span>
                    <img slot="icon" :src="user.szHeadPicUrl==''?require('../../assets/img/nopic.png'):user.szHeadPicUrl" width="40" height="40">
                </mt-cell>
            </div>
        </div>
    </div>
</template>
<script>
    import {
        MessageBox
    } from 'mint-ui'
    export default {
        name: "addmember",
        data() {
            return {
                value: "s搜索人昵称",
                show: false,
                id: 0,
                resultshow: false,
                user: {}
            }
        },
        methods: {
            add() {
                let getInfoData = {
                    'functionname': "InviteUserClubMember",
                    body: JSON.stringify({
                        nClubId: parseInt(this.id),
                        nPlayerId: parseInt(this.user.nPlayerId)
                    })
                }
                //  console.log(getInfoData);
                this.$http.post(`${this.baseUrl}/Main/PostData`, getInfoData).then(response => {
                    let data = response.data;
                   
                    if (data.code == 1) {
                        this.user.nStatus = 3;
                        MessageBox("提示", data.msg)
                    } else {
                        MessageBox("提示", data.msg)
                    }
                }).catch(error => {
                    MessageBox("提示", "出错了")
                })
            },
            search() {
                let that = this;
                this.resultshow = true;
                let getInfoData = {
                    params: {
                        'functionname': "getuserclubmemberinfo",
                        body: JSON.stringify({
                            nClubId: parseInt(this.id),
                            nPlayerId: parseInt(this.value)
                        })
                    }
                }
                // console.log(getInfoData)
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                     //console.log(data)
                    if (data.code == 1) {
                        //  console.log(data)
                        if (data.totalCount == 0) {
                            that.show = true;
                        } else {
                            that.show = false;
                            that.user = data.body;
                        }
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    MessageBox('提示', "网络异常");
                })
            }
        },
        created() {
            this.id = parseInt(this.$route.params.id);
        }
    }
</script>
<style lang="scss" scoped>
    #addmember {
        padding-top: 40px;
        .mint-search {
            height: 44px;
        }
        .result {
            padding: 2rem 0;
            text-align: center;
            font-size: 1.4rem;
            color: #9e9e9e;
        }
        .mint-search-list {
            margin-top: 40px;
            display: block;
        }
        .hasresult {
            padding: 2rem 0;
            .mint-button {
                height: 30px;
                font-size: 12px;
            }
        }
        .mint-cell-label {
            padding-left: 20px;
        }
    }
</style>


