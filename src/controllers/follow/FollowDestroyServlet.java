package controllers.follow;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class FollowDestroyServlet
 */
@WebServlet("/follows/destroy")
public class FollowDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User) request.getSession().getAttribute("login_user");

        User followed_id = em.find(User.class, Integer.parseInt(request.getParameter("followed_id")));

        List<Follow> myFollow = em.createNamedQuery("getFollowedDatas", Follow.class)
                                .setParameter("follower", login_user)
                                .setParameter("followed", followed_id)
                                .getResultList();

        em.getTransaction().begin();
        em.remove(myFollow.get(0));
        em.getTransaction().commit();

        em.close();

        response.sendRedirect(request.getContextPath() + "/profiles/show?id=" + Integer.parseInt(request.getParameter("followed_id")));

    }

}