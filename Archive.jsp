<%@page import="com.modelclasses.CallNosBean"%>
<%@page import="com.modelclasses.CallTypesBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.*"%>
<%@page import="com.modelclasses.CallmonitorBean"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ticket Management Tool-All Solved Tickets </title>

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
  <link rel="stylesheet" href="css/other.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<%@page import="com.modelclasses.Userdetails"%>
<%
 CallNosBean cnb=(CallNosBean)request.getAttribute("calls");

//CallTypesBean ctb=(CallTypesBean)request.getAttribute("calls");
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

/*
String option=null;

if(((String)request.getAttribute("user")) != null){
        option = (String)request.getAttribute("user");
        System.out.println("inside superpaneljsp "+ option);
                        }
else{
        option = "ALL";
        option = (String)request.getAttribute("user");
        System.out.println("inside superpaneljsp else"+ option);
}
*/
//response.setIntHeader("Refresh", 5);
%>
<script>
window.history.forward();

function test(){

    var month=document.getElementById("sel").value;
    var year=document.getElementById("sel2").value;

    document.location.href="ArchiveServlet?month="+month+"&year"+year;
}


</script>

<body  class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="Navbar.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper " style="background-image: url('images/bg-01.jpg'); background-size: cover; position: relative; z-index: 1; background-repeat: no-repeat; justify-content: center; padding: 15px; background-position: center; background-blend-mode: soft-light; background-color: rgba(255,255,255,0.9); top: 0; left: 0; " >
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 style="font-weight: bold;">All Solved Tickets</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">

<!--datatable-->

          <div class="col-12">
              <div class="card">
              <div class="card-header">
                                         <b>   showing data for month of
                 <select id="sel" name="select"  >
                 <option  value="">Select month</option>
                 <option value="1">January</option>
                 <option value="2">February</option>
                 <option value="3">March</option>
                 <option value="4">April</option>
                 <option value="5">May</option>
                 <option value="6">June</option>
                 <option value="7">July</option>
                 <option value="8">August</option>
                 <option value="9">September</option>
                 <option value="10">October</option>
                 <option value="11">November</option>
                 <option value="12">December</option>
                 <option value="ALL">ALL</option>


                        </select>
                        <select id="sel2" name="select" onchange="test()" >
                 <option  value="">Select year</option>
                 <option value="2020">2020</option>
                 <option value="2021">2021</option>
                 <option value="2022">2022</option>
                 <option value="2023">2023</option>
                 <option value="2024">2024</option>
                 <option value="2025">2025</option>
                 <option value="2026">2026</option>
                 <option value="2027">2027</option>
                 <option value="2028">2028</option>
                 <option value="2029">2029</option>
                 <option value="2030">2030</option>
                 <option value="ALL">ALL</option>


                        </select>
        </b>
              </div>

              <!-- /.card-header -->
              <%        Date date = new Date();
                                   %>
              <div class="card-body" id="heading1">
                          <form name="inbox" method="get" action="ViewData"  onsubmit="javascript:return Validate();">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>

                              <tr hidden> <th hidden><p id="gendate">   Generated On:<%= date.toString() %></p></th>
                                <th hidden>     <p id="reportfor">Report For:EIS INFRA Team </p></th>
                             </tr>

                  <tr style="background-color: #1a487775">
                    <th>T No</th>
                    <th>T Type</th>
                    <th>Subject</th>
                    <th> Logged By</th>
                    <th>Solved By</th>
                    <th>Solved By Role</th>
                    <th>Ticked Logged Time </th>
                    <th hidden>Problem </th>
                    <th hidden>Solution </th>
                        <th>Severity</th>
                     <th>Total Duration </th>
                  </tr>
                  </thead>

                  <tbody>

                                   <%
    ArrayList<CallmonitorBean> al = (ArrayList<CallmonitorBean>) request.getAttribute("data");
    Iterator itr=al.iterator();

                while(itr.hasNext()){
                       // CallmonitorBean cb = new CallmonitorBean();
                       CallmonitorBean cb = (CallmonitorBean) request.getAttribute("cb1");
                        cb=(CallmonitorBean)itr.next();

                                %>
                  <tr>

                    <td><a href="ViewData?user=<%=cb.getCallid()%>" ><%=cb.getCallid()%></a></td>
                    <td><%=cb.getCalltype()%></td>
                                        <td><%=cb.getSubject()%> </td>
                    <td><%=cb.getEmpname()%></td>
                    <td><%=cb.getSolvedby()%></td>
                    <td><%=cb.getSolvedbyrole()%></td>
                    <td><%=cb.getLoggeddate() %> </td>
                    <td hidden><%=cb.getProblem() %> </td>
                    <td hidden><%=cb.getSoln() %> </td>

                    <td><%=cb.getSeverity()%></td>
                    <td><%=cb.getPendingsince()%></td>
                  </tr>

               <%
                }
    %>

                  </tbody>
                   </table>
                                  </form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  </div>
  </div><!-- /.wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="plugins/jszip/jszip.min.js"></script>
<script src="plugins/pdfmake/pdfmake.min.js"></script>
<script src="plugins/pdfmake/vfs_fonts.js"></script>
<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script>
  $(function () {
          var msg = document.getElementById("gendate").innerHTML +"                         "+ document.getElementById("reportfor").innerHTML;

    $("#example1").DataTable({
      "order": [[ 0 , "desc" ]],
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": [ "csv",{ extend:"excel", "messageTop": msg },  "print"],
      "columnDefs":[{targets:[7]}]


    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": false,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>
