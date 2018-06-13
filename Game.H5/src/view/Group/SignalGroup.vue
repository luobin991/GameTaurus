<template>
    <div id="signalgroup">
        <mt-header :title="szclubname" :fixed="true">
            <router-link :to="{path:'/',query:{selected:'club'}}" slot="left">
                <mt-button icon="back">返回</mt-button>
            </router-link>
        </mt-header>
        <mt-index-list>
            <div class="quicknav">
            
             
               
                <mt-cell title="俱乐部信息" isLink :to="`/clubdetail/${id}`">
                    <img slot="icon" style="margin-right:10px;" src="../../assets/images/ClubInfo.png" width="24" height="24">
                </mt-cell>
                <mt-cell title="收费记录" isLink :to="`/chargelog/${id}`">
                    <img style="margin-right:10px;" slot="icon" src="../../assets/images/managerAccount.png" width="24" height="24">
                </mt-cell>
                   <!-- <mt-cell title="新的申请" isLink :to="{path:`/newmember/${id}`}">
                    <span style="margin-right:10px;">未处理 </span>
                    <mt-badge type="error">{{totalCount}}</mt-badge>
                    <img slot="icon" style="margin-right:10px;" src="../../assets/images/Apply.png" width="24" height="24">
                </mt-cell>
                 <mt-cell title="添加成员" isLink :to="`/addmember/${id}`" v-if="user.position<2">
                    <img slot="icon" style="margin-right:10px;" src="../../assets/images/NewApply.png" width="24" height="24">
                </mt-cell>
                <mt-cell title="管理账号列表" isLink :to="`/managerlist/${id}`">
                    <img style="margin-right:10px;" slot="icon" src="../../assets/images/managerAccount.png" width="24" height="24">
                </mt-cell>
                <mt-cell title="聊天消息推送" isLink :to="`/editcontract/${id}`"  v-if="user.position<2">
                    <img style="margin-right:10px;" slot="icon" src="../../assets/images/contacttip.png" width="24" height="24">
                </mt-cell> -->
            </div>
            <div class="clubmembers">
                <mt-index-section :index="index.toUpperCase()" :key='index' v-for="(item,index) in groupArr">
                    <mt-cell :title="ite.userName" :key='index' v-for="(ite,index) in item" :id="item.id" :to="{path:'/clubmember',query:{clubId:ite.clubId,userId:ite.userId}}">
                        <img slot="icon" style="margin-right:10px;" :src="ite.headImgUrl" width="30"/>
                        <span slot="icon" style="margin-right:10px;" v-if="ite.position==1"><mt-badge size="small"   type="error">管理员</mt-badge></span>
                        <span slot="icon" style="margin-right:10px;" v-if="ite.position==0"><mt-badge size="small"   type="success">创始人</mt-badge></span>
                    </mt-cell>
                </mt-index-section>
            </div>
            <div class="totalnum">合计{{totalCount}}人</div>
        </mt-index-list>
    </div>
</template>
<script>
    import NnCell from '../../components/NnCell.vue'
    import simplePinyin from 'simple-pinyin';
    import {MessageBox} from 'mint-ui'
    export default {
        name: 'signalgroup',
        components: {
            NnCell
        },
        data() {
            return {
                id: 0,
                szclubname: '',
                toolShow: true,
                groupArr: [],
                totalCount: 0,
                letters: "abcdefghjklmnopqrstwxyz#".split(''),
                arr: [],
                access: {
                    '1': true,
                    '2': true,
                    '3': true,
                    '4': true,
                },
                user: {}
            }
        },
        methods: {
            getClubMemberList(id) {
                let that = this;
                let getInfoData = {
                    params: {
                        'functionname': "getclubmemberlist",
                        body: JSON.stringify({
                            nClubId: id
                        })
                    }
                }
                //  console.log(getInfoData)
                this.$http.get(`${this.baseUrl}/Main/GetData`, getInfoData).then(response => {
                    let data = response.data;
                     console.log(response)
                    that.totalCount = data.totalCount;
                    //that.
                    if (data.code == 1) {
                        that.arr = data.body;
                        that.formList(that.arr);
                    } else {
                        MessageBox('提示', data.msg);
                    }
                }).catch(error => {
                })
            },
            formList(arr) {
                let letters = "abcdefghjklmnopqrstwxyz#".split('');
                let groupArr = {};
                letters.forEach(element => {
                    let letter = element;
                    groupArr[letter] = [];
                });
                 console.log(groupArr)
                arr.forEach(element => {
                    let pinyin = simplePinyin(element.userName, {
                        pinyinOnly: false
                    });
                    // 
                    //   console.log(pinyin)
                    if (pinyin != "" && pinyin != null) {
                        let key = pinyin[0][0];
                        let isIn = letters.indexOf(key) != -1 || letters.indexOf(key.toLowerCase()) != -1;
                        if (isIn) {
                            groupArr[key.toLowerCase()].push(element);
                        } else {
                            groupArr['#'].push(element);
                        }
                    } else {
                        groupArr['#'].push(element);
                    }
                });
                //   console.log(JSON.stringify(groupArr))
                for (const key in groupArr) {
                    if (groupArr.hasOwnProperty(key)) {
                        const element = groupArr[key];
                        if (element.length == 0) {
                            delete groupArr[key]
                        }
                    }
                }
                this.groupArr = groupArr;
                //   console.log(groupArr)
                // console.log(JSON.stringify(groupArr))
            },
            getAcess() {
                let that = this;
                let getAcess = {
                    params: {
                        'functionname': "GetClubAuth",
                        body: JSON.stringify({
                            nClubId: parseInt(this.id)
                        })
                    }
                }
                this.$http.get(`${this.baseUrl}/Main/GetData`, getAcess).then(response => {
                    //  console.log(response)
                    let data = response.data;
                    if (data.code == 1) {
                        that.user = data.body;
                    } else {
                        MessageBox('提示', data.msg);
                    }
                })
            }
        },
        created() {
            let id = this.$route.params.id;
            this.id = id;
            this.szclubname = this.$route.params.szclubname;
            this.getClubMemberList(id);
            this.getAcess();
            let that = this;
            let timer = setTimeout(function() {
                that.toolShow = false;
                clearTimeout(timer);
            }, 1000)
        }
    }
</script>
<style lang="sass" scoped>
   @import "../../frame/Group/group.scss";
   @import  "../../frame/BaseFrameWork/Animation.scss"
</style>



