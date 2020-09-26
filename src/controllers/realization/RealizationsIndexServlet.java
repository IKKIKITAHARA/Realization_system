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

import models.Realization;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class RealizationIndexServlet
 */
@WebServlet("/realizations/index")
public class RealizationsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealizationsIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");


        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Realization> realizations = em.createNamedQuery("getAllRealizations", Realization.class)
                                  .setFirstResult(15 * (page - 1))
                                  .setMaxResults(15)
                                  .getResultList();

        long realizations_count = (long)em.createNamedQuery("getMyRealizationsCount", Long.class)
                                  .setParameter("user", login_user)
                                  .getSingleResult();

        em.close();

        request.setAttribute("realizations", realizations);
        request.setAttribute("realizations_count", realizations_count);
        request.setAttribute("page", page);
        request.setAttribute("realizations_count", realizations_count);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/realizations/index.jsp");
        rd.forward(request, response);
    }

}
