<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<%List<Item> items = (List<Item>) request.getAttribute("item");%>
<%for (Item item : items) {%>
<figure>
    <img src="/item/image?profilePic=<%=item.getUser()%>" width="200px">
    <figcaption>
        <div>title:<%=item.getTitle()%>
        </div>
        <div>category:<%=item.getCategory().getName()%>
        </div>
        <div>price:<%=item.getPrice()%>
        </div>
        <div>owner:<%=item.getUser().getName() + " " + item.getUser().getSurname()%>
        </div>
        <a href="/item/remove?itemId=<%=item.getId()%>">remove item</a>
        <%}%>
    </figcaption>
</figure>
</body>
</html>
