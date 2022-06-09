package cyf.service;

import java.util.List;

import cyf.entity.Department;

public interface DepartmentService {

	void save(Department department);

	void update(Department department);

	Department findById(int id);

	void delete(int id);

	List<Department> findAll();

}
