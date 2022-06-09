package cyf.service.impl;

import cyf.dao.SalaryDao;
import cyf.entity.Salary;
import cyf.service.SalaryService;

import java.util.List;

public class SalaryServiceImpl implements SalaryService {

    private SalaryDao salaryDao;

    public void setSalaryDao(SalaryDao salaryDao) {
        this.salaryDao = salaryDao;
    }

    @Override
    public void save(Salary salary) {
        salaryDao.save(salary);
    }

    @Override
    public void update(Salary salary) {
        salaryDao.update(salary);
    }

    @Override
    public Salary findById(int id) {
        return salaryDao.findById(id);
    }

    @Override
    public void delete(int id) {
        salaryDao.delete(id);
    }

    @Override
    public List<Object> findByDpt() {
        return salaryDao.findByDpt();
    }

    @Override
    public List<Salary> findAll() {
        return salaryDao.findAll();
    }
}
