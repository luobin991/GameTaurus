<template>
    <div id="newmember">
        <mt-header title="新的申请" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
        </mt-header>
        <div class="applylist" :key="index" v-for="(item,index) in applyListSort">
            <div class="title">{{index}}</div>
            <div class="apply">
                <mt-cell :title="subitem.szNickName" :key="subindex" v-for="(subitem,subindex) in applyListSort[index]" @click.native="$router.push(`/playeretail/${id}/${subitem.nPlayerID}`)">
                    <span><mt-button   class="red" @click.native.stop="refuse(index,subindex,subitem)" v-if="subitem.status==0">拒绝</mt-button>&nbsp;&nbsp;&nbsp;<mt-button  v-if="subitem.status==0" @click.native.stop="agree(index,subindex,subitem)" class="green" >添加</mt-button>   <span class="noope" v-if="subitem.status!=0">{{subitem.status==1?'已添加':'已拒绝'}}</span></span>
                    <img slot="icon" src="../../assets/logo.png" width="24" height="24">
                </mt-cell>
            </div>
        </div>
        <div v-show=" list.length==0" class="noresult">
            暂时没有可以处理的申请记录
        </div>
    </div>
</template>
<script>
    import {
        MessageBox
    } from 'mint-ui'
    export default {
        name: 'newmember',
        data() {
            return {
                id: 0,
                applyListSort: {},
                list: []
            }
        },
        methods: {
            getApplyList() {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "GetClubApplyList",
                        body: JSON.stringify({
                            nClubId: parseInt(that.id),
                            nPlayerId: 0
                        })
                    }
                }
                // console.log(getInfoData)
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                   // console.log(data)
                    if (data.code == 1) {
                        if (data.totalCount > 0) {
                            that.list = data.body;
                            that.sortList()
                        }
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    // console.log(error);
                })
            },
            sortList() {
                let that = this;
                this.list.forEach(element => {
                    let key = element.CreateTime.split(' ')[0];
                 //   console.log(key)
                    if (!that.applyListSort.hasOwnProperty(key)) {
                        that.applyListSort[key] = [];
                    }
                    element.status = 0;
                    that.applyListSort[key].push(element)
                });
                that.applyListSort = JSON.stringify(that.applyListSort)
                that.applyListSort = JSON.parse(that.applyListSort)
                //  console.log(that.applyListSort)
            },
            getInfo() {
                //  console.log("获取用户信息")
            },
            agree(index, subindex, element) {
                //同意玩家的申请
                let that = this;
                let postdata = {
                    'functionname': "Assent",
                    body: JSON.
                    stringify({
                        nClubId: parseInt(that.id),
                        nPlayerId: parseInt(element.nPlayerID)
                    })
                }
                // console.log(postdata)
                this.$http.post(`${this.baseUrl}/Main/PostData`, postdata).then(response => {
                   // console.log(response)
                    let data = response.data;
                    if (data.code == 1) {
                        that.applyListSort[index][subindex].status = 1;
                        MessageBox("提示", "已添加")
                    } else {
                        MessageBox("提示", data.msg)
                    }
                })
            },
            refuse(index, subindex, element) {
                //拒绝玩家的申请
                let that = this;
                let postdata = {
                    'functionname': "Refuse",
                    body: JSON.
                    stringify({
                        nClubId: parseInt(that.id),
                        nPlayerId: parseInt(element.nPlayerID)
                    })
                }
                // console.log(postdata)
                this.$http.post(`${this.baseUrl}/Main/PostData`, postdata).then(response => {
                   // console.log(response)
                    let data = response.data;
                    if (data.code == 1) {
                        that.applyListSort[index][subindex].status = -1;
                        MessageBox("提示", "已拒绝")
                    } else {
                        MessageBox("提示", data.msg)
                    }
                })
            }
        },
        created() {
            let id = this.$route.params.id;
            this.id = id;
            this.getApplyList()
        }
    }
</script>
<style lang="scss" scoped>
    #newmember {
        padding-top: 40px;
        .applylist {
            .title {
                padding: 5px 0px 5px 10px;
                background: #eee;
                color: #9e9e9e;
            }
            .noope {
                font-size: 13px;
            }
            .mint-button {
                font-size: 13px;
                height: 28px;
                &.green {
                    background: green;
                    color: #fff;
                }
                &.red {
                    background: red;
                    color: #fff;
                }
            }
        }
    }
    .noresult {
        padding: 40px 0;
        background: transparent;
        text-align: center;
        color: #a07f7f;
        font-weight: 500;
        font-size: 14px;
    }
</style>


