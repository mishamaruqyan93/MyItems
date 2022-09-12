package servlet;

import manager.ItemManager;
import model.Item;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/user/items")
public class UserItemServlet extends HttpServlet {
    private static final ItemManager ITEM_MANAGER = new ItemManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Item> itemList = ITEM_MANAGER.getItemByUserId(user.getId());
        req.setAttribute("item", itemList);
        req.getRequestDispatcher("/WEB-INF/userItems.jsp").forward(req, resp);
    }
}
