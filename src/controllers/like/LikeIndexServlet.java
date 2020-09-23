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
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class LikeIndexServlet
 */
@WebServlet("/likes/index")
public class LikeIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User) request.getSession().getAttribute("login_user");

        List<Like> myLikes = em.createNamedQuery("getMyAllLikes", Like.class)
                               .setParameter("likedUser", login_user)
                               .getResultList();

        em.close();

        request.setAttribute("myLikes", myLikes);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/likes/index.jsp");
        rd.forward(request, response);
    }
}
