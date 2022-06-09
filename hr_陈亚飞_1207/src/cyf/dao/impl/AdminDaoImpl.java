package cyf.dao.impl;

import cyf.dao.AdminDao;
import cyf.entity.Admin;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class AdminDaoImpl implements AdminDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Admin admin) {
        sessionFactory.getCurrentSession().save(admin);
    }

    @Override
    public Admin findByAdmin(Admin admin) {
        String hql = "select distinct a from Admin a where a.username=?1 and a.pwd=?2";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(1,admin.getUsername());
        query.setParameter(2,admin.getPwd());
        return (Admin) query.uniqueResult();
    }

}
