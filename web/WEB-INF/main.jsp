<%@ page import="java.util.List" %>
<%@ page import="model.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Գլխավոր էջ</title>
</head>
<body>
<% List<Item> itemList = (List<Item>) request.getAttribute("item");%>
<%for (Item item : itemList) {%>
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
    </figcaption>
</figure>
<%}%>
</body>
</html>
