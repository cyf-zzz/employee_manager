package cyf.dao.impl;

import cyf.dao.SalaryDao;
import cyf.entity.Salary;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

public class SalaryDaoImpl implements SalaryDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Salary salary) {
        sessionFactory.getCurrentSession().save(salary);
    }

    @Override
    public void update(Salary salary) {
        sessionFactory.getCurrentSession().update(salary);
    }

    @Override
    public void delete(int id) {
        String hql="delete from Salary s where s.id=?1";
        Query query =sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(1, id);
        query.executeUpdate();
    }

    @Override
    public Salary findById(int id) {
        String hql="select distinct s from Salary s where s.id=?1";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(1,id);
        return (Salary) query.uniqueResult();
    }

    @Override
    public List<Object> findByDpt() {
        String hql = "select distinct d.dname,s.empyear,s.empmonth,avg(s.empsalary) as avg from Department d,Employee e,Salary s where e.dptno = d.id and e.empno = s.empno group by d.id,d.dname,s.empyear,s.empmonth order by d.id";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Object> list = query.list();
        return list;
    }

    @Override
    public List<Salary> findAll() {
        String hql="select distinct s from Salary s";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Salary> list = query.list();
        return list;
    }
}
