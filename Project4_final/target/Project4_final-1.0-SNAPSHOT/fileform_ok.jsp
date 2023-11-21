
<%@ page import ="com.myapp.common.*, java.io.File" %>
<%@ page import ="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
%>
<%--
  Created by IntelliJ IDEA.
  User: skskl
  Date: 2023-11-17
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;

    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multpartRequest = null;
    multpartRequest = new MultipartRequest(request, realPath,
            sizeLimit, "utf-8",new DefaultFileRenamePolicy());
    filename = multpartRequest.getFilesystemName("img1");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
fileform_ok.jsp
파일 명 : <%= filename%> <br/>
<img src = "${pageContext.request.contextPath}/upload/<%= filename%>" />
</body>
</html>
