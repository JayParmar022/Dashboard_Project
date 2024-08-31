<%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="payment.aspx.vb" Inherits="user_payment" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style10
        {
            width: 106px;
        }
        .style11
        {
        width: 490px;
        text-align: left;
    }
    .style12
    {
        text-align: left;
        margin-left: 160px;
    }
    .bg-color
    {
         background-color:#1d232f;
        color:White;    
    }
    .btn-payment
    {
         font-size:15px;
         letter-spacing: 1px;
         font-weight  : 600;
         border-radius: 5px;
         background-color:#8bc34a;
         cursor:pointer;
    }
    .btn-payment:hover
    {
        background-color:8bc34a;
        color: White;
       }
    .style13
    {
        width: 106px;
        height: 29px;
    }
    .style14
    {
        width: 490px;
        text-align: left;
        height: 29px;
    }
    .style15
    {
        height: 29px;
    }
    .style16
    {
        background-color: #1d232f;
        color: White;
        height: 5px;
    }
    .style1 tblpayment
    {
    	}
    .style1 bgcolor-payment
    {
    	}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="style1 tblpayment"  >
        <tr>
            <td>
                <h1 style="text-align: center ">
                    Payment</h1>
            </td>
        </tr>
        <tr>
            <td class="style16">
                </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700" class="bg-color">
                <h3>
                                    Choose Payment Method</h3>
            </td>
        </tr>
        <tr>
            <td class="bg-color">
                <center><asp:Label ID="Label4" runat="server" Text="Please select payment method" ForeColor="#00CC00"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="bg-color">
                <asp:RadioButtonList ID="radiobuttonlist" runat="server" 
                    RepeatDirection="Horizontal" Width="100%" AutoPostBack="True">
                    <asp:ListItem Value="creditcard">Credit/Debit Card</asp:ListItem>
                    <asp:ListItem Value="googlepay">Google Pay</asp:ListItem>
                    <asp:ListItem Value="upi">UPI</asp:ListItem>
                    <asp:ListItem Value="cod">Cash On Delivery</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelcreditcard" runat="server" GroupingText="Credit/Debit Card" 
                    class="bg-color">
                    <table class="style1 bgcolor-payment">
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                Card Number</td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                <asp:TextBox ID="txtcardnumber" runat="server" Width="464px" required=""></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtcardnumber" ErrorMessage="Card number must be of 16 digit !" 
                        ForeColor="Orange" Font-Size="13px" SetFocusOnError="True" ValidationExpression="\d{16}">Card number must be of 16 digit !</asp:RegularExpressionValidator>
                            </td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                Card CVV&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expiry Month&nbsp;&nbsp; Expiry Year</td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                <asp:TextBox ID="txtexpirydate" runat="server" required="" ></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtexpirymonth" runat="server" placeholder="MM" 
                                    Width="67px" required=""></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtexpirymonth0" runat="server" placeholder="YYYY" 
                                    Width="67px" required=""></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtexpirydate" ErrorMessage="Invalid CVV Number !" 
                                    Font-Size="13px" ForeColor="Orange" SetFocusOnError="True" 
                                    ValidationExpression="^[0-9]{3}$">Invalid CVV Number !</asp:RegularExpressionValidator>
                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="txtexpirymonth" ErrorMessage="Invalid Month !" 
                                    Font-Size="13px" ForeColor="Orange" SetFocusOnError="True" 
                                    ValidationExpression="^[0-9]{2}$">Invalid Month !</asp:RegularExpressionValidator>
                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ControlToValidate="txtexpirymonth0" ErrorMessage="Invalid Year!" 
                                    Font-Size="13px" ForeColor="Orange" SetFocusOnError="True" 
                                    ValidationExpression="^[0-9]{4}$">Invalid Year!</asp:RegularExpressionValidator>
                            </td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                Card Holder Name</td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                <asp:TextBox ID="txtcardholdername" runat="server" Width="464px" required=""></asp:TextBox>
                                <br />
                                <asp:Label ID="lblotp" runat="server" Text="Enter OTP" Visible="False"></asp:Label> <br />
                                <asp:TextBox ID="txtotp" runat="server" Visible="False" ></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" 
                                    Visible="False"></asp:Label>
                            </td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="lblmsg" runat="server" Text="OTP is:" Visible="False"></asp:Label>
                            </td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td style="text-align: justify">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnotp" runat="server" 
                                    BorderStyle="None" class="btn-payment" 
                                     Height="31px" Text="Generate OTP" Width="155px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnccpayment" runat="server" Height="31px" 
                                    Text="Make Payment" Width="155px" class="btn-payment" BorderStyle="None" 
                                    CommandArgument="Credit / Debit Card" CommandName="crdb"/>
                            </td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panelgpay" runat="server" GroupingText="Google Pay" 
                    class="bg-color">
                    <table class="style1 bgcolor-payment">
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td class="style12">
                                GPay Phone Number :
                                <asp:TextBox ID="txtgpnumber" runat="server" required></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                    ControlToValidate="txtgpnumber" 
                                    ErrorMessage="Phone number must be of 10 digit !" Font-Size="13px" 
                                    ForeColor="Orange" SetFocusOnError="True" ValidationExpression="\d{10}">Phone 
                                number must be of 10 digit !</asp:RegularExpressionValidator>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                <asp:Label ID="lblotp0" runat="server" Text="OTP :" Visible="False"></asp:Label>
                                &nbsp;<asp:TextBox ID="txtotp0" runat="server" Visible="False"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Label" 
                                    Visible="False"></asp:Label>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblmsg0" runat="server" Text="OTP is:" Visible="False"></asp:Label>
                                &nbsp;&nbsp;&nbsp;
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnotp0" runat="server" BorderStyle="None" 
                                    class="btn-payment" Height="31px" Text="Generate OTP" Width="155px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btngpaypayment" runat="server" BorderStyle="None" 
                                    class="btn-payment" CommandArgument="Google Pay" CommandName="gpay" 
                                    Height="31px" Text="Make Payment" Width="155px" />
                            </td>
                            <td width="10%">
                                &nbsp; </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panelpaytm" runat="server" GroupingText="UPI" 
                    class="bg-color">
                    <table class="style1 bgcolor-payment">
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style13">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UPI Id :</td>
                                        <td class="style14">
                                            <asp:TextBox ID="txtgpnumber0" runat="server" required=""></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                                ControlToValidate="txtgpnumber0" 
                                                ErrorMessage="Phone number must be of 10 digit !" Font-Size="13px" 
                                                ForeColor="Orange" SetFocusOnError="True" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid 
                                            UPI ID</asp:RegularExpressionValidator>
                                            <br />
                                        </td>
                                        <td class="style15">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td class="style10">
                                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblotp1" runat="server" Text="OTP :"></asp:Label>
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblmsg1" runat="server" Text="OTP is:" Visible="False"></asp:Label>
                                        </td>
                                        <td class="style11">
                                            <asp:TextBox ID="txtotp1" runat="server" ></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Label" 
                                                Visible="False"></asp:Label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                        
                                        <td>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                    <td class="style11">
                                        &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button1" runat="server" BorderStyle="None" class="btn-payment" 
                                                Height="31px" Text="Generate OTP" Width="155px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td class="style11">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnupipayment" runat="server" BorderStyle="None" 
                                            class="btn-payment" CommandArgument="UPI" CommandName="upi" Height="31px" 
                                            Text="Make Payment" Width="152px" /></td>
                                                
                                    </tr>
                                </table>
                            </td>
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panelcod" runat="server" GroupingText="Cash On Delivery" 
                   class="bg-color">
                    <table class="style1 bgcolor-payment" style="width: 100%">
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                             <td class="style11">
                                Pay at 
                                Delivery&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Button ID="btnsubmitcod" runat="server" BorderStyle="None" 
                                     class="btn-payment" CommandArgument="Cash On Delivery" CommandName="cod" 
                                     Height="31px" Text="Place Order" Width="155px" />
                                 <br />
                                    <br />
                                <asp:Label ID="lblcodotp" runat="server" Text="Enter OTP(send in email) :" 
                                     Visible="False"></asp:Label>
                                            <asp:TextBox ID="Txtcodotp" runat="server" Visible="False" ></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="Label" 
                                                Visible="False"></asp:Label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Button ID="btncodpayment" runat="server" BorderStyle="None" 
                                     class="btn-payment" CommandArgument="Cash On Delivery" CommandName="cod" 
                                     Height="31px" Text="Place Order" Visible="False" Width="155px" />
                                </td>
                                        
                            <td width="10%">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

