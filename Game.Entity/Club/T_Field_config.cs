using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Game.Entity.Club
{
    public class T_Field_config
    {
        public int id { get; set; }
        public int typeId { get; set; }
        public string fieldName { get; set; }
        public int entryLimit { get; set; }
        public int min_bet { get; set; }
        public int rate { get; set; }
        public bool isOpen { get; set; }

    }


}
