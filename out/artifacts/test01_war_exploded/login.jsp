<%@page contentType="text/html;charset=UTF-8" %>
<meta charset = "utf-8">
<html>
    <head>
        <title>
            Good Data Viewing System
        </title>
        <style type ="text/css">
            #title{
                background-color: #7abaff;
                size:5px;
            }
        </style>
    </head>
    <body>
        <style type = "text/css">
            #login{
                text-align: center;
                position: absolute;
                margin: auto;
                width: 30%;
                height: 50%;
                left: 35%;
           
            }
        </style>
        <script type = "text/javascript">

            window.onload=function(){
                var flag = false
                if(flag==false){<%
          if(request.getAttribute("message")!=null){%>

              alert("<%=request.getAttribute("message")%>")
                <%
          }
          %>
                flag=true}
          }


        </script>
        <br><br>
        <font size="8">
            <center>Welcome to Good Data Viewing System
            </center>
        </font>
        <br><hr><br><br><br><br>
        <div id = "login">
            <form action = "/test/login" method="post" id="post">
                <table border = "0px"   width="100%" height = "40%">
                    <tr align="center">
                        <td>Username：
                        </td>
                        <td><input type = "text" name = "username" id = "username" <%
                            if(request.getParameter("username")!=null){%>
                        value="<%=request.getParameter("username")%>"<%
                            }
                                   %> />
                        </td>
                        
                    </tr>
                    <tr  align="center">
                        <td>Password：
                        </td>
                        <td><input type = "password" name = "password" id = "password" <%
                            if(request.getParameter("password")!=null){
                        %>value="<%=request.getParameter("password")%>"<%
                            }
                        %>/></td>
                        
                    </tr>
                    <tr align="center">
                        <td colspan="2"> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type = "submit" value = "login" id = "loginbtn"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type = "button" value = "register" id = "register"  onclick = "window.open('register.jsp' +
                             '','_self');"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href = "forgetPwd.jsp" target="_self">forgetPassword</a>
                        </td>
                    </tr>
               </table>
            </form>
        </div>
    </body>
</html>


