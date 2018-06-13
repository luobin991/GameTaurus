<template>
    <div id="index">
        <mt-tab-container v-model="selected" :swipeable="false">
            <mt-tab-container-item id="club">
                <group></group>
            </mt-tab-container-item>

            <mt-tab-container-item id="agent">
              <agent></agent>
            </mt-tab-container-item>

              <mt-tab-container-item id="record">
                <data-static></data-static>
            </mt-tab-container-item>

            <mt-tab-container-item id="my">
                <my></my>
            </mt-tab-container-item>

        </mt-tab-container>
        <mt-tabbar v-model="selected" :fixed="true">
            <mt-tab-item id="club">
                <img slot="icon" width="24" :src="selected=='club'? require('../../assets/images/ClubActive.png'):require('../../assets/images/Club.png')"> 俱乐部
            </mt-tab-item>
            <mt-tab-item id="agent" v-if="1==2">
                <img slot="icon" width="24" :src="selected=='agent'? require('../../assets/images/StaticActive.png'):require('../../assets/images/Static.png')"> 玩家管理
            </mt-tab-item>
            <!-- <mt-tab-item id="record">
                <img slot="icon" width="24" :src="selected=='record'? require('../../assets/images/StaticActive.png'):require('../../assets/images/Static.png')"> 数据统计
            </mt-tab-item>
              -->
            <mt-tab-item id="my">
                <img slot="icon" width="24" :src="selected=='my'? require('../../assets/images/MyActive.png'):require('../../assets/images/My.png')"> 个人管理
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>
<script>
import Group from "../Group/Index";
import Agent from "../Agent/Index";
import DataStatic from "../DataStatic/Index";
import My from "../My/My";

//import Home from '../Index/Index'
export default {
  name: "index",
  components: {
    Group,
    Agent,
    DataStatic,
    My
    //  Home
  },
  data() {
    return {
      selected: "club"
    };
  },
  methods: {
    menu() {
      // this.scroll = document.documentElement.scrollTop || document.body.scrollTop;
      //  console.log(this.scroll)
    }
  },
  mounted() {
    //  window.addEventListener('scroll', this.menu)
  },
  created() {
    let selected = this.$route.query.selected;
    //console.log(selected)
    if (selected) {
      this.selected = selected;
    }
    if (sessionStorage.info != null) {
      this.$store.state.user = JSON.parse(sessionStorage.info);
    }
  }
};
</script>
<style lang="sass" scoped>

@import  "../../frame/Home/Index.scss"

</style>



