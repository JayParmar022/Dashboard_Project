<%@ Page Language="VB" MasterPageFile="~/Admin/adminmst.master" AutoEventWireup="false" CodeFile="procategory.aspx.vb" Inherits="Admin_procategory" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .header
        {
            text-align: center;
            font-size: x-large;
            background-color: #8bc34a;
            height: 50px;
        }
        .tblstyle
        {
            width: 319px;
        }
        
        .form-field1
        {
            width: 106px;
            height: 48px;
        }
        .form-field2
        {
            width: 435px;
            height: 48px;
        }
        .style10
        {
            width: 748px;
        }
        .style14
        {
            width: 313px;
        }
        .style16
        {
            height: 25px;
        }
        .style17
        {
            height: 26px;
        }
        .btn-procat
        {
         font-size:15px;
         letter-spacing: 1px;
         font-weight  : 600;
         border-radius: 5px;
         background-color:#8bc34a;
         cursor:pointer;
         color:White;
         border:none;
        }
         .btn-procat:hover
       {
         background-color: White;
         color: #8bc34a;
       }
       .bg-color-procat
        {
          background-color:#1d232f;
          color:White;
            }
        .style20
        {
            background-color: #1d232f;
            color: White;
            text-align: right;
        }
        .style21
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="style1">
        <tr>
            <td class="header" colspan="4">
                <strong>Product Catagory</strong></td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td><br /><br /></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="25%"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                            &nbsp;</td>
            <td class="style14">
                      &nbsp;</td>
            <td width="25%">&nbsp;</td>
        </tr>
        <tr>
            <td class="style17"></td>
            <td class="bg-color-procat">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
            <td class="bg-color-procat">
                        </td>
            <td width="25%" class="style17"></td>
        </tr>
        <tr>
            <td width="10%">&nbsp;</td>
            <td class="bg-color-procat" width="25%" align="center">Catagory Name :-
                            <asp:TextBox ID="txtcatagoryname" runat="server"></asp:TextBox>
                        </td>
            <td class="bg-color-procat" width="25%" align="center">Image :-
                      <asp:FileUpload ID="fuplcatagoryimg" runat="server" Width="242px" />
                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Select Image" ForeColor="Red" SetFocusOnError="True" 
                                Visible="true" ControlToValidate="fuplcatagoryimg"></asp:RequiredFieldValidator>
                        --%></td>
            <td width="25%">&nbsp;</td>
        </tr>
        <tr>
            <td class="style16" width="25%"></td>
            <td class="bg-color-procat" colspan="2" width="25%">
                            <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Product Category Cannot be blank!!" ForeColor="Red" 
                                SetFocusOnError="True" Visible="True" ControlToValidate="txtcatagoryname"></asp:RequiredFieldValidator>
     --%>
                        </td>
            <td width="25%" class="style16"></td>
        </tr>
        <tr>
            <td width="25%" class="style21">&nbsp;</td>
            <td colspan="2" width="50%" class="style20">
                &nbsp;<asp:Button ID="btnsave" runat="server" Text="Add Catagory"  Font-Size="15px" 
                              type="submit" Height="37px" Width="135px" class="btn-procat" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
            <td width="25%">&nbsp;</td>
        </tr>
        <tr>
            <td width="25%">&nbsp;</td>
            <td class="bg-color-procat">&nbsp;</td>
            <td class="bg-color-procat">&nbsp;</td>
            <td width="25%">&nbsp;</td>
        </tr>
        <tr>
            <td width="25%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
        </tr>
        <tr>
            <td  colspan="4">
                <table class="style1">
                    <tr>
                        <td width="10%">&nbsp;</td>
                        <td width="80%">
                            <asp:GridView ID="grvpcatagory" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" AutoGenerateDeleteButton="True" 
                                AutoGenerateEditButton="True" CellPadding="10" DataKeyNames="pcid" 
                                ForeColor="#333333" GridLines="None" Font-Bold="False" Width="100%">
                            <AlternatingRowStyle BackColor="#FFF8B7" />
                            <Columns>
                                <asp:BoundField DataField="pcid" HeaderText="Catagory Id" />
                                <asp:BoundField DataField="pcname" HeaderText="Catagory Name" />
                                
                                
                                
                                <asp:TemplateField HeaderText="Catagory Image">
                                    <EditItemTemplate>
                                        <asp:Image ID="imgedit" Height="70px" Width="100px" CssClass="pimg" runat="server" ImageUrl='<%# Eval("imageurl") %>' />
                                        <br></br>
                                        <br></br>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="imgview" Height="70px" Width="100px" CssClass="pimg" runat="server" ImageUrl='<%# Eval("imageurl") %>' />
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>



                            </Columns>
                                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="#8bc34a" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#8bc34a" Font-Bold="True" Height="50px" ForeColor="White" 
                            HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#8bc34a" ForeColor="Black" Height="50px" Font-Bold="True" Font-Size="20px" 
                                    HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="Black" HorizontalAlign="Center" 
                            VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#8bc34a" Font-Bold="True" ForeColor="Navy" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                        <%--<SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />--%>
                    </asp:GridView>
                        </td>
                        <td width="10%"> &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
         <tr>
            <td class="style10" colspan="2"><br /><br /><br /><br /></td>
            <td colspan="2">&nbsp;</td>
        </tr>
        </table>
</asp:Content>

