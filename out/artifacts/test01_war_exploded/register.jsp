<%@ page import="com.manage.smail" %>
<%@ page import="static com.manage.smail.*" %>
<meta charset = "utf-8">
<%@page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Register</title>
    </head>
    <body>
        <style type = "text/css">
            div{
                 position: absolute;
                 left: 30%;
                 top:20%;
                 width: 50%;
                 height: 50%;
            }
        </style>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <%
            String random = smail.ran();

        %>
        <script type = "text/javascript">
            window.onload = function(){
                document.getElementById("username").onblur=function(){
                    var xhr = new XMLHttpRequest()
                    xhr.onreadystatechange = function (){
                        if(this.readyState==4){
                            if(this.status==200){
                                document.getElementById("checkuname").innerHTML=this.responseText
                            }
                            else{
                                alert(this.status)
                            }
                        }
                    }
                    xhr.open("POST","/test/ajax/username",true)
                    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
                    var username=document.getElementById("username").value;
                    xhr.send("username="+username)
                }
                document.getElementById("username").onfocus=function () {
                    document.getElementById("checkuname").innerText="";
                }
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
                document.getElementById("password2").onblur=function () {
                    if (document.getElementById("password").value == document.getElementById("password2").value) {

                    }else{
                        document.getElementById("checkpassword2").innerHTML="<font color='red'>两次输入的密码不一致</font>"
                    }
                }
                document.getElementById("name").onfocus=function () {
                    document.getElementById("checkname").innerText="";
                }
                document.getElementById("name").onblur=function () {
                    if(this.value==""){
                        document.getElementById("checkname").innerHTML="<font color='red'>姓名不能为空</font>";
                    }
                }
                document.getElementById("password2").onfocus=function () {
                    document.getElementById("checkpassword2").innerText="";
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
             <%--   document.getElementById("semail").onclick=function (){
                    document.getElementById("semail").value="发送成功，请30秒后再试";
                    document.getElementById("semail").disabled=true;
                    if(document.getElementById("semail").disabled==true){
                        setTimeout(function () {
                            document.getElementById("semail").disabled=false;
                            document.getElementById("semail").value="发送验证码";
                        },3000)
                    }
                }--%>
            }
            function checkSubmit(){
                document.getElementById("password").focus();
                document.getElementById("password").blur();
                document.getElementById("password2").focus();
                document.getElementById("password2").blur();
                document.getElementById("name").focus();
                document.getElementById("name").blur();
               if((document.getElementById("checkpassword").innerText=="")&&
                        (document.getElementById("checkpassword2").innerText=="")&&
                            (document.getElementById("checkname").innerText=="")&&
                            (document.getElementById("checkuname").innerText=="")){
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
                    alert("Your input is incorrect, please check")
                    return false;
                }
            }
        </script>
        <form action = "/test/register" method="post" onsubmit="return checkSubmit();">
            <div>
                <table border = "0px"  width = 100% height = 100% >
                    <tr align="center">
                        <td align="center" width="30%">
                            Username：
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
                            Password：
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
                            Confirm Password：
                        </td>
                        <td align="center" width="30%">
                            <input type = "password" id="password2">
                        </td>
                        <td  align="left" width="40%">
                            <span id = "checkpassword2"></span>
                        </td>
                    </tr>
                    <tr align="center">
                        <td align="center" width="30%">
                            eMail：
                        </td>
                        <td align="center" width="30%">
                            <input type = "text" name = "email" id = "email">
                        </td>
                        <td align="left" width="40%">
                            <input type = "button" value = "Send verification code" id = "semail">
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
                            Name：
                        </td>
                        <td align="center" width="30%">
                            <input type = "text" name = "name" id = "name">
                        </td>
                        <td  align="left" width="40%">
                            <span id = "checkname"></span>
                        </td>
                    </tr>
                    <tr align="center">
                        <td align="center" width="30%">
                            <input type = "submit" value = "Register" >
                        </td>
                        <td align="center" width="30%">
                            <input type = "reset" value = "Reset">
                        </td>
                        <td  width="40%">

                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>