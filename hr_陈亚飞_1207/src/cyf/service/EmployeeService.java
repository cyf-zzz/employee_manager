package cyf.service;

import cyf.entity.Employee;

import java.util.List;

public interface EmployeeService {

	void save(Employee employee);

	void update(Employee employee);

	Employee findById(int empno);

	void delete(int empno);

	List<Employee> findAll();

	List<Employee> getAllByEmployeeName(String employeeName);

}
