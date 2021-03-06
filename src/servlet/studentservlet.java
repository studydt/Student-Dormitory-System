package servlet;

import javabean.JDBC;
import javabean.userhome;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "student",urlPatterns = "/production/student")
public class studentservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(true);
        userhome userhome1 =new userhome();
        userhome1.setNumber(req.getParameter("number"));
        userhome1.setAdminhome(req.getParameter("adminhome"));
        userhome1.setThing(Integer.parseInt(req.getParameter("thing")));
        try {
            JDBC jdbc =new JDBC();
            int i = jdbc.insertuserhome(userhome1);
            if (i ==0){
                session.setAttribute("success",6);
            }else {
                session.setAttribute("success",7);
            }
            resp.sendRedirect("student.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
