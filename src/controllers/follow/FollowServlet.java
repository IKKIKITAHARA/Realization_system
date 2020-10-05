package controllers.follow;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class FollowServlet
 */
@WebServlet("/follows")
public class FollowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = DBUtil.createEntityManager();

        Follow f = new Follow();

        f.setFollower((User)request.getSession().getAttribute("login_user"));
        f.setFollowed((User)em.find(User.class ,Integer.parseInt(request.getParameter("followed_id"))));

        User u = em.find(User.class ,Integer.parseInt(request.getParameter("followed_id")));

        em.getTransaction().begin();
        em.persist(f);
        em.getTransaction().commit();
        em.close();

        response.sendRedirect(request.getContextPath() + "/profiles/show?id=" + u.getId());

    }
}
