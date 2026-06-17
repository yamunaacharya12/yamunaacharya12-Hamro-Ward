using System;
using System.Web.UI;

namespace HamroWard
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Managed through double-iframe rendering
            }
        }
    }
}