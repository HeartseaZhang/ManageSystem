<meta charset = "utf-8">
<%@page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>
            Good Data Viewing System
        </title>
    </head>
    <body>
        <style type="text/css">
            ul{
                list-style: none;
            }
            #list{
                position: absolute;
                top:25%;
                left: 5%;
            }
            #manege{
                position: absolute;
                top: 5%;
                right: 15%;
            }
            .iframe1{
                position: absolute;
                top: 15%;
                left: 20%;
                width: 80%;
                height: 80%;
            }
            #time{
                position: absolute;
                top:0%;
                left: 0%;
            }
        </style>
        <script type = "text/javascript">
            display=function(){
                document.getElementById("time").innerHTML=(new Date()).toLocaleString();
            }
            window.onload=function(){
                document.getElementById("time").innerHTML=(new Date()).toLocaleString();
                window.setInterval("display()",1000);
            }
        </script>
        <font size="5">
            <br>    
            <center>Good Data Viewing System</center>
        </font>
        <div id = "manege">
            <a href="/test/check" id = "small">View and Modify Information</a>&nbsp;&nbsp;
            <a href="login.jsp">Exit System</a>
        </div>
        <div id = "time">
        </div>
        <div id = "list">
            <ul>
                <li>
                    <a href="/test/good" target="good">Good Data</a><br><br>
                </li>
                <li>
                    <a href="/test/record" target ="good">Historic Records</a><br><br>
                </li>

            </ul>
        </div>
        <iframe src="Default.jsp"  name="good" frameborder="0" class = "iframe1"></iframe>
    </body>
</html>