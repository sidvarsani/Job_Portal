<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobPortal.User.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <section>
        <div class =" container pt-50 pb-40">
            <div class="row">
                    <div class="col-6 pb-8 mx-auto">   
                        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                    </div>
                    <div class="col-12">
                        <h2 class="contact-title text-center">SIGN  IN</h2>
                    </div>
                    <div class="col-lg-6 mx-auto">
                        <div class="form-contact contact_form">
                            <div class="row">
                                  <div class="col-12">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placehoolder ="Enter Unique Username" required ></asp:TextBox>
                                       
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placehoolder ="Enter Password" TextMode="Password" required></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Login Type</label>
                                        <asp:DropDownList ID="ddlLogintype" runat="server"  CssClass="form-contact w-100">
                                            <asp:ListItem Value="0">Select Login type </asp:ListItem>
                                            <asp:ListItem>Admin</asp:ListItem>
                                            <asp:ListItem>User </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="User Type is Required" runat="server" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlLogintype"></asp:RequiredFieldValidator>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [COUNTRYNAME] FROM [Country]"></asp:SqlDataSource>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group mt-3">
                                <asp:Button ID="btnLogin" runat="server" Text="lOGIN" cssclass="button button-contactForm boxed-btn mr-50" OnClick="btnLogin_Click" />
                                <span class="clickList"><a href="../user/Register.aspx">New user ? Click Here...</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </section>

</asp:Content>
