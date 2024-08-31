<%@ Page Language="VB" MasterPageFile="~/user/usermast.master" AutoEventWireup="false" CodeFile="aboutus.aspx.vb" Inherits="user_aboutus" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            font-size: medium;
            text-align: justify;
            height: 128px;
        }
        .head-sty
        {
            height: 134px;
            font-size: xx-large;
        }
        .style9
        {
        }           
        .style13
        {
            font-size: medium;
            text-align: justify;
            width: 55%;
        }
        .style17
        {
            height: 128px;
        }
        .style18
        {
            height: 70px;
        }
        .style19
        {
            font-size: large;
        }
        .style21
        {
            height: 54px;
        }
        .style22
        {
            height: 52px;
        }
        .about-img
        {
                align-items: center;
                display: flex;
                justify-content: center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td align="center" colspan="2" class="head-sty" 
                style="font-size: 40px; font-weight: 600">About Us</td>
        </tr>
        <tr>
            <td colspan="2" class="style21" 
                style="border-top-style: solid; border-top-width: 5px; border-top-color: #DADADA;">
                <br />
            </td>
        </tr>
        <tr>
            <td class="style17 about-img" >
                <asp:Image  ID="Image1" runat="server" ImageUrl="~/img/icons/rocket (2).png" 
                    Width="38%" />
            </td>
            <td align="justify" class="style6" width="60%" 
                style="border: 1px solid #D8D8D8; padding: 20px; ">
                Everything began in 1980 when the proprietor opened his first 
                shop. After few months he thought to work with morden technology and this 
                was gigantically fruitful and this driven him to begin online shop called auto 
                flourish.<br />&nbsp;<br />
                He opened the principal store in 1999 in surat,gujarat in the india. Today, 
                ‘auto flourish’ can be found in 27 nations worldwide in in excess of 10,900 areas 
                and have our sights on extending much more.
             </td>
        </tr>
        <tr>
            <td colspan="2" class="style18">
                <br />
            </td>
        </tr>

        </table>

        <table class="style1">
        <tr>
            <td align="justify" class="style13" 
                style="border: 1px solid #D8D8D8; padding: 20px; " width="60%">
                We Believe in Quality. Quality can’t be made without quality 
                initiative. We have almost 354 items that our shop&#39;s.
                <br />&nbsp;<br />
                This is our new step to sale you an quality at your doorstep whenever you 
                want. Just make order us whenever you feel buy and get your favorite accessories in just 
                few days.
            </td>
            <td class="style9 about-img">
                     <asp:Image  ID="Image2" runat="server" ImageUrl="../img/icons/7771777_3699591.jpg" Width="36%" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style18">
                <br />
            </td>
        </tr>
      </table>

      <table class="style1">
        <tr>
            <td class="style17 about-img">
                <asp:Image  ID="Image3" runat="server" ImageUrl="~/img/icons/target.png" Width="38%" />
            </td>
            <td align="justify" class="style6" width="60%" 
                style="border: 1px solid #D8D8D8; padding: 20px; ">
                <strong class="style19">Mission !</strong><br />
                &nbsp;<br />
                To delight and nourish our customers with quality and satisfied items and excellent service at a reasonable price and provide quality across the world and help our community by donating 10% of our profit each year.
             </td>
        </tr>
         <tr>
            <td colspan="2" class="style18">
                <br />
            </td>
        </tr>
        </table>

         <table class="style1">
        <tr>
            <td align="justify" class="style6" width="60%" 
                style="border: 1px solid #D8D8D8; padding: 20px; ">
                <strong class="style19">Vision !</strong><br />
                &nbsp;<br />
                To serve happiness to our customers through quality items and extraordinary home&nbsp; deliver 'auto 
                flourish' to every nation and every city in the world by 2030.
             </td>
            <td class="style9 about-img">
                     <asp:Image ID="Image4" runat="server" ImageUrl="~/img/icons/thumb-up.png"  
                         Width="36%" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style22"></td>
        </tr>
        <tr>
            <td colspan="2" 
                
                
                style="border-bottom-style: solid; border-bottom-width: 5px; border-bottom-color: #DADADA"></td>
        </tr>
        <tr>
           <td align="justify" class="style15" colspan="2">
                <table class="style1" style="margin-top: 40px; margin-bottom: 30px;" 
                    width="100%">
                    <tr style="display: flex;">
                        <td width="20%" class="about-img">
                            <asp:Image  ID="Image5" runat="server" ImageUrl="~/img/icons/advertising.png" Width="20%" />
                        </td>
                        <td width="20%" class="about-img">
                            <asp:Image  ID="Image6" runat="server" ImageUrl="~/img/icons/instagram.png" Width="20%" />
                        </td>
                        <td width="20%" class="about-img">
                            <asp:Image  ID="Image7" runat="server" ImageUrl="~/img/icons/twitter.png" Width="20%" />
                        </td>
                        <td width="20%" class="about-img">
                            <asp:Image  ID="Image8" runat="server" ImageUrl="~/img/icons/whatsapp.png" Width="20%" />
                        </td>
                        <td width="20%" class="about-img">
                            <asp:Image  ID="Image9" runat="server" ImageUrl="~/img/icons/facebook.png" Width="20%" />
                        </td>
                    </tr>
                </table>
             </td>
        </tr>
      </table>

</asp:Content>

