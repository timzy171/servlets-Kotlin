package org.example.lab_1_servlet

import hibernate.DbHelper
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet(name = "personalAccountServlet", value = ["/personalAccount-Servlet"])
class PersonalAccountServlet : HttpServlet() {

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val view = req?.getRequestDispatcher("personal_account.jsp")
        val username = req?.getParameter("username")
        val user = username?.let { DbHelper.getUser(it) }

        user?.let {
            req.setAttribute("username", user.username)
            req.setAttribute("surname", user.surname)
            req.setAttribute("name", user.name)
        }

        view?.forward(req, resp)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        super.doPost(req, resp)
    }
}