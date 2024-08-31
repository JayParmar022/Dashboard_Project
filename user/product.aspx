<%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="product.aspx.vb" Inherits="product" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style10
        {
            width: 98px;
        }
        .style11
        {
            width: 98px;
            height: 32px;
        }
        .style12
        {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                  <h1 style="text-align: center ">
                    Items </h1>
                    </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <asp:Label ID="Label1" runat="server"></asp:Label>

            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
        RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10" 
        GridLines="Both" CssClass="pimg">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle  Font-Bold="True" ForeColor="White" />
        <ItemStyle  ForeColor="Black" />
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td colspan="2" >
                        <asp:Image ID="Image1" runat="server" Height="170px" margin-top="5px"
                            ImageUrl='<%# Eval("imageurl") %>' Width="250px" CssClass="pimg" style="margin-bottom: 15px;"/>
                    </td>
                </tr>
                <tr>
                    <td class="style10" >
                        Name</td>
                    <td align="left">
                        : <asp:Label ID="lblpname" runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        Price</td>
                    <td align="left">
                        : <asp:Label ID="lblprice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                       
                        <table align="center" class="style1">
                            <tr align="center">
                                <td align="right">
                                   
                                  <asp:Button ID="btnaddtocart" runat="server" CommandName="atc" 
                                        oncommand="btnaddtocart_Command1" Text="Add to cart" 
                                        CommandArgument='<%# Eval("pid") %>' CssClass="btn-sty" style="margin-right: 11px;margin-top: 7px;" />
                                 
                                </td>
                            </tr>
                        </table>
                       
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        
    </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

