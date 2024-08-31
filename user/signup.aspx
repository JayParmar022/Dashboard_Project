<%@ Page Language="VB" MasterPageFile="~/user/usernav.master" AutoEventWireup="false" CodeFile="signup.aspx.vb" Inherits="user_signup" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
       .loginbox 
       {
            width: 945px;
           
            color: rgb(255, 255, 255);
            background: #1d232f;
            position: relative;
            box-sizing: border-box;
            padding: 70px 43px;
            border-radius: 20px;
            margin-top: 71px;
            marker-: 71px 0;
            margin-bottom: 20px;
        }
        .imguser {
            border-radius: 50%;
            height: 100px;
            width: 100px;
            position: absolute;
            top: -50px;
            left: calc(50% - 50px);
        }
        .heading-login
        {
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 30px;
        }
        .loginbox p {
            margin: 0;
            padding: 0;
            font-size: 20px;
            font-weight: bold;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .loginbox input[type="text"],
        input[type="password"],input[type="number"],input[type="email"] {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 30px;
            width: 400px;
            margin-bottom: 20px;
            color: #fff;
            font-size: 15px;
        }

        .loginbox input[type="submit"] {
            border: none;
            outline: none;
            height: 35px;
            width: 240px;
            background: #8bc34a;
            color: White;
            font-size: 18px;
            border-radius: 5px;
        }

        .loginbox input[type="submit"]:hover {
            cursor: pointer;
            background: White;
            color: #8bc34a;
        }

        .loginbox a {
            text-decoration: none;
            font-size: 14px;
            text-align:center;
            color: darkgray;
        }
        .login-link
        { 
            margin-top:5px;
            display:flex;
            justify-content: center;
            align-items:center;
            flex-direction: column;
            }
        .loginbox a:hover {
            color: #8bc34a;
        }
        .signup-msg
        { 
            margin-top:5px;
            display:flex;
            justify-content: center;
            align-items:center;
            flex-direction: column;
            }
         .btn-signup
         {
            display:flex;
            justify-content:center;
            align-item:center;
         }
         .container
         {
            display:flex;
            flex-direction:row; 
            margin-top: 8px;   
         }
         .mb
         {
             margin-bottom:10px;
         }
         .sec-1
         {
            margin-right:50px   
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="30%">
                &nbsp;</td>
            <td>
                <div class="loginbox">
                    <asp:Image ID="imguse" class="imguser" runat="server" ImageUrl="~/img/icons/avatar.png" />
                    <h1 class="heading-login">SignUp Here</h1>
                    <div class="container">
                    
                   <div class="sec-1">
                    <div>
                    <label for="txtname">UserName</label><asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtname" ErrorMessage="Name cannot be black !" 
                        ForeColor="Orange" Font-Size="13px"  SetFocusOnError="True">*</asp:RequiredFieldValidator> <br />
                    <asp:TextBox ID="txtname" runat="server" placeholder="Enter UserName"></asp:TextBox>
                    </div>

                    <div>
                    <label for="txtemail">E-mail</label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtemail" ErrorMessage="Email cannot be blank !" 
                         ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtemail" ErrorMessage="Please enter email address !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please enter email address !</asp:RegularExpressionValidator><br />
                    <asp:TextBox ID="txtemail" runat="server" placeholder="Enter Email address"></asp:TextBox>
                    </div>

                    <div style="margin-bottom:25.5px">
                    <label >Gender </label> 
                        <br /> 
                        <div style="margin-top:7px">
                            <asp:RadioButton ID="male" runat="server" GroupName="g" Text="Male" />
                            <asp:RadioButton ID="f" runat="server" GroupName="g" Text="Female" />
                        </div>
                        </div>

                    <div>
                    <label for="txtphno">Phone Number</label><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtphno" ErrorMessage="Phone number cannot be blank !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtphno" ErrorMessage="Phone number must be of 10 digit !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True" ValidationExpression="\d{10}">Phone number must be of 10 digit !</asp:RegularExpressionValidator> <br />--%>
                     <asp:TextBox ID="txtphno" runat="server" placeholder="Enter Phone Number" ></asp:TextBox>
                    </div>

                    <div>
                    <label for="txtuserpass">Password</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtuserpass" ErrorMessage="Password cannot be blank !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="txtuserpass" 
                        ErrorMessage="Password should contain minimum 8 character !"   Font-Size="13px"   ForeColor="Orange" 
                        ValidationExpression="[^ ]{8,16}">Password should contain minimum 8 character !</asp:RegularExpressionValidator> <br />
                    <asp:TextBox ID="txtuserpass" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                    </div>

                    <div>
                    <label for="txtcuserpass">Confirm Password</label> 
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtuserpass" ControlToValidate="txtcuserpass" 
                        ErrorMessage="Password dosen't match !" ForeColor="Orange" Font-Size="13px"  
                            SetFocusOnError="True">Password dosen&#39;t match !</asp:CompareValidator> <br />
                    <asp:TextBox ID="txtcuserpass" runat="server" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
                    </div>
                   </div>

                   <vr />
                    <div class="sec-2">
                    
                    <div>
                     <label for="txthouseno">House Number</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txthouseno" ErrorMessage="House No. cannot be blank !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator> <br />
                     <asp:TextBox ID="txthouseno" runat="server" placeholder="Enter House Number" ></asp:TextBox>
                    </div>

                    <div>
                    <label for="txtaddress">Address</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtaddress" ErrorMessage="Address cannot be blank !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator> <br />
                    <asp:TextBox ID="txtaddress" runat="server" placeholder="Enter Address" ></asp:TextBox>
                    </div>

                    <div>
                    <label for="txtlandmark">Landmark</label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtlandmark" ErrorMessage="Landmark cannot be blank !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator> <br />
                    <asp:TextBox ID="txtlandmark" runat="server" placeholder="Enter Landmark" ></asp:TextBox>
                    </div>

                    <div>
                    <label for="txtpincode">Pincode</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtpincode" ErrorMessage="Pincode cannot be blank !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="txtpincode" runat="server" placeholder="Enter Pincode" ></asp:TextBox>
                    </div>

                    <div>
                    <label for="txtstate">City</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txtstate" ErrorMessage="State cannot be blank !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="txtstate" runat="server" placeholder="Enter city"></asp:TextBox>
                    </div>
                    </div>
                    </div>
                    <div class="btn-signup">
                    <asp:Button ID="btnsignup" runat="server" Text="Sign-up" />
                    </div>

                    <div class="signup-msg">
                        <asp:Label ID="lblmsg" runat="server"  Text="Label" Visible="False" 
                            ForeColor="Orange"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                         ShowSummary="False" />
                    </div>

                    <div class="login-link">
                    <a href="userlogin.aspx">Already have an account</a> 
                    </div>

                </div>   
            </td>
            <td width="30%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
            
        </tr>
    </table>
</asp:Content>
