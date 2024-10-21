package org.example.lab_1_servlet

import hibernate.DbHelper
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse


@WebServlet(name = "signInServlet", value = ["/signIn-Servlet"])
class LoginServlet : HttpServlet() {


    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        if (req != null && resp != null) {

            val user = DbHelper.getUser(req.getParameter("username"), req.getParameter("password"))

            if (user != null) {
                with(req) {
                    setAttribute("name", user.name)
                    setAttribute("surname", user.surname)
                    setAttribute("username", user.username)
                    setAttribute("password", user.password)

                    getRequestDispatcher("personal_account.jsp").forward(this, resp)
                }
            } else {
                req.setAttribute("errorMessage", "Неправильный логин или пароль")
                req.getRequestDispatcher("signIn.jsp").forward(req, resp)
            }
        }
    }
}