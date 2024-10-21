package hibernate

import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration

object HibernateUtil {
    private val sessionFactory: SessionFactory = Configuration().configure().buildSessionFactory()

    fun getSessionFactory(): SessionFactory {
        return sessionFactory
    }
}
