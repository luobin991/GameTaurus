<template>
  <div class="cell">
       <slot name="img"> </slot>
       <slot name="title"></slot>
  </div>
</template>
<script>
export default {
  name:"cell",
  data(){
      return {

      }
  },
  methods:{

  }
}
</script>
<style lang="scss" scoped>
  .cell{
      padding:9px 0;
      color: #f7e1a7;
      font-size: 14px;
      border-bottom: 1px solid #79625a;
      vertical-align: center;
      align-items: center;
      display: flex;
      line-height: 1;
      img{
         margin-right: 5px;
      }
  }
</style>


