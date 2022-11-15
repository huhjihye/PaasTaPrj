<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-10-26
  Time: 오후 6:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 업로드 결과 </title>
</head>
<body>
<div class="result-images">

    <img src="${pageContext.request.contextPath }${url }" style="width:150px">

</div>

<p> <a href='/photo/upload'> 다시 업로드 하기 </a> /p>

</body>
</html>
