using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Game.Entity.NiuBusiness
{
    /// <summary>
    /// 公告
    /// </summary>
    public class T_Notice
    {

        public int id { get; set; }

        /// <summary>
        /// 公告
        /// </summary>
        public string content { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime createTime { get; set; }
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime updateTime { get; set; }

        /// <summary>
        /// 跑马灯的状态 100 正常， 101停止
        /// </summary>
        public int voild { get; set; }

        public string voildStr { get { return voild == 100 ? "正常" : "停用"; } }
        /// <summary>
        /// 跑马顺序
        /// </summary>
        public int pId { get; set; }

    }


}
