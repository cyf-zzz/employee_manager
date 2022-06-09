package cyf.dao;

import java.util.List;

import cyf.entity.Employee;

public interface EmployeeDao {

	void save(Employee employee);

	void update(Employee employee);

	void delete(int empno);

	Employee findById(int empno);

	List<Employee> findAll();

	/**
	 * 用户名模糊查询
	 * @param employeeName
	 * @return
	 */
	List<Employee> getAllByEmployeeName(String employeeName);

}
