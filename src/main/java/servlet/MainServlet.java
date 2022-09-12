package servlet;

import lombok.SneakyThrows;
import manager.ItemManager;
import model.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/main")
public class MainServlet extends HttpServlet {
private static final ItemManager ITEM_MANAGER = new ItemManager();

    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Item> itemList;
        if (req.getParameter("cat_id")==null){
            itemList = ITEM_MANAGER.getAll();
        }else{
            itemList = ITEM_MANAGER.getCategory(Integer.parseInt(req.getParameter("cat_id")));
        }
        req.setAttribute("item",itemList);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
