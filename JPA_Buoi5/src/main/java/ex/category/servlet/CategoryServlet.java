package ex.category.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import ex.category.dao.CategoryDAO;
import ex.category.entity.Category;

@WebServlet("/category/*")
public class CategoryServlet extends HttpServlet {
    private CategoryDAO dao = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();

        if (path == null || "/".equals(path)) {
            // Hiển thị danh sách
            List<Category> list = dao.findAll();
            req.setAttribute("categories", list);
            req.getRequestDispatcher("/category-list.jsp").forward(req, resp);

        } else if (path.startsWith("/edit")) {
            // URL dạng /category/edit/1
            try {
                String[] parts = path.split("/");
                if (parts.length >= 3) {
                    int id = Integer.parseInt(parts[2]);
                    Category cate = dao.findById(id);
                    if (cate != null) {
                        req.setAttribute("cate", cate);
                        req.getRequestDispatcher("/category-form.jsp").forward(req, resp);
                        return;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect(req.getContextPath() + "/category");

        } else if (path.equals("/create")) {
            // Mở form thêm mới
            req.getRequestDispatcher("/category-form.jsp").forward(req, resp);

        } else {
            // Nếu không khớp route nào -> về list
            resp.sendRedirect(req.getContextPath() + "/category");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        String name = req.getParameter("catename");
        String icon = req.getParameter("icon");

        try {
            if ("/create".equals(path)) {
                Category cate = new Category();
                cate.setCatename(name);
                cate.setIcon(icon);
                dao.create(cate);

            } else if ("/update".equals(path)) {
                int id = Integer.parseInt(req.getParameter("cateid"));
                Category cate = dao.findById(id);
                if (cate != null) {
                    cate.setCatename(name);
                    cate.setIcon(icon);
                    dao.update(cate);
                }

            } else if ("/delete".equals(path)) {
                int id = Integer.parseInt(req.getParameter("cateid"));
                dao.remove(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Quay về danh sách
        resp.sendRedirect(req.getContextPath() + "/category");
    }
}
