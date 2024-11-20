package hibernate

import entity.Task
import entity.User
import entity.UserTask
import org.hibernate.Session
import org.hibernate.Transaction

object DbHelper {
    fun getUser(username: String, password: String): User? {
        val sessionFactory = HibernateUtil.getSessionFactory()
        val session: Session = sessionFactory.openSession()
        var transaction: Transaction? = null
        var user: User? = null

        try {
            transaction = session.beginTransaction()
            val query: org.hibernate.query.Query<User> = session.createQuery(
                "FROM User WHERE username = :username AND password = :password",
                User::class.java
            )

            query.setParameter("username", username)
            query.setParameter("password", password)
            user = query.uniqueResult()
            transaction.commit()
        } catch (e: Exception) {
            transaction?.rollback()
            e.printStackTrace()
        } finally {
            session.close()
        }

        return user
    }


    fun isUserInDb(username: String) : Boolean {
        val sessionFactory = HibernateUtil.getSessionFactory()
        val session: Session = sessionFactory.openSession()
        var transaction: Transaction? = null
        var user: User? = null

        try {
            transaction = session.beginTransaction()
            val query: org.hibernate.query.Query<User> = session.createQuery(
                "FROM User WHERE username = :username",
                User::class.java
            )

            query.setParameter("username", username)
            user = query.uniqueResult()

            transaction.commit()
        } catch (e: Exception) {
            transaction?.rollback()
            e.printStackTrace()
        } finally {
            session.close()
        }

        return user != null
    }

    fun saveUser(user: User) {
        val sessionFactory = HibernateUtil.getSessionFactory()
        val session = sessionFactory.openSession()
        val transaction = session.beginTransaction()

        session.save(user)
        transaction.commit()
    }

    fun saveTask(task: Task) {
        val sessionFactory = HibernateUtil.getSessionFactory()
        val session = sessionFactory.openSession()
        val transaction = session.beginTransaction()

        session.save(task)
        transaction.commit()
    }

    fun saveUserTaskRel(userTask: UserTask) {
        val sessionFactory = HibernateUtil.getSessionFactory()
        val session = sessionFactory.openSession()
        val transaction = session.beginTransaction()

        session.save(userTask)
        transaction.commit()
    }

    fun getUser(username: String): User? {
        val sessionFactory = HibernateUtil.getSessionFactory()
        val session: Session = sessionFactory.openSession()
        var transaction: Transaction? = null
        var user: User? = null

        try {
            transaction = session.beginTransaction()
            val query: org.hibernate.query.Query<User> = session.createQuery(
                "FROM User WHERE username = :username",
                User::class.java
            )

            query.setParameter("username", username)
            user = query.uniqueResult()
            transaction.commit()
        } catch (e: Exception) {
            transaction?.rollback()
            e.printStackTrace()
        } finally {
            session.close()
        }

        return user
    }

    fun getTask(taskName : String): Task? {
        val sessionFactory = HibernateUtil.getSessionFactory()
        val session: Session = sessionFactory.openSession()
        var transaction: Transaction? = null
        var task: Task? = null

        try {
            transaction = session.beginTransaction()
            val query: org.hibernate.query.Query<Task> = session.createQuery(
                "FROM Task WHERE name = :taskName",
                Task::class.java
            )

            query.setParameter("taskName", taskName)
            task = query.uniqueResult()
            transaction.commit()
        } catch (e: Exception) {
            transaction?.rollback()
            e.printStackTrace()
        } finally {
            session.close()
        }

        return task
    }
}