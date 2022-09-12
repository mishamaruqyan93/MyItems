<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User item</title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    User user = (User) request.getSession().getAttribute("user");
%>
<% if (msg != null) { %>
<p style="color: red"><%=msg%>
</p>
<% } else {%>
<th>Բարեվ <%=user.getName()%>
</th>
<%}%>
<a href="/user/add/item">Ավելացնել </a>|
<a href="/user/items">Իմ Հայտարարություններ</a>|
<a href="/logout">Logout</a>
</body>
</html>
