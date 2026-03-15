using System;
using System.Web.UI;

namespace HamroWard
{
    public partial class Service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: you can set initial language here based on cookie/session/browser

            }
        }
    }
}