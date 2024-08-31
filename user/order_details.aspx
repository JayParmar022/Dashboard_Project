<%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="order_details.aspx.vb" Inherits="user_order_details" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style8
        {
            height: 70px;
            text-align: center;
            color:White;
        }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style8" colspan="4">
                <h1> My Orders </h1>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblmsg" runat="server" style="text-align: center" 
                    ForeColor="Red"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:GridView ID="grvorder" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="3" DataKeyNames="orderid" 
                    style="text-align: center" Width="100%" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                    <Columns>
                        <asp:ImageField DataImageUrlField="imageurl" HeaderText="Product">
                            <ControlStyle Height="70px" Width="100px" CssClass="pimg" />
                        </asp:ImageField>
                        <asp:TemplateField HeaderText="Order ID">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="pname" HeaderText="Product Name" />
                        <asp:BoundField DataField="price" HeaderText="Price" />
                        <asp:BoundField DataField="qty" HeaderText="Quantity" />
                        <asp:BoundField DataField="total" HeaderText="Total" />
                        <asp:BoundField DataField="orderstatus" HeaderText="Order Status" />
                        <asp:BoundField DataField="orderdate" HeaderText="Date" />
                       <%-- <asp:BoundField DataField="paymentid" HeaderText="PaymentId" />--%>
                       <%-- <asp:BoundField DataField="orderstatus" HeaderText="Order Status" />--%>
                       <%-- <asp:TemplateField HeaderText="Order Date">--%>
                            <%--<ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("orderdate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <%--<SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />--%>
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


