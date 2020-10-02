package controllers.realization;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class RealizationShowServlet
 */
@WebServlet("/realizations/show")
public class RealizationsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealizationsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Realization r = em.find(Realization.class, Integer.parseInt(request.getParameter("id")));

        request.setAttribute("realization", r);
        request.setAttribute("_token", request.getSession().getId());

        User login_user = (User) request.getSession().getAttribute("login_user");

        List<Like> myLike = em.createNamedQuery("getLikeDatas", Like.class)
                            .setParameter("likedUser", login_user)
                            .setParameter("likedRealization", r)
                            .getResultList();

        long likes_count = (long)em.createNamedQuery("getLikesCount", Long.class)
                           .setParameter("likedRealization",r)
                           .getSingleResult();


        em.close();

        request.setAttribute("myLike", myLike);
        request.setAttribute("likes_count", likes_count);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/realizations/show.jsp");
        rd.forward(request, response);

    }

}
