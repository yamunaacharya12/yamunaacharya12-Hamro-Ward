<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="home.master" CodeBehind="signup.aspx.cs" Inherits="HamroWard.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container">
    <div class="row justify-content-center align-items-center" style="min-height:90vh;">
        <div class="col-lg-5 col-md-7 col-sm-10">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4 fw-bold">Sign Up</h3>

                    <!-- Error/Success Message -->
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3"></asp:Label>

                    <!-- Full Name -->
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                    </div>

                    <!-- Username -->
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                    </div>

                    <!-- Confirm Password -->
                    <div class="mb-3">
                        <label class="form-label">Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
                    </div>

                    <!-- Sign Up Button -->
                    <div class="d-grid">
                        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-success btn-lg" OnClick="BtnSignUp_Click" />
                    </div>

                    <div class="text-center mt-3">
                        <p>Already have an account? <a href="login.aspx">Login</a></p>
                        <small class="text-muted">© 2026 Hamro Ward</small>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
