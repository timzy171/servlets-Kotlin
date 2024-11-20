package org.example.lab_1_servlet

import hibernate.DbHelper
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet(name = "allTasksServlet", value = ["/allTasks-servlet"])
class AllTasksServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val view = req?.getRequestDispatcher("all_tasks.jsp")
        req?.setAttribute("tasks", DbHelper.getAllTasks());
        req?.setAttribute("username", req.getParameter("username"));
        view?.forward(req, resp)
    }
}