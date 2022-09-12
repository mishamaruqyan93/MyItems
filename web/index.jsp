<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My.item.am</title>
</head>
<body>
<% List<Item> itemList = (List<Item>) request.getAttribute("item");%>

<a href="/login">Լոգին</a>|
<a href="/register">Գրանցում</a><br><br><br><br>

<a href="/main">Գլխավոր </a>|

<a href="/main?cat_id=1">Ավտոմեքենաներ</a>|

<a href="/main?cat_id=2">Տներ</a>|

<a href="/main?cat_id=3">Կոմերցիոն</a>|

<a href="/main?cat_id=4">Կահույք</a>|
<br>

<%if (itemList != null) {%>
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
<%
        }
    }
%>

</body>
</html>
