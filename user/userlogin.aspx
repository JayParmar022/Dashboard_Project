<%@ Page Language="VB" MasterPageFile="~/user/usernav.master" AutoEventWireup="false" CodeFile="userlogin.aspx.vb" Inherits="user_userlogin" title="Untitled Page" %>

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
            height: 410px;
            color: rgb(255, 255, 255);
            background: #1d232f;   
            top: 52%;
            left: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
            box-sizing: border-box;
           padding: 70px 51px;
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

       .btn-lg-sty {
            border: none;
            outline: none;
            height: 35px;
            width: 240px;
            background: #8bc34a;
            color: White;
            font-size: 18px;
            border-radius: 5px;
        }

        .btn-lg-sty:hover {
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
            margin-top: 5px;
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
            margin-top:22px;
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
                .style8{}
            
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="style1">
        
        <tr>
            <td width="30%" class="style8">
                </td>
            <td  class="style8">
                <div class="loginbox">
                    <asp:Image ID="imguse" class="imguser" runat="server" ImageUrl="~/img/icons/avatar.png" />
                    <h1 class="heading-login">Login Here</h1>
                    <label for="username" style="text-align:left">Username</label>
                    <asp:TextBox ID="txtusername" runat="server" required=""></asp:TextBox>
                    <label for="password">Password</label>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" required=""></asp:TextBox>
                    <div class="div-btn">
                    <asp:Button ID="btnlogin" class="btn-lg-sty" runat="server" Text="Login" /> 
                    </div>
                    
                    <div class="login-error">
                    <asp:Label ID="lblerrormsg" runat="server" Text="" ForeColor="#FF3300"></asp:Label>
                    </div>
                    <div class="login-link">
                    
                    <a href="signup.aspx">Dont't have an account</a> 
                    <a href="modal.aspx">Forgot password ?</a>
                    <a href="../Admin/login.aspx">Admin login?</a>
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
