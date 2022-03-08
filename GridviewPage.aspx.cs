using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gridview
{
    public partial class GridviewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ObjectDataSource1_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.ReturnValue is int && (int)e.ReturnValue > 0)
            {
                e.AffectedRows = (int)e.ReturnValue;
            }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.AffectedRows < 1)
            {
                e.KeepInEditMode = true;
                lblmessage.Text = $"Employee Id - {e.Keys[0]} is not updated due to data confict.";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (e.AffectedRows > 0)
            {
                lblmessage.Text = $"Employee Id - {e.Keys[0]} is successfully updated.";
                lblmessage.ForeColor = System.Drawing.Color.Green;

            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.AffectedRows < 1)
            {
                lblmessage.Text = $"Employee Id - {e.Keys[0]} is not Deleted due to data confict.";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblmessage.Text = $"Employee Id - {e.Keys[0]} is successfully Deleted.";
                lblmessage.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void ObjectDataSource1_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.ReturnValue is int && (int)e.ReturnValue > 0)
            {
                e.AffectedRows = (int)e.ReturnValue;
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            objdsGridView.InsertParameters["EmployeeName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;
            objdsGridView.InsertParameters["Department"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("ddlDept")).SelectedValue;
            objdsGridView.InsertParameters["GroupName"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("ddlGroup")).SelectedValue;
            objdsGridView.InsertParameters["JobTitle"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("ddlJob")).SelectedValue;

            objdsGridView.Insert();
        }
    }
}