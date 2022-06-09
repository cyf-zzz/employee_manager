package cyf.action;

import com.opensymphony.xwork2.ActionSupport;
import cyf.entity.Employee;
import cyf.entity.Salary;
import cyf.service.EmployeeService;
import cyf.service.SalaryService;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

public class SalaryAction extends ActionSupport {
    private Salary salary = new Salary();
    private Employee employee = new Employee();
    private List<String> list = Arrays.asList("一月", "二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Salary getSalary() {
        return salary;
    }

    public void setSalary(Salary salary) {
        this.salary = salary;
    }

    private SalaryService salaryService;
    private EmployeeService employeeService;

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setSalaryService(SalaryService salaryService) {
        this.salaryService = salaryService;
    }

    public String addPage(){
        employee = employeeService.findById(this.employee.getEmpno());
        salary.setEmpno(this.employee.getEmpno());
        salary.setEmpsalary(this.employee.getEmpsalary());
        return "addPage";
    }

    public String add(){
        salaryService.save(salary);
        return "listAction";
    }
}
