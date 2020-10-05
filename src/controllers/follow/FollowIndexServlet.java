package controllers.follow;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class FollowIndexServlet
 */
@WebServlet("/follows/index")
public class FollowIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page;
        try{
           page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e){
            page = 1;
        }
        User login_user = (User) request.getSession().getAttribute("login_user");

        List<Follow> myFollows = em.createNamedQuery("getMyAllFolloweds", Follow.class)
                            .setFirstResult(15 * (page - 1))
                            .setMaxResults(15)
                            .setParameter("follower", login_user)
                            .getResultList();

        long followed_count = (long)em.createNamedQuery("getAllFolloewedDatasCount", Long.class)
                                   .setParameter("follower", login_user)
                                   .getSingleResult();

        em.close();

        request.setAttribute("myFollows", myFollows);
        request.setAttribute("followed_count", followed_count);
        request.setAttribute("page", page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/follows/index.jsp");
        rd.forward(request, response);
    }
}