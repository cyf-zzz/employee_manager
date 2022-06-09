package cyf.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cyf.entity.Department;
import cyf.entity.Employee;
import cyf.service.DepartmentService;
import cyf.service.EmployeeService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EmployeeAction extends ActionSupport {
    //数据封装
    private Employee employee = new Employee();
    private List<Employee> empList = new ArrayList<>();
    private List<Department> deptList = new ArrayList<>();
    private String keyword;
    //service注入
    private EmployeeService employeeService;
    private DepartmentService departmentService;

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Employee getEmployee() {
        return employee;
    }

    public List<Employee> getEmpList() {
        return empList;
    }

    public void setEmpList(List<Employee> empList) {
        this.empList = empList;
    }

    public List<Department> getDeptList() {
        return deptList;
    }

    public void setDeptList(List<Department> deptList) {
        this.deptList = deptList;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    /**
     * 员工列表
     * @return
     */
    public String list() {
        empList = employeeService.findAll();
        deptList = departmentService.findAll();
        Map<String,Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
        request.put("empList",empList);
        request.put("deptList",deptList);
        return "list";
    }

    /**
     * 返回员工添加界面
     * @return
     */
    public String addPage(){
        deptList = departmentService.findAll();
        return "addPage";
    }

    /**
     * 添加员工信息
     * @return
     */
    public String add(){
        employeeService.save(employee);
        return "listAction";
    }

    /**
     * 返回员工信息修改页面
     * @return
     */
    public String editPage(){
        employee = employeeService.findById(this.employee.getEmpno());
        return "editPage";
    }

    /**
     * 修改员工信息
     * @return
     */
    public String update(){
        employeeService.update(this.employee);
        return "listAction";
    }

    /**
     * 删除员工
     * @return
     */
    public String delete(){
        employeeService.delete(this.employee.getEmpno());
        return "listAction";
    }

    public String search(){
        this.empList = employeeService.getAllByEmployeeName(keyword);
        return "list";
    }

}
