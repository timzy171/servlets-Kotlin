package org.example.lab_1_servlet

import entity.UserTask
import hibernate.DbHelper
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet(name = "subscribeServlet", value = ["/subscribe-Servlet"])
class SubscribeServlet : HttpServlet() {

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val view = req?.getRequestDispatcher("subscribe.jsp")
        req?.setAttribute("taskName", req.getParameter("taskName"))
        req?.setAttribute("isSubscribed", req.getParameter("isSubscribed"))
        view?.forward(req, resp)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val view = req?.getRequestDispatcher("subscribe.jsp")

        val taskName = req?.getParameter("taskName")
        val username = req?.getParameter("username")

        req?.setAttribute("taskName", taskName)
        req?.setAttribute("username", username)

        val user = username?.let { DbHelper.getUser(it) }
        val task = taskName?.let { DbHelper.getTask(it) }

        if (DbHelper.isUserAlreadySubscribedToTask(user!!, task!!)) {
            req.setAttribute("isSubscribed", true)
        } else {
            DbHelper.saveUserTaskRel(UserTask(user.id, task.id))
            req.setAttribute("isSubscribed", false)
        }

        view?.forward(req, resp)
    }

}