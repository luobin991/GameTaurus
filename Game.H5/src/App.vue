<template>
  <div id="app">
    <div class="container">
       <router-view></router-view>
    </div>
  </div>
</template>

<script>

  export default {
    name: 'app',
    components:{
    
    },
    data() {
      return {
        selected: "home"
      }
    }
  }
</script>

<style>
  body {
    /* position: absolute;
    height: 100%;
    width: 100%;
    z-index: 1;
    overflow-y: scroll;
    -webkit-overflow-scrolling: touch; */
  }
  #app {
    max-width: 750px;
    min-width: 320px;
    margin: 0 auto;
    position: relative;
    overflow-x: hidden;
    
  }
  .container {}
</style>
