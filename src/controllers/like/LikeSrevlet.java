package controllers.like;

import java.io.IOException;

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
 * Servlet implementation class LikeSrevlet
 */
@WebServlet("/realizations/like")
public class LikeSrevlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeSrevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = DBUtil.createEntityManager();

        Like l = new Like();

        l.setLikedUser((User) request.getSession().getAttribute("login_user"));
        l.setLikedRealization((Realization) em.find(Realization.class, Integer.parseInt(request.getParameter("likeaction"))));

        Realization r = em.find(Realization.class, Integer.parseInt(request.getParameter("likeaction")));

        em.getTransaction().begin();
        em.persist(l);
        em.getTransaction().commit();
        em.close();

        response.sendRedirect(request.getContextPath() + "/realizations/show?id=" + r.getId());
    }
}