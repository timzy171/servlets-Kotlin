package org.example.lab_1_servlet

import entity.User
import hibernate.DbHelper
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse


@WebServlet(name = "signUpServlet", value = ["/signUp-Servlet"])

class SignUpServlet : HttpServlet() {

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val view = req?.getRequestDispatcher("signUp.jsp")
        view?.forward(req, resp)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        if (req != null && resp != null) {
            val name = req.getParameter("name")
            val surname = req.getParameter("surname")
            val login = req.getParameter("username")
            val password = req.getParameter("password")

            val newUser = User(name, surname, login, password)

            if (!DbHelper.isUserInDb(login)) {
                DbHelper.saveUser(newUser)
                req.getRequestDispatcher("signIn-Servlet").forward(req, resp)
            } else {
                req.setAttribute("errorMessage", "Данный username уже занят")
                req.getRequestDispatcher("signUp.jsp").forward(req, resp)
            }
        }
    }
}