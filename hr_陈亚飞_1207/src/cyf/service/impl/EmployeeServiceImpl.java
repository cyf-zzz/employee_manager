package cyf.service.impl;


import cyf.dao.EmployeeDao;
import cyf.entity.Employee;
import cyf.service.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeDao employeeDao;

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Override
	public void save(Employee employee) {
		employeeDao.save(employee);
	}

	@Override
	public void update(Employee employee) {
		employeeDao.update(employee);
	}

	@Override
	public Employee findById(int empno) {
		return employeeDao.findById(empno);
	}

	@Override
	public void delete(int empno) {
		employeeDao.delete(empno);
	}

	@Override
	public List<Employee> findAll() {
		return employeeDao.findAll();
	}

	@Override
	public List<Employee> getAllByEmployeeName(String employeeName) {
		return employeeDao.getAllByEmployeeName(employeeName);
	}
}
