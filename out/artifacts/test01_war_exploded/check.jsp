<%--
  Created by IntelliJ IDEA.
  User: Heartsea18
  Date: 2022/7/29
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View and Modify Information</title>
</head>
<body>
<script type="text/javascript">
    window.onload=function () {
        document.getElementById("changeemail").onclick=function () {
            if(document.getElementById("changeemail").value=="modify") {
                document.getElementById("email").focus();
                document.getElementById("email").disabled = false;
                document.getElementById("changeemail").value = "confirm";
            }else{
            var xhr = new XMLHttpRequest()
            xhr.onreadystatechange = function (){
                if(this.readyState==4){
                    if(this.status==200){
                        alert("Modification succeeded!")
                        document.getElementById("email").disabled=true;
                        document.getElementById("changeemail").value="modify";
                    }
                    else{
                        alert(this.status)
                    }
                }
            }
            xhr.open("POST","/test/ajax/changeemail",true)
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
            xhr.send("email="+document.getElementById("email").value)
        }
        }
        document.getElementById("changename").onclick=function () {
            if (document.getElementById("changename").value == "modify") {
                document.getElementById("name").focus();
                document.getElementById("name").disabled = false;
                document.getElementById("changename").value = "confirm";
            } else {
                var xhr = new XMLHttpRequest()
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        if (this.status == 200) {
                            alert("Modification succeeded!")
                            document.getElementById("name").disabled = true;
                            document.getElementById("changename").value = "modify";
                        } else {
                            alert(this.status)
                        }
                    }
                }
                xhr.open("POST", "/test/ajax/changename", true)
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
                xhr.send("name=" + document.getElementById("name").value)
            }
        }
    }
</script>
  <table>
    <tr>
        <td>
            WorkerID：
        </td>
        <td>
            <%=session.getAttribute("workerID")%>
        </td>
        <td>

        </td>
    </tr>
      <tr>
          <td>
            Username：
          </td>
          <td>
              <%=session.getAttribute("accountNumber")%>
          </td>
          <td>

          </td>
      </tr>
      <tr>
          <td>
            WorkerName：
          </td>
          <td>
              <input type="text" id = "name" value="<%=session.getAttribute("workerName")%>" disabled="true"/>
          </td>
          <td>
              <input type="button" value = "modify" id="changename"/>
          </td>
      </tr>
      <tr>
          <td>
              eMail：
          </td>
          <td>
              <input type="text" id = "email" value="<%=session.getAttribute("email")%>" disabled="true"/>
          </td>
          <td>
              <input type="button" value = "modify" id = "changeemail"/>
          </td>
      </tr>
      <tr>
          <td>
            <input type="button" value="Back" onclick="window.history.back()">
          </td>
          <td>

          </td>
          <td>

          </td>
      </tr>
  </table>
</body>
</html>
