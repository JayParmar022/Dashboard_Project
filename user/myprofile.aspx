<%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="myprofile.aspx.vb" Inherits="user_myprofile" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
       .loginbox 
       {
            width: 945px;
            height: 540px;
            color: rgb(255, 255, 255);
            background: #1d232f;
            
            position: relative;
            box-sizing: border-box;
            padding: 35px 35px;
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
            color: #ffc107;
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
         .sec-2{}
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
                    <%--<asp:Image ID="imguse" class="imguser" runat="server" ImageUrl="~/img/icons/avatar.png" />--%>
                    <h1 class="heading-login">My Profile</h1>
                    <div class="container">
                    
                        <div class="sec-1">
                        <div>
                        
                                    <asp:Label ID="Label3" runat="server" Text="Show details, click 'Edit' button" ForeColor="#FF3300"></asp:Label>
                        
                        </div>
                             <div>
                                <label for="txtname">Name</label><%--<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtname" ErrorMessage="Name cannot be black !" 
                        ForeColor="Orange" Font-Size="13px"  SetFocusOnError="True">*</asp:RequiredFieldValidator>--%> <br />
                            <asp:TextBox ID="txtname" runat="server"  ReadOnly="true"></asp:TextBox>
                               </div>

                            <div>
                            <label for="txtemail">E-mail</label><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtemail" ErrorMessage="Email cannot be blank !" 
                                 ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator>--%>
                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtemail" ErrorMessage="Please enter email address !" 
                                ForeColor="Orange" Font-Size="13px" SetFocusOnError="True" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please enter email address !</asp:RegularExpressionValidator>--%><br />
                            <asp:TextBox ID="txtemail" runat="server" placeholder="Enter Email address" 
                                    ReadOnly="True"></asp:TextBox>
                            </div>

                            <div style="margin-bottom:25.5px">
                            <label >Gender </label> 
                                <br /> 
                                <div style="margin-top:7px">
                                    <asp:RadioButton ID="male" runat="server" GroupName="g" Text="Male" />
                                    <asp:RadioButton ID="f" runat="server" GroupName="g" Text="Female" />
                                    <asp:TextBox ID="TextBox1" runat="server" Width="16px" ReadOnly="True" 
                                        Visible="False"></asp:TextBox>
                                </div>
                                </div>

                                <div>
                                <label for="txtphno">Phone Number</label><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="txtphno" ErrorMessage="Phone number cannot be blank !" 
                                    ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator>--%>
                               <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ControlToValidate="txtphno" ErrorMessage="Phone number must be of 10 digit !" 
                                    ForeColor="Orange" Font-Size="13px" SetFocusOnError="True" ValidationExpression="\d{10}">Phone number must be of 10 digit !</asp:RegularExpressionValidator>--%> <br />
                                 <asp:TextBox ID="txtphno" runat="server" placeholder="Enter Phone Number" 
                                        ReadOnly="True" ></asp:TextBox>
                                </div>
                    
                    
                                <div>
                                    <label for="txtaddress">Address</label><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtaddress" ErrorMessage="Address cannot be blank !" 
                                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True">*</asp:RequiredFieldValidator>--%> <br />
                                    <asp:TextBox ID="txtaddress" runat="server" placeholder="Enter Address" 
                                        ReadOnly="True" Rows="3" ></asp:TextBox>
                                    
                                     <asp:Label ID="lblmsg" runat="server"  Text = "Update Successfully!" 
                                            ForeColor="Orange" Visible="False"></asp:Label>
                                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;
                                            &nbsp;
                                            &nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:Button ID="update" type="button" runat="server" Text="Update" 
                                        Width="160px" />
                                      &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="edit" Type="Button" runat="server" Text="Edit" Width="160px" />
                                    <br />
                                    <br />
                               </div>
                            
                         </div>

     
                 <div class="sec-2">
                            <div>
                                    <label for="oldpass"> Password</label>
                                <asp:TextBox ID="txtuserpass" runat="server" ReadOnly="True"></asp:TextBox>
                            
                            </div>
                            <div>
                            <label for="oldpass">Old Password</label> <br />
                            <asp:TextBox ID="oldpass" runat="server" placeholder="Enter Old password " ></asp:TextBox>
                            <%--&nbsp;&nbsp;--%>
                                </div>
                    
                             <div>
                            <label for="newpass">New Password</label> <br />
                            <asp:TextBox ID="newpass" runat="server" placeholder="Enter New password " ></asp:TextBox>
                            </div>
                             <div>
                            
                             <asp:Label ID="Label2" runat="server" Visible="False" ForeColor="#FF9900"></asp:Label>
                             
                                 <div class="btn-signup">
                                     <asp:Button ID="Button2" type="submit" runat="server" Text="Change Password" />
                                     
                                     </div>
                            </div>
                          
                    </div>
                  </div>
                        
                        <div class="signup-msg">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                             ShowSummary="False" />
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

