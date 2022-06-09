package cyf.dao;

import cyf.entity.Employee;
import cyf.entity.Salary;

import java.util.List;

public interface SalaryDao {
    void save(Salary salary);

    void update(Salary salary);

    void delete(int id);

    Salary findById(int id);

    /**
     * 按部门求平均工资
     * @return
     */
    List<Object> findByDpt();

    List<Salary> findAll();
}
