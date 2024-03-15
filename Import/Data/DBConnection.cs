using Import.ADO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Import.Data
{
    internal class DBConnection
    {
        public static Import_DataEntities connection = new Import_DataEntities();
    }
}
