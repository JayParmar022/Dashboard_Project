<%@ Page Language="VB" MasterPageFile="~/Admin/adminmst.master" AutoEventWireup="false" CodeFile="product.aspx.vb" Inherits="Admin_product" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
  
        .heading
        {
            text-align: center;
            font-size: x-large;
            background-color: #8bc34a;
            height:50px;
        }
        
        .tblstyle1
        {
            width: 545px;
        }
                
        .tblstyle2
        {
            height: 27px;
            width: 232px;
        }
        .btn-product
        {
            font-size:18px;
         letter-spacing: 1px;
         font-weight  : 600;
         border-radius: 5px;
         background-color:#8bc34a;
         color:White;
         cursor:pointer;
         border:none;
        
        }
        .btn-product:hover
       {
         background-color: White;
         color:#8bc34a;
       }
       .bg-color-pro
        {
          background-color:#1d232f;
          color:White;
         }
        .style7
        {
            background-color: #1d232f;
            color: White;
            text-align: left;
        }
        .mt
        {
            margin-top:5px;
        }
        .style8
        {
            height: 31px;
        }
        .style9
        {
            text-align: right;
        }
     .style10
     {
         height: 25px;
     }
     .style11
     {
         background-color: #1d232f;
         color: White;
         height: 25px;
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table class="style1">
        <tr>
            <td class="heading" colspan="6">
                <strong>Products</strong></td>
        </tr>
        <tr>
            <td colspan="5"><br /> <br /><br /></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td  colspan="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="15%">&nbsp;</td>
            <td width="17.5%" class="bg-color-pro">&nbsp;</td>
            <td width="17.5%" class="bg-color-pro">&nbsp;</td>
            <td width="17.5%" class="bg-color-pro">&nbsp;</td>
            <td width="17.5%" class="bg-color-pro">&nbsp;</td>
            <td width="15%">&nbsp;</td>
        </tr>
        <tr>
            <td width="15%">&nbsp;</td>
            <td width="17.5%" class="style7">&nbsp;&nbsp;&nbsp;&nbsp; Product Catgory Id :-</td>
            <td width="17.5%" class="style7">Product Name :-</td>
            <td width="17.5%" class="style7">Price :-</td>
            <td width="17.5%" class="style7">Image :-</td>
            <td width="15%">&nbsp;</td>
        </tr>
        <tr>
            <td width="15%">&nbsp;</td>
            <td width="17.5%" class="style7">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="ddlpcid" AutoPostBack="True" runat="server" Width="165px" class="mt">
                            </asp:DropDownList>
                        </td>
            <td width="17.5%" class="style7">
                            <asp:TextBox ID="txtpname" runat="server" class="mt"></asp:TextBox>
                        </td>
            <td width="17.5%" class="style7">
                            <asp:TextBox ID="txtprice" runat="server" class="mt"></asp:TextBox>
                        </td>
            <td width="17.5%" class="style7">
                            <asp:FileUpload ID="fuplproductimg" runat="server" class="mt"/>
                        </td>
            <td width="15%">&nbsp;</td>
        </tr>
        <tr>
            <td width="15%" class="style8 "></td>
            <td colspan="4" class="style8 bg-color-pro">
                            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" ></asp:Label>
                        </td>
            <td width="15%" class="style8"></td>
        </tr>
        <tr>
            <td width="15%">&nbsp;</td>
            <td colspan="4" class="bg-color-pro">
                            &nbsp;</td>
            <td width="15%">&nbsp;</td>
        </tr>
        <tr>
            <td width="15%">&nbsp;</td>
            <td colspan="4" class="style9 bg-color-pro">
                            <asp:Button ID="btnadd" runat="server" Font-Size="15px" Text="Add Product" 
                                Height="37px" Width="130px" class="btn-product"  />
                       
                        </td>
            <td width="15%">&nbsp;</td>
        </tr>
        <tr>
            <td width="15%" class="style10"></td>
            <td colspan="4" class="style11"> 
            
            </td>
            <td width="15%" class="style10"></td>
        </tr>
        <tr>
            <td colspan="5">
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Label  ID="lblcount" runat="server" Text=""></asp:Label>
                
                <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTotalSum" runat="server" Text=""></asp:Label><br /></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="style1">
                    <tr>
                        <td width="10%">&nbsp;</td>
                        <td>
                            <asp:GridView ID="grvproduct" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" AutoGenerateDeleteButton="True" 
                                AutoGenerateEditButton="True" CellPadding="10" DataKeyNames="pid" 
                                ForeColor="Black" GridLines="None" Width="100%">
                                <AlternatingRowStyle BackColor="#FFF8B7" />
                                <Columns>
                                    <asp:BoundField DataField="pid" HeaderText="Prduct Id" />
                                    <asp:BoundField DataField="pcid" HeaderText="Catagory Id" />
                                    <asp:BoundField DataField="pname" HeaderText="Product Name" />
                                    <asp:BoundField DataField="price" HeaderText="Price" />
                                    <asp:TemplateField HeaderText="Product Image">
                                        
                                        <EditItemTemplate>
                                            <asp:Image ID="imgedit" runat="server" Height="70px" Width="100px" ImageUrl='<%# Eval("imageurl") %>' CssClass="pimg" />
                                            <br></br>
                                            <br></br>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="imgview" Height="70px" Width="100px" runat="server" ImageUrl='<%# Eval("imageurl") %>' CssClass="pimg" />
                                        </ItemTemplate>
                                       

                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <FooterStyle BackColor="#8bc34a" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#8bc34a" Font-Bold="True" ForeColor="White"  Height="50px"  />
                                <PagerStyle BackColor="#8bc34a" ForeColor="Black" HorizontalAlign="Center" 
                                    Height="50px" Font-Bold="True" VerticalAlign="Middle" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="Black" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <SelectedRowStyle BackColor="#8bc34a" Font-Bold="True" ForeColor="Navy" />
                                <%--<SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />--%>
                            </asp:GridView>
                        </td>
                        <td width="10%">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        <td align="left"> 
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            
            </tr>
        <tr>
            <td colspan="5"><br /><br /><br /></td>
            <td>&nbsp;</td>
        </tr>
        </table>
</asp:Content>

