<%@page import="com.modelclasses.CallNosBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "        ">
<%@page import="java.util.*"%>
<%@page import="com.modelclasses.CallmonitorBean"%>
<%@page import="java.util.*"%>
<html >
<head>

<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<meta name="robots" content="noodp,noydir" />

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>Call Monitor-Login</title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<style>
 #button:hover:not([disabled])
{
  background-color: #41b3a1d1;
  color: white;
  font-size: 90%;
}
</style>
</head>
  <%@page import="com.modelclasses.Userdetails"%>
<%
 CallNosBean cnb=(CallNosBean)request.getAttribute("calls");


        HttpSession session1 = request.getSession(false);
if(session1!=null)
{
        Userdetails ud =(Userdetails)session1.getAttribute("userDetails");
}
        else
        {
                response.sendRedirect("login.jsp");
        }
Userdetails ud =(Userdetails)session1.getAttribute("userDetails");

String option=null;
if(((String)request.getAttribute("user")) != null)
        option = (String)request.getAttribute("user");
else
        option = "ALL";


//response.setIntHeader("Refresh", 15);
%>



<script>

window.history.forward();

</script>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Main Sidebar Container -->
   <aside class="main-sidebar sidebar-dark-primary elevation-4" style="background: -webkit-linear-gradient(left, #279262, #0b788ae0);">
    <!-- Brand Logo -->

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
         <h3 style="color: seashell; white-space: break-spaces;"> Welcome <br><%=ud.getEmpname()%></h3>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul style="font-size: larger" class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Call Management
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="InboxServlet?" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Call Monitor</p>
                </a>
              </l>
              <li class="nav-item">
                <a href="OutboxServlet?" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Call History</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="callregistration.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Call Registration</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Call Search</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="ReassignInboxServlet?" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reassigned Calls</p>
                </a>
              </li>
            </ul>
          </li>


<!-- super user report-->
 <% if((ud.getSuperuser()).equals("YES")){
                                                        %>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Reports
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="CreateReport.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Call Summary</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="SuperInboxServlet?" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Super Panel</p>
                </a>
              </li>
            </ul>
          </li>
<%} %>
<!--checklist-->

                                <% if((ud.getRole()).equals("CDC")){
                                                        %>
          <li class="nav-item">
            <a href="ChecklistServlet4?" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Checklist
              </p>
            </a>
          </li>
<%} %>

<!--profile management-->

          <li class="nav-item ">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
               Profile Management
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="ForgotPassword.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Change Password</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="EditUserDetails.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Update Information</p>
                </a>
              </li>
            </ul>
          </li>
<!--Contacts-->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Contacts
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="https://cbportal.sbi.co.in:9443/contact1.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Contact</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="https://cbportal.sbi.co.in:9443/search1.php" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Search Contact</p>
                </a>
              </li>
            </ul>
          </li>
<!--logout-->
          <li class="nav-item">
            <a href="LogoutServlet?" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
              Logout
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
<div class="content-wrapper " style="background-image: url('images/bg-01.jpg'); background-size: cover; position: relative; z-index: 1; background-repeat: no-repeat; justify-content: center; padding: 15px; background-position: center; background-blend-mode: soft-light; background-color: rgba(255,255,255,0.9); top: 0; left: 0; " >
    <section class="content-header">

    </section>
<section class="content">
        <div class="container-fluid">
                <div class="row" style="height: 100px; justify-content: space-evenly;">
                         <div class="card" id="button" style="width: 40%; font-size: x-large; border: 3px solid #279262; padding: 10px;   text-align: center;">

                                <a href="InboxServlet?" accesskey="7" title="">Back To Inbox</a>
                                          </div>
                         <div class="card" id="button" style="width: 40%; font-size: x-large; border: 3px solid #279262; padding: 10px;   text-align: center;">

                                <a href="OutboxServlet?" accesskey="7" title="">Back To Outbox</a>
                                          </div>
                      </div><!-- /. row3-->

                </div><!-- /.col -->
        </div><!-- /.container-fluid -->
                </form>
</section>

</div><!-- /.container-wrapper -->




<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>

<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
t
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>

