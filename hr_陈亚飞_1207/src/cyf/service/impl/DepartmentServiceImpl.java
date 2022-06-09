package cyf.service.impl;

import cyf.dao.DepartmentDao;
import cyf.entity.Department;
import cyf.service.DepartmentService;

import java.util.List;

public class DepartmentServiceImpl implements DepartmentService {

	private DepartmentDao departmentDao;

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public void save(Department department) {
		departmentDao.save(department);
	}

	@Override
	public void update(Department department) {
		departmentDao.update(department);
	}

	@Override
	public Department findById(int id) {
		return departmentDao.findById(id);
	}

	@Override
	public void delete(int id) {
		departmentDao.delete(id);
	}

	@Override
	public List<Department> findAll() {
		return departmentDao.findAll();
	}
}
