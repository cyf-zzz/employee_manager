package cyf.service;

import cyf.entity.Salary;

import java.util.List;

public interface SalaryService {

    void save(Salary salary);

    void update(Salary salary);

    Salary findById(int id);

    void delete(int id);

    List<Object> findByDpt();

    List<Salary> findAll();
}
