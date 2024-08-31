<%@ Page Language="VB" AutoEventWireup="false" CodeFile="modal.aspx.vb" Inherits="user_modal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script  src="js/bootstrap.min.js">
</script>
<script>
    $(document).ready(function () {
        $("#staticBackdrop").modal('show');
    });
</script>
    <style type="text/css">
        
        
        body
        {   
        	background: url(car.jpg);
            background-repeat: no-repeat;
            background-size: cover;
        	}
        	
        .style1 {
            width: 100%;
        }
        
        .btn-sub{
            border: none;
            outline: none;
            height: 35px;
            width: 240px;
            background: #ef5b01;
            color: #000;
            font-size: 15px;
            border-radius: 5px;
        }

        .btn-sub:hover {
            cursor: pointer;
            background: #ef5b01;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            
            <tr>
                <td>
                   <!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  Launch static backdrop modal
</button>--%>

<!-- Modal -->

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Forgot Password</h5>
            <a href="userlogin.aspx"><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></a>
      </div>
      <div class="modal-body">
            <div class="form-floating mb-3">
                <asp:TextBox class="form-control" ID="floatingInput" runat="server" placeholder="name@example.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="floatingInput" 
                    ErrorMessage="Email cannot be blank !" ForeColor="Orange" Font-Size="13px"  SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <label for="floatingInput">Enter Email address</label>
            </div>
            
            <div class="form-floating mb-3">
                <asp:TextBox class="form-control" ID="username" runat="server" placeholder="enter name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" 
                    ErrorMessage="Name cannot be blank !" ForeColor="Orange" Font-Size="13px"  SetFocusOnError="True">*</asp:RequiredFieldValidator>
                 <label  for="username">Enter Username</label>
                
            </div>
            
            <div class="form-floating mb-3">
                <asp:TextBox class="form-control" ID="showpass" runat="server" placeholder="name@example.com" ReadOnly="True"></asp:TextBox>
               
                <label for="showpass">Your Password </label>
                 <asp:Label ID="Label1" runat="server" Visible="True"></asp:Label>
            </div>
            
           
      </div>
          <div class="modal-footer">
            
              <asp:LinkButton ID="btndiscard" runat="server"  href="userlogin.aspx" class="btn btn-secondary" >Discard</asp:LinkButton>
           
              <asp:LinkButton ID="btnsubmit" type="submit"   runat="server" class="btn btn-sub">Submit</asp:LinkButton>
              <asp:HyperLink ID="HyperLink1" runat="server" href="userlogin.aspx" Visible="false">Go to login!!</asp:HyperLink> 
                    
    </div>
  </div>
</div>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
