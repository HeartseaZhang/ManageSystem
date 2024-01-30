<%@ page import="java.util.List" %>
<%@ page import="com.manage.hRecord" %>
<meta charset = "utf-8">
<%@page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title></title>
</head>
<body>
<style type="text/css">
    #table{
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
    }
</style>
<script type="text/javascript" src = "js/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src = "js/bootstrap.min.js">
</script>
<script type="text/javascript" src = "js/bootstrap-table.min.js">
</script>
<link rel = "stylesheet" href="css/bootstrap.min.css"/>
<link rel = "stylesheet" href="css/bootstrap-table.min.css"/>
<script type="text/javascript">
    $(document).ready(function (){
        $("#table").bootstrapTable({
            columns:[{
                field:'Time',
                title:'Time'
            },{
                field:'hostIP',
                title:'hostIP'
            },{
                field:'datavolume',
                title:'datavolume'
            },{
                field:'accept status',
                title:'accept status'
            },{
                field:'write status',
                title:'write status'
            },]
        })
    })
</script>
<table border = "1px" width = "50%" aligh="center" id="table"
       data-search="true"
       data-pagination = "true"
       data-side-pagination="client"
       data-page-size ="10">

    <tbody id = "transRecord" align="center">
    <%
        List<hRecord> list = (List<hRecord>)request.getAttribute("r");
        for(hRecord h :list){
    %>
    <tr <%
    if(" failure".equals(h.getWrite())||" failure".equals(h.getReceive())){
%>
            class="alert-danger"
            <%
    }
            %>
    >
        <td><%=h.getTime()%></td>
        <td><%=h.getIp()%></td>
        <td><%=h.getData()%></td>
        <td><%=h.getReceive()%></td>
        <td><%=h.getWrite()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>


