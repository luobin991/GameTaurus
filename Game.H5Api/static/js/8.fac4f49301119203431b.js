webpackJsonp([8],{Qk8M:function(t,s){},chMV:function(t,s,a){"use strict";Object.defineProperty(s,"__esModule",{value:!0});a("OgVB");var e=a("/Lyv"),n=a.n(e),i=a("mvHQ"),r=a.n(i),o={name:"newmember",data:function(){return{id:0,applyListSort:{},list:[]}},methods:{getApplyList:function(){var t=this,s={params:{functionname:"GetClubApplyList",body:r()({nClubId:parseInt(t.id),nPlayerId:0})}};this.$http.get(this.baseUrl+"/Main/GetData",s).then(function(s){var a=s.data;1==a.code?a.totalCount>0&&(t.list=a.body,t.sortList()):n()("提示",a.msg)}).catch(function(t){})},sortList:function(){var t=this;this.list.forEach(function(s){var a=s.CreateTime.split(" ")[0];t.applyListSort.hasOwnProperty(a)||(t.applyListSort[a]=[]),s.status=0,t.applyListSort[a].push(s)}),t.applyListSort=r()(t.applyListSort),t.applyListSort=JSON.parse(t.applyListSort)},getInfo:function(){},agree:function(t,s,a){var e=this,i={functionname:"Assent",body:r()({nClubId:parseInt(e.id),nPlayerId:parseInt(a.nPlayerID)})};this.$http.post(this.baseUrl+"/Main/PostData",i).then(function(a){var i=a.data;1==i.code?(e.applyListSort[t][s].status=1,n()("提示","已添加")):n()("提示",i.msg)})},refuse:function(t,s,a){var e=this,i={functionname:"Refuse",body:r()({nClubId:parseInt(e.id),nPlayerId:parseInt(a.nPlayerID)})};this.$http.post(this.baseUrl+"/Main/PostData",i).then(function(a){var i=a.data;1==i.code?(e.applyListSort[t][s].status=-1,n()("提示","已拒绝")):n()("提示",i.msg)})}},created:function(){var t=this.$route.params.id;this.id=t,this.getApplyList()}},l={render:function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{attrs:{id:"newmember"}},[e("mt-header",{attrs:{title:"新的申请",fixed:!0}},[e("mt-button",{attrs:{slot:"left",icon:"back"},nativeOn:{click:function(s){t.$router.go(-1)}},slot:"left"},[t._v("返回")])],1),t._v(" "),t._l(t.applyListSort,function(s,n){return e("div",{key:n,staticClass:"applylist"},[e("div",{staticClass:"title"},[t._v(t._s(n))]),t._v(" "),e("div",{staticClass:"apply"},t._l(t.applyListSort[n],function(s,i){return e("mt-cell",{key:i,attrs:{title:s.szNickName},nativeOn:{click:function(a){t.$router.push("/playeretail/"+t.id+"/"+s.nPlayerID)}}},[e("span",[0==s.status?e("mt-button",{staticClass:"red",nativeOn:{click:function(a){a.stopPropagation(),t.refuse(n,i,s)}}},[t._v("拒绝")]):t._e(),t._v("   "),0==s.status?e("mt-button",{staticClass:"green",nativeOn:{click:function(a){a.stopPropagation(),t.agree(n,i,s)}}},[t._v("添加")]):t._e(),t._v(" "),0!=s.status?e("span",{staticClass:"noope"},[t._v(t._s(1==s.status?"已添加":"已拒绝"))]):t._e()],1),t._v(" "),e("img",{attrs:{slot:"icon",src:a("7Otq"),width:"24",height:"24"},slot:"icon"})])}))])}),t._v(" "),e("div",{directives:[{name:"show",rawName:"v-show",value:0==t.list.length,expression:" list.length==0"}],staticClass:"noresult"},[t._v("\n        暂时没有可以处理的申请记录\n    ")])],2)},staticRenderFns:[]};var p=a("VU/8")(o,l,!1,function(t){a("Qk8M")},"data-v-7ea902ea",null);s.default=p.exports}});
//# sourceMappingURL=8.fac4f49301119203431b.js.map