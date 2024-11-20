package org.example.lab_1_servlet

import entity.Task
import entity.UserTask
import hibernate.DbHelper
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet(name = "createTaskServlet", value = ["/createTask-servlet"])
class CreateTaskServlet : HttpServlet() {

    lateinit var username : String

    override fun doGet(request: HttpServletRequest, response: HttpServletResponse) {
        val view = request.getRequestDispatcher("createTask.jsp")
        username = request.getParameter("username")
        view.forward(request, response)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        req?.let {
            val taskName = it.getParameter("taskName")

            if (!DbHelper.isTaskInDb(taskName)) {
                DbHelper.saveTask(Task(taskName))

                val task = DbHelper.getTask(taskName)
                val user = DbHelper.getUser(username)

                DbHelper.saveUserTaskRel(UserTask(user?.id, task?.id))

                resp?.sendRedirect("personalAccount-Servlet?username=${username}")
            } else {
                req.setAttribute("errorMessage", "Такая задача уже существует")
                resp?.sendRedirect("createTask-servlet?username=${username}")
            }
        }
    }
}