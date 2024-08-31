<%@ Page Language="VB" MasterPageFile="~/user/usernav.master" AutoEventWireup="false" CodeFile="forpass.aspx.vb" Inherits="Admin_forpass" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        body 
{   
    margin:0;
    padding:0;
    font-family:Arial;
    width:100%;
}
       .loginbox {
             width: 382px;
            
            color: rgb(255, 255, 255);
            background: #1d232f;   
            top: 52%;
            left: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
            box-sizing: border-box;
           padding: 41px 51px;
            border-radius: 20px;
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
        input[type="password"] {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 30px;
            width: 267px;
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
            color: #8bc34a ;
        }

        .loginbox a {
            text-decoration: none;
            font-size: 14px;
            text-align:center;
            color: Darkgray;
        }
        .login-link
        { 
            
            display:flex;
            justify-content: center;
            align-items:center;
            flex-direction: column;
            }
        .loginbox a:hover {
            color: #8bc34a;
        }
         .login-error
        { 
            margin-top:20px;
            display:flex;
            justify-content: center;
            align-items:center;
            flex-direction: column;
            }
             .div-btn
            {
                align-items: center;
                display: flex;
                justify-content: center;
            }
            .mt
            {
                margin-top:5px;
                }
            .style8
            {
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
            <td width="30%" class="style8">
                </td>
            <td  class="style8">
                <div class="loginbox">
                    <h1 class="heading-login">Forget Password</h1>
                    <label for="txtusername" style="text-align:left">Username</label>
                    <asp:TextBox ID="txtusername" runat="server" required=""></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" ForeColor="Green" Visible="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:label ID="newpass" runat="server" style="text-align:left" Text="Enter new password" Visible="False"></asp:label>
                    <asp:TextBox ID="txtnewpass" runat="server" required="" Visible="False"></asp:TextBox>
                    <div class="div-btn">
                    <asp:Button ID="btnlogin" runat="server" Text="Submit" />
                        <asp:Button ID="change" runat="server" Text="Chage password" Visible="False" />
                        
                    </div> 
                    <div class="login-error">
                    <asp:Label ID="lblerrormsg" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                    <div class="login-link">
                   <a class="mt" href="login.aspx">Admin Login..</a>
                </div>
                </div>
                </td>
            <td width="30%" class="style8">
                </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

