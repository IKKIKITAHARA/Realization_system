package controllers.like;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Like;
import models.Realization;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class LikeDestroyServlet
 */
@WebServlet("/likes/destroy")
public class LikeDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User) request.getSession().getAttribute("login_user");

        Realization realization_id = em.find(Realization.class, Integer.parseInt(request.getParameter("realization_id")));

        List<Like> myLike = em.createNamedQuery("getLikeDatas", Like.class)
                            .setParameter("likedUser", login_user)
                            .setParameter("likedRealization", realization_id)
                            .getResultList();

        em.getTransaction().begin();
        em.remove(myLike.get(0));
        em.getTransaction().commit();

        em.close();

        response.sendRedirect(request.getContextPath() + "/realizations/show?id=" + Integer.parseInt(request.getParameter("realization_id")));

    }

}
