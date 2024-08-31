<%@ Page Language="VB" MasterPageFile="~/Admin/adminmst.master" AutoEventWireup="false" CodeFile="complain.aspx.vb" Inherits="Admin_complain" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .heading
        {
            text-align: center;
            font-size: x-large;
            background-color: #8bc34a;
            height:50px;
        }
        .style7
        {
            text-align: center;
            font-size: x-large;
            background-color: #8bc34a;
            height: 50px;
            font-weight: bold;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table class="style1">
        <tr>
             <td class="style7" colspan="3">
                 Feedback</td>
        </tr>
        <tr>
            <td width="8%">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="8%">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="8%">
                &nbsp;</td>
            <td>
                <asp:GridView ID="grvcom" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="10" DataKeyNames="Id" 
                    Width="100%" style="text-align: center" ForeColor="#333333" 
                    GridLines="None" Font-Size="Large">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="phoneno" HeaderText="Phone No." />
                        <asp:BoundField DataField="query" HeaderText="Query" />
                        <asp:BoundField DataField="orderno" HeaderText="Order No." />
                        <asp:BoundField DataField="msg" HeaderText="Message" />
                    </Columns>
                    <FooterStyle BackColor="#8bc34a" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#8bc34a" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                   <%-- <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />--%>
                </asp:GridView>
            </td>
            <td width="8%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

