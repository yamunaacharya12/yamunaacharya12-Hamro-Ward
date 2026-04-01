<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BirthForm.aspx.cs" Inherits="xyz.BirthForm" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Birth Registration</title>
</head>
<body>
<form id="form1" runat="server">
    <div>

        Child Name:
        <asp:TextBox ID="txtChildName" runat="server" /><br />

        Father Name:
        <asp:TextBox ID="txtFatherName" runat="server" /><br />

        Mother Name:
        <asp:TextBox ID="txtMotherName" runat="server" /><br />

        Grandfather Name:
        <asp:TextBox ID="txtGrandfather" runat="server" /><br />

        Gender:
        <asp:DropDownList ID="ddlGender" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList><br />

        Birth Place:
        <asp:TextBox ID="txtBirthPlace" runat="server" /><br />

        DOB:
        <asp:TextBox ID="txtDOB" runat="server" /><br />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

    </div>
</form>
</body>
</html>