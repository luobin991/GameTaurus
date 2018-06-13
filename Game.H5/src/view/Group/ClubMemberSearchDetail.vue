<template>
    <div id="ClubMember">
        <mt-header title="用户资料简介" :fixed="true">
            <mt-button icon="back" @click.native="$router.go(-1)" slot="left">返回</mt-button>
            <mt-button icon="add" slot="right"></mt-button>
        </mt-header>
        <div class="content">
            <div class="user">
                <div class="img"><img src="../../assets/logo.png" width="60" alt=""></div>
                <div class="nichen">成员昵称</div>
            </div>
            <mt-cell title="成员id" class="nobckimg">
                <span>1235</span>
            </mt-cell>
             <div class="ge"></div>
            <mt-cell title="申请加入俱乐部名称" class="nobckimg" value="123321">
                <span>{{$store.state.user.loginTime}}</span>
                
            </mt-cell>
            <div class="ge"></div>
            <mt-cell title="成员申请时间" class="nobckimg" value="123321">
                <span>{{$store.state.user.loginTime}}</span>
                
            </mt-cell>
            <mt-button class="setmanager nnbutton" size="large" @click.native="$router.push('/managerset')">邀请加入</mt-button>
        </div>
    </div>
</template>
<script>
    import NnCell from '../../components/NnCell'
    export default {
        name: 'ClubMember',
        components: {
            NnCell
        },
        data() {
            return {}
        },
        methods: {},
        created() {
            let id = this.$route.query.Id;
          //  console.log(id);
        },
        mounted() {}
    }
</script>

<style lang="scss" scoped>
    #ClubMember {
        padding-top: 40px;
    }
    .content {
        padding: 30px 10px 60px 10px;
    }
    .user {
        display: flex;
        padding: 10px 10px 10px 10px;
        margin-bottom: 20px;
        align-items: center;
        background: #ffffff;
        .img {
            width: 80px;
            img {
                display: block;
                width: 60px;
            }
        }
        .nichen {
            padding-left: 15px;
            flex: 1;
            color: #aca1a1;
            font-size: 16px;
            white-space: nowrap;
            overflow: hidden;
        }
    }
    .ge {
        width: 100%;
        height: 25px;
        background: #eeeeee;
    }
    .setmanager {
        background: green;
        color: #fff;
    }
    .nnbutton {
        margin-top: 20px;
    }
</style>


