<template>
    <div id="managerlist">
        <mt-header title="管理员账号列表" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
        </mt-header>
        <mt-cell :title="ite.szNickName" v-for="(ite,index) in arr" :key="index" :label="`账号：${ite.AccountName}`" is-link class="nobckimg" :to="{path:'/clubmember',query:{id:ite.ID,nPlayerId:ite.nPlayerID}}">
            <img :src="ite.szHeadPicUrl" width="30" slot="icon" style="margin-right:10px;">
            <span v-if="ite.Status==1">账号状态：正常</span>
            <span v-if="ite.Status==2">账号状态：禁用</span>
            <span v-if="ite.Status==3">账号状态：取消</span>
        </mt-cell>
    </div>
</template>
<script>
    export default {
        name: 'maagerlist',
        data() {
            return {
                arr: [],
                nClubId: ''
            }
        },
        methods: {
            GetClubManageList() {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "GetClubManageList",
                        body: JSON.stringify({
                            nClubId: this.nClubId
                        })
                    }
                }
               // console.log(getInfoData)
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                   // console.log(data)
                    if (data.code == 1) {
                        that.arr = data.body;
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    // console.log(error);
                })
            }
        },
        created() {
            this.nClubId = this.$route.params.id;
            this.GetClubManageList()
        }
    }
</script>

<style lang="scss" scoped>
    #managerlist {
        padding-top: 40px;
        .mint-cell {
            margin-bottom: 20px;
        }
    }
    .mint-cell {
        min-height: 70px;
    }
</style>