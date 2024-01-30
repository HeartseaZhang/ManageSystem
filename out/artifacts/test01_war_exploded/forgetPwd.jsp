<%@ page import="com.manage.smail" %>
<%@page contentType="text/html;charset=UTF-8" %>
<meta charset = "utf-8">
<html>
    <head>
        <title></title>
    </head>
    <body>
    <%
        String random = smail.ran();

    %>
        <script type="text/javascript">
            window.onload=function () {
                document.getElementById("password").onblur=function () {
                    if (document.getElementById("password").value.length<6) {
                        document.getElementById("checkpassword").innerHTML="<font color='red'>您输入的密码太短了，请重新输入</font>"
                    }else if(document.getElementById("password").value.length>16){
                        document.getElementById("checkpassword").innerHTML="<font color='red'>您输入的密码太长了，请重新输入</font>"
                    }
                }
                document.getElementById("password").onfocus=function () {
                    document.getElementById("checkpassword").innerText="";
                }
                document.getElementById("semail").onclick=function (){
                    var email=document.getElementById("email").value;
                    var emailregexp=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                    if(emailregexp.test(email)){
                        var xhr = new XMLHttpRequest()
                        xhr.onreadystatechange = function (){
                            if(this.readyState==4){
                                if(this.status==200){
                                    document.getElementById("semail").value="Successfully sent, please try again in 30 seconds";
                                    document.getElementById("semail").disabled=true;
                                    setTimeout(function () {
                                        document.getElementById("semail").disabled=false;
                                        document.getElementById("semail").value="Send verification code";
                                    },30000)
                                }
                                else{
                                    alert(this.status)
                                }
                            }
                        }
                        xhr.open("POST","/test/sendEmail",true)
                        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
                        xhr.send("email="+email+"&random="+"<%=random%>")
                    }else{
                        alert("Email format error, please re-enter");
                    }

                }
                document.getElementById("username").onblur=function () {
                    var xhr = new XMLHttpRequest()
                    xhr.onreadystatechange = function (){
                        if(this.readyState==4){
                            if(this.status==200){
                                if(this.responseText!=null){
                                    document.getElementById("email").value=this.responseText;
                                    document.getElementById("semail").disabled=false;
                                }
                            }
                            else{
                                alert(this.status)
                            }
                        }
                    }
                    xhr.open("POST","/test/ajax/forget",true)
                    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
                    xhr.send("username="+document.getElementById("username").value)
                }
            }
            function checkSubmit(){
                document.getElementById("password").focus();
                document.getElementById("password").blur();
                if(document.getElementById("checkpassword").innerText==""){
                    if(document.getElementById("email").value==""){
                        alert("Email address is empty！")
                        return false;
                    }else{
                        if("<%=random%>"==document.getElementById("code").value){
                            alert("Modification succeeded！");
                        }else{
                            alert("Verification code error！");
                            return false;
                        }
                    }
                }else{
                    alert("Your input is incorrect , please check")
                    return false;
                }
            }
        </script>
    </body>
    <form action = "/test/forgetpwd" method="post" onsubmit="return checkSubmit();">
        <div>
            <table border = "0px"  position = "absolute" left=30% top=20% width = 70% height = 70% >
                <tr align="center">
                    <td align="center" width="30%">
                        Please enter the user name you want to retrieve：
                    </td>
                    <td align="center" width="30%">
                        <input type = "text" name = "username" id ="username">
                    </td>
                    <td  align="left" width="40%">
                        <span id = "checkuname"></span>
                    </td>
                </tr>
                <tr align="center">
                    <td align="center" width="30%">
                        Please enter the password you want to change：
                    </td>
                    <td align="center" width="30%">
                        <input type = "password" name = "password" id="password">
                    </td>
                    <td  align="left" width="40%">
                        <span id = "checkpassword"></span>
                    </td>
                </tr>
                <tr align="center">
                    <td align="center" width="30%">
                        eMail：
                    </td>
                    <td align="center" width="30%" >
                        <input type="text" name = "email" id = "email" readonly>
                    </td>
                    <td align="left" width="40%">
                        <input type = "button" value = "Send verification code" id = "semail" disabled=true >
                    </td>
                </tr>
                <tr align="center">
                    <td align="center" width="30%">
                        Verification Code：
                    </td>
                    <td align="center" width="30%">
                        <input type = "text" id = "code">
                    </td>
                    <td  width="40%">

                    </td>
                </tr>
                <tr align="center">
                    <td align="center" width="30%">

                    </td>
                    <td align="center" width="30%">
                        <input type = "submit" value = "Reset password">
                    </td>
                    <td  width="40%">

                    </td>
                </tr>
            </table>
        </div>
    </form>
</html>