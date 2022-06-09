package cyf.dao.impl;


import cyf.dao.EmployeeDao;
import cyf.entity.Employee;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;

import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Employee employee) {
        sessionFactory.getCurrentSession().save(employee);
    }

    @Override
    public void update(Employee employee) {
        sessionFactory.getCurrentSession().update(employee);
    }

    @Override
    public void delete(int empno) {
        String hql="delete from Employee e where e.empno=?1";
        Query query =sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(1, empno);
        query.executeUpdate();
        hql="delete from Salary s where s.empno=?1";
        query =sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(1, empno);
        query.executeUpdate();
    }

    @Override
    public Employee findById(int empno) {
        String hql="select distinct e from Employee e where e.empno=?1";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(1,empno);
        return (Employee) query.uniqueResult();
    }

    @Override
    public List<Employee> findAll() {
        String hql="select distinct e from Employee e";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Employee> list = query.list();
        return list;
    }

    @Override
    public List<Employee> getAllByEmployeeName(String employeeName) {
        String hql="select distinct e from Employee e where e.empname like ?1";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(1,'%'+employeeName+'%');
        List<Employee> list = query.list();
        return list;
    }
}
