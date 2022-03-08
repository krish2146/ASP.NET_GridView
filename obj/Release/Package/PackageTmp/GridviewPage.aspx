<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridviewPage.aspx.cs" Inherits="Gridview.GridviewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-5.0.2-dist/js/bootstrap.js"></script>
    <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container col-12 p-5 justify-content-center">
            <asp:GridView ID="GridView1" runat="server" CssClass="col-12 text-center" AutoGenerateColumns="False" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" OnRowUpdated="GridView1_RowUpdated" OnRowDeleted="GridView1_RowDeleted"
                CellPadding="3" CellSpacing="2" AllowPaging="True" AllowSorting="True" ShowFooter="true" DataSourceID="objdsGridView" DataKeyNames="EmployeeId">
                <Columns>
                    <asp:TemplateField HeaderText="EmployeeId" SortExpression="EmployeeId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeId") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="btnInsert" runat="server" CssClass="btn btn-light" ImageUrl="~/Icons/plus-lg.svg"
                                OnClick="btnInsert_Click" ValidationGroup="Insertcontrol" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EmployeeName" SortExpression="EmployeeName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqName" runat="server" ValidationGroup="Insertcontrol"
                                ControlToValidate="txtName" Text="*" Display="Dynamic" ErrorMessage="EmployeeName is missing.">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="GroupName" SortExpression="GroupName">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGroupName" runat="server" AutoPostBack="True" DataTextField="GroupName"
                                DataValueField="GroupName" SelectedValue='<%# Bind("GroupName") %>' DataSourceID="objdsGroupName">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGroupName" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlgroup" runat="server" DataSourceID="objdsGroupName"
                                DataTextField="GroupName" DataValueField="GroupName">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqGroup" runat="server" ValidationGroup="Insertcontrol"
                                ControlToValidate="ddlgroup" Text="*" Display="Dynamic" ErrorMessage="GroupName is missing." InitialValue="Select GroupName">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department" SortExpression="Department">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" DataSourceID="objdsDepartment"
                                DataTextField="Name" DataValueField="Name" SelectedValue='<%# Bind("Department") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList runat="server" ID="ddlDept" DataSourceID="objdsDepartment"
                                DataTextField="Name" DataValueField="Name">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqDept" runat="server" ValidationGroup="Insertcontrol"
                                ControlToValidate="ddlDept" Text="*" Display="Dynamic" ErrorMessage="Department is missing." InitialValue="Select Department">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="JobTitle" SortExpression="JobTitle">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlJobTitle" runat="server" AutoPostBack="true" DataSourceID="objdsJobTitle"
                                DataTextField="JobTitle" DataValueField="JobTitle" SelectedValue='<%# Bind("JobTitle") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList runat="server" ID="ddlJob" DataSourceID="objdsJobTitle"
                                DataTextField="JobTitle" DataValueField="JobTitle">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqJob" runat="server" ValidationGroup="Insertcontrol"
                                ControlToValidate="ddlJob" Text="*" Display="Dynamic" ErrorMessage="JobTitle is missing." InitialValue="Select JobTitle">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="True" HeaderText="Settings">
                        <EditItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Icons/check-square.svg" Text="Update" />
                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Icons/x-circle.svg" Text="Cancel" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Icons/pencil-square.svg" Text="Edit" />
                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure, you want to delete?');" ImageUrl="~/Icons/trash.svg" Text="Delete" />
                        </ItemTemplate>
                        <ControlStyle Height="20px" Width="20px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" VerticalAlign="Middle" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <div class="text-center p-5">
                <asp:Label runat="server" ID="lblmessage" Text=""></asp:Label>
                <asp:ValidationSummary ID="validationsummary" ForeColor="Red" runat="server" />
                <asp:ValidationSummary ID="Validationinsert" ValidationGroup="Insertcontrol" ForeColor="Red" runat="server" />
            </div>
        </div>
        <asp:ObjectDataSource ID="objdsGridView" runat="server" SelectMethod="GetAllEmployees" TypeName="Gridview.EmployeeDataAccessLayer"
            UpdateMethod="UpdateEmployee" DeleteMethod="DeleteEmployee" OnDeleted="ObjectDataSource1_Deleted"
            ConflictDetection="CompareAllValues" OnUpdated="ObjectDataSource1_Updated" OldValuesParameterFormatString="Old_{0}"
            InsertMethod="InsertEmployee">
            <DeleteParameters>
                <asp:Parameter Name="Old_EmployeeId" Type="Int32" />
                <asp:Parameter Name="Old_EmployeeName" Type="String" />
                <asp:Parameter Name="Old_Department" Type="String" />
                <asp:Parameter Name="Old_GroupName" Type="String" />
                <asp:Parameter Name="Old_JobTitle" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EmployeeName" Type="String" />
                <asp:Parameter Name="Department" Type="String" />
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="JobTitle" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Old_EmployeeId" Type="Int32" />
                <asp:Parameter Name="Old_EmployeeName" Type="String" />
                <asp:Parameter Name="Old_Department" Type="String" />
                <asp:Parameter Name="Old_GroupName" Type="String" />
                <asp:Parameter Name="Old_JobTitle" Type="String" />
                <asp:Parameter Name="EmployeeName" Type="String" />
                <asp:Parameter Name="Department" Type="String" />
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="JobTitle" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="objdsDepartment" runat="server" SelectMethod="GetAllDepartments"
            TypeName="Gridview.EmployeeDataAccessLayer"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="objdsGroupName" runat="server" SelectMethod="GetAllGroupName"
            TypeName="Gridview.EmployeeDataAccessLayer"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="objdsJobTitle" runat="server" SelectMethod="GetAllJobTitle"
            TypeName="Gridview.EmployeeDataAccessLayer"></asp:ObjectDataSource>
    </form>
</body>
</html>
