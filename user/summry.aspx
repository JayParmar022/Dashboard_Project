<%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="summry.aspx.vb" Inherits="user_summry" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
    .style8
    {
        text-align: left;
    }
    .style10
    {
        height: 25px;
    }
        .style11
    {
        width: 204px;
    }
    .style12
    {
        width: 56%;
    }
    .back-color
    {
        background-color:#1d232f;
        color:White;
    } 
    .btn-summry
    {
         font-size:15px;
         letter-spacing: 1px;
         font-weight  : 600;
         border-radius: 5px;
         background-color: #8bc34a;
         color:White;
         cursor:pointer;
         border:none;
    }
    .btn-summry:hover
    {
        background-color: #8bc34a;
        color: White;
       }
    .tbl-td
    {
        padding-top:10px;
    }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 &nbsp;<table class="style1 tblmycart">
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: center">
            <h1>
                Order Details</h1>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align:center">
            <asp:GridView ID="grvsummry" runat="server" AutoGenerateColumns="False" 
                CellPadding="3" Width="100%" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                <Columns>
                    <asp:BoundField HeaderText="No." DataField="cartid" />
                    <asp:BoundField HeaderText="Name" DataField="pname" />
                    <asp:BoundField HeaderText="Price" DataField="price" />
                    <asp:BoundField HeaderText="Quntity" DataField="qty" />
                    <asp:BoundField HeaderText="Total" DataField="total" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#8bc34a" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
               <%-- <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />--%>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td width="10%">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td width="10%">
            &nbsp;</td>
    </tr>
    <tr>
        <td width="10%">
            &nbsp;</td>
        <td class="style8">
                    <strong>Order Number</strong> :
                    <asp:Label ID="lblordername" runat="server" Text="SP001"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Total Bill:
            <asp:Label ID="lblordertotalbill" runat="server"></asp:Label>
        </td>
        <td width="10%">
            &nbsp;</td>
    </tr>
    <tr>
        <td width="10%">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td width="10%">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10" width="10%">
        </td>
        <td class="style10 bgcolor-summry" style="text-align: center">
            <h3 style="color:black">
                Address Details</h3>
        </td>
        <td class="style10" width="10%">
        </td>
    </tr>
    <tr>
        <td width="10%">
            &nbsp;</td>
        <td class="bgcolor-summry">
            &nbsp;</td>
        <td width="10%">
            &nbsp;</td>
    </tr>
    <tr>
        <td width="10%">
            &nbsp;</td>
        <td class="bgcolor-summry">
            <table class="style1">
                <tr>
                    <td class="style12">
                        &nbsp;</td>
                    <td class="style11">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td width="50%">
                        <asp:RadioButtonList ID="rbladdress" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal" style="text-align: center" Width="100%">
                            <asp:ListItem Value="existingaddress">Existing Address</asp:ListItem>
                            <asp:ListItem Value="changeaddress">Change Address</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </td>
        <td width="10%">
            &nbsp;</td>
    </tr>
    <tr>
        <td width="10%">
            &nbsp;</td>
        <td class="bgcolor-summry">
            <asp:Panel ID="existingaddpanel" runat="server" class="back-color"  
                GroupingText="Go With Current Address">
                <table class="style1">
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td style="text-align: left">
                            Address :
                            <asp:Label ID="lblshowadd" runat="server"></asp:Label>
                        </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td style="text-align: right">
                            <asp:Button ID="btnplaceorder" runat="server" Height="37px" Text="Payment" 
                                Width="130px" PostBackUrl="~/user/payment.aspx" class="btn-summry" />
                        </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
&nbsp;<asp:Panel ID="changeaddpanel" runat="server" class="back-color" 
                GroupingText="Change Your Address">
                <table class="style1">
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8 tbl-td">
                            Full Name</td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:TextBox ID="txtname" runat="server" Width="465px"></asp:TextBox>
                        </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8 tbl-td">
                            House/Flat Number</td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:TextBox ID="txtaddnumber" runat="server" Width="102px"></asp:TextBox>
                        </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8 tbl-td">
                            Address</td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:TextBox ID="txtaddress" runat="server" Width="465px"></asp:TextBox>
                        </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8">
                            <table class="style1">
                                <tr>
                                    <td class="style8 tbl-td">
                                        LandMark</td>
                                    <td width="65%" class="style8 tbl-td">
                                        Pincode</td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        <asp:TextBox ID="txtlandmark" runat="server"></asp:TextBox>
                                    </td>
                                    <td width="65%" class="style8">
                                        <asp:TextBox ID="txtpincode" runat="server" Width="168px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8 tbl-td">
                                        City</td>
                                    <td width="65%" class="style8 tbl-td">
                                        State</td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                                    </td>
                                    <td width="65%" class="style8">
                                        <asp:TextBox ID="txtstate" runat="server" Width="168px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8 tbl-td">
                            Instruction</td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:TextBox ID="txtinstruction" runat="server" Rows="3" 
                                TextMode="MultiLine" Width="477px"></asp:TextBox>
                            </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="10%">
                            &nbsp;</td>
                        <td style="text-align: center">
                            &nbsp;<br />
                            <asp:Button ID="btnchngadd" runat="server" Height="37px" Text="Change" 
                                Width="130px" class="btn-summry" />
                        </td>
                        <td width="10%">
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td width="10%">
            &nbsp;</td>
    </tr>
    </table>
</asp:Content>

