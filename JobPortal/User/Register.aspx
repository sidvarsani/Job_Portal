<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="JobPortal.User.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class =" container pt-50 pb-40">
            <div class="row">
                    <div class="col-6 pb-10 mx-auto">   
                        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                    </div>
                    <div class="col-12">
                        <h2 class="contact-title text-center">SIGN UP</h2>
                    </div>
                    <div class="col-lg-6 mx-auto">
                        <div class="form-contact contact_form">
                            <div class="row">
                                 <div class="col-12">
                                    <h6>Login Information</h6>
                                 </div>
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
                                        <%--<input class="form-control valid" runat="server" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name" required>--%>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <asp:TextBox ID="txtconfirmPassword" runat="server" CssClass="form-control" placehoolder ="Confirm Password" TextMode="Password" required ></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and Confirm Password Should be same." ControlToCompare="txtPassword" ControlToValidate="txtconfirmPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:CompareValidator>
                                        <%--<input class="form-control valid" runat="server" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email" required>--%>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <h6>Personal Information</h6>
                                 </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <asp:TextBox ID="txtFullname" runat="server" CssClass="form-control" placehoolder ="Enter Full Name" required ></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="special characters are not allowed" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullname" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placehoolder ="Enter Address" TextMode="MultiLine" required ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Mobile No</label>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placehoolder ="Enter Mobile Number" required ></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage=" mobile Number must be 10 degit." ValidationExpression="^[0-9]{10}" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placehoolder ="Enter Email Address" TextMode="Email" required ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Country</label>
                                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100" AppendDataBoundItems="true" DataTextField="COUNTRYNAME" DataValueField="COUNTRYNAME">
                                            <asp:ListItem Value="0">Select counry </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Country is Required" runat="server" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry"></asp:RequiredFieldValidator>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [COUNTRYNAME] FROM [Country]"></asp:SqlDataSource>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group mt-3">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" cssclass="button button-contactForm boxed-btn mr-50" OnClick="btnRegister_Click" />
                                <span class="clickList"><a href="../user/Login.aspx">Already Registered ? Click Here...</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </section>
    
</asp:Content>
