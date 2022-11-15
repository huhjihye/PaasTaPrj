<%@ page import="kopo.poly.dto.NlpDTO" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-03
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<NlpDTO> nlpDTOList = (List<NlpDTO>) request.getAttribute("nlpDTOList");%>
<html>
<head>
    <title>워드 클라우드 </title>

    <%--    <link rel="stylesheet" type="text/css" href="/jqcloud/jqcloud.css" />--%>
    <link rel="stylesheet" type="text/css" href="/assets/jqcloud/jqcloud.css"/>
    <script src="/assets/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/assets/jqcloud/jqcloud.js"></script>
    <script type="text/javascript">

        let words = [
            <% for(int i =0; i<30; i++){%>
            {text: '<%=nlpDTOList.get(i).getWord()%>', weight:<%=30 - i%>},
            <%}%>

        ];

        console.log(words);

        $(function () {
            $("#go").jQCloud(words);
        });
    </script>
</head>
<body>
<h1>워드 클라우드 </h1>
<div id="go" style="width: 550px; height: 350px;"></div>
</body>
</html>
