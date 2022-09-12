<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body><%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");
    List<Category> categories = (List<Category>) request.getAttribute("category");

%>
<form action="/user/add/item" method="post" enctype="multipart/form-data">
    <input type="hidden" name="userId"<%=user.getId()%> >
    <input type="text" name="title" placeholder="Please input title"/> <br>
    <input type="number" name="price" placeholder="Please input price"/> <br>
    <select name="categoryId">
        <% for (Category category : categories) {%>
        <option value="<%=category.getId()%>"><%=category.getName()%>"</option>
        <%} %>
    </select>
    <input type="file" name="profile_pic"/><br>
    <input type="submit" value="Ok">
</form>
</body>
</html>