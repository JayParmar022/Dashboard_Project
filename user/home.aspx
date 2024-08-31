<%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style8
        {
            text-align: ;
            display:flex;
            flex-direction: column;
             padding: 20px!important;
             
            
          
        }
        .style8 em
        {
            font-size:100px;
            font-family: "Poppins", Arial, sans-serif;
            text-align: center;
            margin-bottom: 10px;
            color: #8bc34a;
        }
        .style8 span
        {
            font-size:50px;
           font-family: 'Mada', sans-serif;
           color: #293148;
        }
        
       
        a img
        {     opacity: 1;
              display: block;
              width: 100%;
              height: auto;
              transition: .5s ease;
              backface-visibility: hidden;
           
        }  
        .text-contain
        {
              transition: .5s ease in out;
              opacity: 0;
              position: absolute;
              top: 50%;
              left: 50%;
              transform: translate(-50%, -50%);
              -ms-transform: translate(-50%, -50%);
              text-align: center;
        }
       
        .ibox
        {
            position: relative;
            text-align: center;
            color: white;
            margin:2px
        }
        .ibox:hover .avatar {
            opacity: 0.5;
        }

        .ibox:hover .text-contain {
            opacity: 1;
        }
        .txt
        {
          background-color: white;
           color: #8bc34a;
            font-size: 18px;
            padding: 16px 32px;
            border: 1px;
            border-radius: 4px;
        }
     
        .style9
        {
            width: 500px;
        }
        .item-contain
        {
            display: flex !important; 
            justify-content: space-evenly !importnt;
           
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="3">
            <div>
                <img  width="100%" height="800px" src="../img/first.jpg" />
              
            </div>  
            </td>
        </tr>
       
        <tr>
            <td colspan="3">
                 <div class="style8" width="33%">
                    <em> Welcome To Auto Flourish</em>
                </div>
               
                <table class="style1">
                    <tr>
                        <td width="5%">
                            &nbsp;</td>
                        <td align="center">
                
               
                <asp:DataList ID="dlpcatagory" runat="server"  
                    BorderColor="White" CellPadding="3" 
                    CellSpacing="2" GridLines="Both" RepeatColumns="3" 
                    RepeatDirection="Horizontal">
                    <FooterStyle  ForeColor="White" />
                    <HeaderStyle  Font-Bold="True" ForeColor="White" />
                    <ItemStyle  ForeColor="White" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td class="item-contain">
                                    <div class="ibox" >
                                    <a class="imgss" href="product.aspx?catnm=<%# Eval("Pcid") %> " >
                                        <asp:Image ID="Image1" class="avatar" runat="server" ImageUrl='<%# Eval("imageurl") %>' 
                                            Width="460px" Height="300px" BorderColor="White" />
                                        <div class="text-contain">
                                           <p class="txt"><%# Eval("pcname") %></p>
                                         </div>   
                                        
                                     </a>
                                    </div>
                                     
                              
                                    
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                
               
                        </td>
                        <td width="5%">
                            &nbsp;</td>
                    </tr>
                </table>
                
               
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    
</asp:Content>

    



