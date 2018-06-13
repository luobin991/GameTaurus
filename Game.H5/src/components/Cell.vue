<template>
    <div class="moban ">
        <slot class="header" name="header">
        </slot>
        <slot class="conent" name='content'>
        </slot>
    </div>
</template>

<script>
    export default {
        name: 'moban',
        data() {
            return {}
        }
    }
</script>

<style lang="scss">
    .moban {
        background: #fff;
        border: 1px solid #ded1d1;
        margin-bottom: 20px;
        border-radius: 4px;
        padding: 10px 10px 10px 10px;
        color: #333;
        .header {
            font-weight: 550;
            font-size: 14px;
            padding-bottom: 0px;
            display: flex;
            padding-bottom: 3px;
            margin-bottom: 5px;
            border-bottom: 1px solid #e8e1e1;
            &>div {
               
            }
            &>div:first-child {
                text-align: left;
                flex: 1;
            }
            &>div:last-child {
                text-align: right;
               
            }
        }
        .content {
            font-size: 12px;
            padding-left: 3px;
            display: flex;
            &>div.subcontent {
                line-height: 1.7;
                &.auto {
                    flex: 1;
                }
                &.center {
                    text-align: center;
                }
                .value {
                    color: #a7a0a0;
                    &.red {
                        color: red;
                    }
                    &.green {
                        color: green;
                    }
                }
            }
        }
    }
    .moban:first-child {
        margin-top: 20px;
    }
</style>