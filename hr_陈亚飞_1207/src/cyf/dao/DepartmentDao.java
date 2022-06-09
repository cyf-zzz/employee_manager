package cyf.dao;

import java.util.List;

import cyf.entity.Department;

/**
 * 部门模块dao接口
 */
public interface DepartmentDao {
	/**
	 * 保存
	 * @param department
	 */
	void save(Department department);

	/**
	 * 更新信息
	 * @param department
	 */
	void update(Department department);

	/**
	 * 按主键查找
	 * @param id
	 * @return
	 */
	Department findById(int id);

	/**
	 * 删除
	 * @param id
	 */
	void delete(int id);

	/**
	 * 查询全部
	 * @return
	 */
	List<Department> findAll();

}
