<%@ page import="java.util.List" %>
<%@ page import="com.manage.hRecord" %>
<%@ page import="com.manage.good" %>
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
        width: 40%;
        height: 80%;
    }
    .top {
        position: absolute;
        top: 2%;
        left: 73%;
    }
    .top2{
        position: absolute;
        top: 2%;
        left: 0%;
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
<%
    //System.out.println(request.getParameter("kind"));
%>
<script type="text/javascript">

    function checkSubmit() {
     if(($("#day1").val()*86400+$("#hour1").val()*3600+$("#min1").val()*60)>=($("#day2").val()*86400+$("#hour2").val()*3600+$("#min2").val()*60))
         {
        alert("The date you entered is incorrect, please re-enter");
        return false;
    }
    }
    $(document).ready(function (){
        <%
        if(request.getParameter("kind")!=null){
        %>
        $("#kind").val('<%=request.getParameter("kind")%>')
        <%
        }
        %>
        <%if(request.getParameter("position")!=null){%>
        $("#position").val('<%=request.getParameter("position")%>')
        <%}%>
        <%if(request.getParameter("hour1")!=null){%>
        $("#hour1").val('<%=request.getParameter("hour1")%>')
        <%}%>
        <%if(request.getParameter("hour2")!=null){%>
        $("#hour2").val('<%=request.getParameter("hour2")%>')
        <%}%>
        <%if(request.getParameter("day2")!=null){%>
        $("#day2").val('<%=request.getParameter("day2")%>')
        <%}%>
        <%if(request.getParameter("day1")!=null){%>
        $("#day1").val('<%=request.getParameter("day1")%>')
        <%}%>
        <%if(request.getParameter("min1")!=null){%>
        $("#min1").val('<%=request.getParameter("min1")%>')
        <%}%>
        <%if(request.getParameter("min2")!=null){%>
        $("#min2").val('<%=request.getParameter("min2")%>')
        <%}%>
        $("#table").bootstrapTable({
            columns:[{
                field:'GoodID',
                title:'GoodID'
            },{
                field:'Type',
                title:'Type'
            },{
                field:'Good Name',
                title:'Good Name'
            },{
                field:'Good position',
                title:'Good position'
            },{
                field:'Warehousing time',
                title:'Warehousing time'
            },{
                field:'Delivery time',
                title:'Delivery time'
            },{
                field:'Good Status',
                title:'Good Status'
            },{
                field:'Color of goods',
                title:'Color of goods'
            },{
                field:'Good humidity',
                title:'Good humidity'
            },{
                field:'',
                title:''
            },
            ]
        })
    })
    function deliver(){
        var xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function (){
            if(this.readyState==4){
                if(this.status==200){
                }
                else{
                    alert(this.status)
                }
            }
        }
        xhr.open("POST","/test/ajax/deliver",true)
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
        var goodID1="goodID"+event.target.id;
        var goodID=document.getElementById(goodID1).innerText;
        xhr.send("goodID="+goodID);
        alert("Delivery succeeded!");
        location.reload();

    }
</script>
<%--<input id="sum" type="button" value="统计总和" onclick="alert('共'+$('table').bootstrapTable('getOptions').totalRows+'条记录')"/>--%>
<%--<form action=""><section name="hour1">
    </section>
   <section name="min1">
    </section>
    -
    <section name="hour2">
    </section>
    <section name="min2">
    </section><input type="submit" value="查询">
</form>--%>
<div class = "top"><input id="sum" type="button" value="sum" onclick="alert($('table').bootstrapTable('getOptions').totalRows+' records in total')"/>
</div>
<div class = "top2" >
    <form action="/test/time" onsubmit="return checkSubmit();">
        Type:<select name = "kind" id = "kind">
        <option value = "0">--</option>
        <option value = "yellow">yellow</option>
        <option value = "green">green</option>
        <option value = "blue">blue</option>
        <option value = "red">red</option>

    </select>
        position:
        <select name = "position" id = "position">
            <option value = "0">--</option>
            <option value = "A">A</option>
            <option value = "B">B</option>
            <option value = "C">C</option>
            <option value = "D">D</option>
            <option value = "E">E</option>
            <option value = "F">F</option>
            <option value = "G">G</option>
        </select>
        Time:
        <select name = "month" id = "month">
            <option>--</option>
            <option>Jan</option>
            <option>Feb</option>
            <option>Mar</option>
            <option>Apr</option>
            <option>May</option>
            <option>Jun</option>
            <option>Jul</option>
            <option>Aug</option>
            <option>Sept</option>
            <option>Oct</option>
            <option>Nov</option>
            <option>Dec</option>
        </select>
        <select name="day1" id = "day1">
            <option value = "01">1st</option>
            <option value = "02">2ed</option>
            <option value = "03">3rd</option>
            <option value = "04">4th</option>
            <option value = "05">5th</option>
            <option value = "06">6th</option>
            <option value = "07">7th</option>
            <option value = "08">8th</option>
            <option value = "09">9th</option>
            <option value = "10">10th</option>
            <option value = "11">11st</option>
            <option value = "12">12ed</option>
            <option value = "13">13rd</option>
            <option value = "14">14th</option>
            <option value = "15">15th</option>
            <option value = "16">16th</option>
            <option value = "17">17th</option>
            <option value = "18">18th</option>
            <option value = "19">19th</option>
            <option value = "20">20th</option>
            <option value = "21">21st</option>
            <option value = "22">22ed</option>
            <option value = "23">23rd</option>
            <option value = "24">24th</option>
            <option value = "25">25th</option>
            <option value = "26">26th</option>
            <option value = "27">27th</option>
            <option value = "28">28th</option>
            <option value = "29">29th</option>
            <option value = "30">30th</option>
            <option value = "31">31st</option>
        </select>
        <select name="hour1" id = "hour1">
            <option value = "00">0:</option>
            <option value = "01">1:</option>
            <option value = "02">2:</option>
            <option value = "03">3:</option>
            <option value = "04">4:</option>
            <option value = "05">5:</option>
            <option value = "06">6:</option>
            <option value = "07">7:</option>
            <option value = "08">8:</option>
            <option value = "09">9:</option>
            <option value = "10">10:</option>
            <option value = "11">11:</option>
            <option value = "12">12:</option>
            <option value = "13">13:</option>
            <option value = "14">14:</option>
            <option value = "15">15:</option>
            <option value = "16">16:</option>
            <option value = "17">17:</option>
            <option value = "18">18:</option>
            <option value = "19">19:</option>
            <option value = "20">20:</option>
            <option value = "21">21:</option>
            <option value = "22">22:</option>
            <option value = "23">23:</option>

        </select>
        <select name="min1" id = "min1">
            <option value = "00">00</option>
            <option value = "10">10</option>
            <option value = "20">20</option>
            <option value = "30">30</option>
            <option value = "40">40</option>
            <option value = "50">50</option>
            <option value = "59">59</option>
        </select>
        -
        <select name = "month" id = "month1">
            <option>--</option>
            <option>Jan</option>
            <option>Feb</option>
            <option>Mar</option>
            <option>Apr</option>
            <option>May</option>
            <option>Jun</option>
            <option>Jul</option>
            <option>Aug</option>
            <option>Sept</option>
            <option>Oct</option>
            <option>Nov</option>
            <option>Dec</option>
        </select>
        <select name="day2" id = "day2">
            <option value = "01">1st</option>
            <option value = "02">2ed</option>
            <option value = "03">3rd</option>
            <option value = "04">4th</option>
            <option value = "05">5th</option>
            <option value = "06">6th</option>
            <option value = "07">7th</option>
            <option value = "08">8th</option>
            <option value = "09">9th</option>
            <option value = "10">10th</option>
            <option value = "11">11st</option>
            <option value = "12">12ed</option>
            <option value = "13">13rd</option>
            <option value = "14">14th</option>
            <option value = "15">15th</option>
            <option value = "16">16th</option>
            <option value = "17">17th</option>
            <option value = "18">18th</option>
            <option value = "19">19th</option>
            <option value = "20">20th</option>
            <option value = "21">21st</option>
            <option value = "22">22ed</option>
            <option value = "23">23rd</option>
            <option value = "24">24th</option>
            <option value = "25">25th</option>
            <option value = "26">26th</option>
            <option value = "27">27th</option>
            <option value = "28">28th</option>
            <option value = "29">29th</option>
            <option value = "30">30th</option>
            <option value = "31" selected="selected">31st</option>
        </select>
        <select name="hour2" id = "hour2">
            <option value = "00">0:</option>
            <option value = "01">1:</option>
            <option value = "02">2:</option>
            <option value = "03">3:</option>
            <option value = "04">4:</option>
            <option value = "05">5:</option>
            <option value = "06">6:</option>
            <option value = "07">7:</option>
            <option value = "08">8:</option>
            <option value = "09">9:</option>
            <option value = "10">10:</option>
            <option value = "11">11:</option>
            <option value = "12">12:</option>
            <option value = "13">13:</option>
            <option value = "14">14:</option>
            <option value = "15">15:</option>
            <option value = "16">16:</option>
            <option value = "17">17:</option>
            <option value = "18">18:</option>
            <option value = "19">19:</option>
            <option value = "20">20:</option>
            <option value = "21">21:</option>
            <option value = "22">22:</option>
            <option value = "23" selected="selected">23:</option>
        </select>
        <select name="min2" id = "min2">
            <option value = "00">00</option>
            <option value = "10">10</option>
            <option value = "20">20</option>
            <option value = "30">30</option>
            <option value = "40">40</option>
            <option value = "50">50</option>
            <option value = "59" selected="selected">59</option>

        </select>&nbsp;&nbsp;&nbsp;<input type="submit" value="query">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" formaction="/test/charts" value = "Statistics" formtarget="_blank">
    </form>
</div>
<table border = "1px" width = "50%" aligh="center" id="table" id = "table" class = "table_class"

       data-search="true"
       data-pagination = "true"
    data-side-pagination="client"
    data-page-size ="8">
    <%--<tr>
        <th>货物ID</th>
        <th>货物类型</th>
        <th>货物名称</th>
        <th>货物位置</th>
        <th>入库时间</th>
    </tr>--%>
    <tbody id = "transRecord" align="center">
    <%
        List<good> list = (List<good>)request.getAttribute("r");
        int i = 0;
        for(good g :list){
            i++;
    %>
    <tr <%
        if("delivered".equals(g.getGoodStatus())){
    %>
            class="alert-warning"
            <%
                }
            %>
    >
        <td id = "goodID<%=i%>"><%=g.getGoodID()%></td>
        <td><%=g.getGoodKind()%></td>
        <td><%=g.getGoodName()%></td>
        <td><%=g.getPosition()%></td>
        <td><%=g.getIntime()%></td>
        <td><%=g.getOuttime()%></td>
        <td><%=g.getGoodStatus()%></td>
        <td><%=g.getGoodtemp()%></td>
        <td><%=g.getGoodhum()%></td>
        <td><input type="button" value="deliver" id = "<%=i%>" onclick="deliver()"></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>


