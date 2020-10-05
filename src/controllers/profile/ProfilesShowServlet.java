package controllers.profile;

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
 * Servlet implementation class ProfileShowServlet
 */
@WebServlet("/profiles/show")
public class ProfilesShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilesShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User u = em.find(User.class, Integer.parseInt(request.getParameter("id")));



        request.setAttribute("user", u);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        User login_user = (User) request.getSession().getAttribute("login_user");

        List <Follow> myFollow = em.createNamedQuery("getFollowedDatas", Follow.class)
                                 .setParameter("follower", login_user)
                                 .setParameter("followed", u)
                                 .getResultList();

        em.close();

        request.setAttribute("myFollow", myFollow);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/profiles/show.jsp");
        rd.forward(request, response);

    }

}
