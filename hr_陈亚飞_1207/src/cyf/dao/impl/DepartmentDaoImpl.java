package cyf.dao.impl;

import cyf.dao.DepartmentDao;
import cyf.entity.Department;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;

import java.util.List;

public class DepartmentDaoImpl implements DepartmentDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void save(Department department) {
		sessionFactory.getCurrentSession().save(department);
	}

	@Override
	public void update(Department department) {
		sessionFactory.getCurrentSession().update(department);
	}

	@Override
	public Department findById(int id) {
		String hql = "select distinct d from Department d where d.id=?1";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(1,id);
		return (Department)query.uniqueResult();
	}

	@Override
	public void delete(int id) {
		String hql="delete from Department d where d.id=?1";
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(1, id);
		query.executeUpdate();
	}

	@Override
	public List<Department> findAll() {
		String hql = "select distinct d from Department d";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
}
