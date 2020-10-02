package controllers.like;

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
import utils.DBUtil;

/**
 * Servlet implementation class LikeShowServlet
 */
@WebServlet("/likes/show")
public class LikeShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Realization r = em.find(Realization.class, Integer.parseInt(request.getParameter("id")));


        List<Like>likedUsers = em.createNamedQuery("getLikedUsers", Like.class)
                              .setParameter("likedRealization", r)
                              .getResultList();

        request.setAttribute("realization", r);
        request.setAttribute("likedUsers", likedUsers);


        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/likes/show.jsp");
        rd.forward(request, response);

        //response.sendRedirect(request.getContextPath() + "/realizations/show?id=" + Integer.parseInt(request.getParameter("realization_id")));
    }

}
