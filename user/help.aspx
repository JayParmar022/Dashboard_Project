    <%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="help.aspx.vb" Inherits="user_help" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
               width: 1047px;
        }
        .style9
        {
            width: 1007px;
        }
        .style10
        {
            width: 995px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1">
        <div>
            <table class="style10">
                <tr>
                    <td class="style8" rowspan="3">
                      
                    </td>
                    <td class=""></td>
                </tr>
                <tr>
                    <td><h1 style="margin-top: 45px;">DO YOU NEED HELP ?</h1></td>
                </tr>
                <tr>
                    <td class=""></td>
                </tr>
                <tr>
                    <td class="style8">&nbsp;</td>
                    <td class="">
                        <strong>Name :</strong></td>
                </tr>
                <tr>
                    <td class="style8">
                        <table class="">
                            <tr>
                                <td class="" rowspan="2"> <img src="../img/helpicons/add.jpg" width="30px" />&nbsp;&nbsp;&nbsp; </td>
                                <td class=""><strong>Address</strong></td>
                            </tr>
                            <tr>
                                <td class=""><span class="">30-35,Ground&nbsp; Floor,Polaris Arcade</span><br class="auto-style11" />
                                    <span class="">Gujarat,India</span></td>
                            </tr>
                        </table>
                    </td>
                    <td class="">
                        <table class="">
                            <tr>
                                <td>
                        <asp:TextBox ID="txtname" runat="server" CssClass="" Width="451px" Required="require"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Email :</strong></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style8"></td>
                    <td class="">
                        <asp:TextBox ID="txtemail" runat="server" CssClass="auto-style8" Width="451px" Required="require"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="">
                        <table class="auto-style1">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class=""><strong>Phone :</strong></td>
                </tr>
                <tr>
                    <td class="style8">
                        <table class="">
                            <tr>
                                <td class="" rowspan="2"><img src="../img/helpicons/phone.jpg" width="30px" />&nbsp;&nbsp;&nbsp;</td>
                                <td class=""><strong>Let&#39;s Talk</strong></td>
                            </tr>
                            <tr>
                                <td class="">+911234567890</td>
                            </tr>
                        </table>
                    </td>
                    <td class="">
                        <asp:TextBox ID="txtphone" runat="server" CssClass="auto-style8" Width="451px" Required="require"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style8">&nbsp;</td>
                    <td class=""><strong>Choose Query :</strong></td>
                </tr>
                <tr>
                    <td class="style8">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlquery" runat="server" AutoPostBack="True" Height="34px" Width="461px" Required="require">
                            <asp:ListItem>Order Related Issue</asp:ListItem>
                            <asp:ListItem>Order Quality Issue</asp:ListItem>
                            <asp:ListItem>Order Delivery Query</asp:ListItem>
                            <asp:ListItem>Happy</asp:ListItem>
                            <asp:ListItem>Very Good items</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        <table class="">
                            <tr>
                                <td class="" rowspan="2"><img src="../img/helpicons/email.jpg" width="30px" />&nbsp;&nbsp;&nbsp;</td>
                                <td class=""><strong>General Support</strong></td>
                            </tr>
                            <tr>
                                <td class="">info@autoflourish.com</td>
                            </tr>
                        </table>
                    </td>
                    <td class=""><strong>Order No. :</strong></td>
                </tr>
                <tr>
                    <td class="style8">
                        &nbsp;</td>
                    <td class="">
                        <table class="">
                            <tr>
                                <td>
                        <asp:TextBox ID="txtorder" runat="server" CssClass="" Width="451px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style9"></td>
                    <td class=""><strong>Message :</strong></td>
                </tr>
                <tr>
                    <td class="style8" rowspan="3">
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Green" 
                            Text="Message Send Successfull !!" Visible="False"></asp:Label>
                    </td>
                    <td class="">
                        <asp:TextBox ID="txtmsg" runat="server" CssClass="auto-style8" TextMode="MultiLine" Width="451px" Required="require"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="">&nbsp;</td>
                </tr>
                <tr>
                    <td class="">
                        <strong>
                        <asp:Button ID="btnsend" runat="server" Height="34px" Text="Send" Width="451px" Font-Bold="True" Font-Size="16pt" />
                        </strong>
                    </td>
                </tr>
            </table>
        </div>
    </form>

</asp:Content>

