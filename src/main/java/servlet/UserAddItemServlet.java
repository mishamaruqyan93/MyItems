package servlet;

import manager.CategoryManager;
import manager.ItemManager;
import model.Category;
import model.Item;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/user/add/item")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
public class UserAddItemServlet extends HttpServlet {

    private static final ItemManager ITEM_MANAGER = new ItemManager();
    private static final CategoryManager CATEGORY_MANAGER = new CategoryManager();
    private static final String IMAGE_PATH = "C:\\Users\\SmartS\\IdeaProjects\\MyItems\\itempictures\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categoryList = CATEGORY_MANAGER.getAll();
        req.setAttribute("category", categoryList);
        req.getRequestDispatcher("/WEB-INF/userAddItem.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        double price = Double.parseDouble(req.getParameter("price"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Category byId = CATEGORY_MANAGER.getById(categoryId);
        User user = (User) req.getSession().getAttribute("user");
        Part profilePicPart = req.getPart("profile_pic");
        String fileName = null;
        if (profilePicPart.getSubmittedFileName().length() != 0) {
            long nanoTime = System.nanoTime();
            fileName = nanoTime + "_" + profilePicPart.getSubmittedFileName();
            profilePicPart.write(IMAGE_PATH + fileName);
        }
        Item item = new Item();
        item.setTitle(title);
        item.setPrice(price);
        item.setUser(user);
        item.setPicUrl(fileName);
        item.setCategory(byId);
        ITEM_MANAGER.add(item);
        resp.sendRedirect("/user/items");
    }
}