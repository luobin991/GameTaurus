<template>
    <div id="groupindex">
        <div class="title">我的俱乐部</div>
        <mt-cell :title="item.clubName" :to="`/signalgroup/${item.clubId}/${item.clubName}`" :key="index" v-for="(item,index) in clubList">
            <span>{{item.peopleCount}}</span>
            <img slot="icon"  style="margin-right:10px;" :src="require(`../../assets/images/Club_${4}.png`)" width="30" height="30">
        </mt-cell>
    </div>
</template>
<script>
    import {
        MessageBox
    } from 'mint-ui'
    export default {
        name: 'index',
        data() {
            return {
                clubList: []
            }
        },
        methods: {
            getClubList() {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "GetClubList"
                    }
                }
                // console.log(getInfoData)
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                    if (data.code == 1) {
                        that.clubList = data.body;
                        that.$store.state.clubList = that.clubList;
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                    // console.log(error);
                })
            }
        },
        created() {
            this.getClubList()
            // console.log("init")
        }
    }
</script>
<style lang="sass" scoped>
@import  "../../frame/Group/Index.scss"

</style>






