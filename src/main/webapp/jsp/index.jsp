<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"  %>
<html>
<body>
<h2>Hello World!</h2>
<table>
<tr>
    <td>账户</td>
    <td>密码</td>
    <td>姓名</td>
    <td>性别</td>
    <td>年龄</td>
</tr>

<c:forEach items="${patientList}" var = "patient">
<tr>
    <td>${patient.id }</td>
    <td>${patient.password }</td>
    <td>${patient.name}</td>
    <td>${patient.gender}</td>
    <td>${patient.age}</td>
    <td><a href="${pageContext.request.contextPath }/doctor/editDoctor.action?id=${doctor.id}">修改</a></td>
</tr>
</c:forEach> 
</table>
</body>
</html>
