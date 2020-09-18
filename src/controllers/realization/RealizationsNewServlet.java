package controllers.realization;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Realization;

/**
 * Servlet implementation class RealizationNewServlet
 */
@WebServlet("/realizations/new")
public class RealizationsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealizationsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        Realization r = new Realization();
        r.setRealization_date(new Date(System.currentTimeMillis()));
        request.setAttribute("realization", r);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/realizations/new.jsp");
        rd.forward(request, response);
    }

}
