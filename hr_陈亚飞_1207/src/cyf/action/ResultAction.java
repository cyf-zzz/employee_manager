package cyf.action;

import com.opensymphony.xwork2.ActionSupport;
import cyf.entity.Employee;
import cyf.service.SalaryService;

import java.util.ArrayList;
import java.util.List;


public class ResultAction extends ActionSupport {
    private List<Object> objectList = new ArrayList<>();
    private SalaryService salaryService;

    public List<Object> getObjectList() {
        return objectList;
    }

    public void setObjectList(List<Object> objectList) {
        this.objectList = objectList;
    }

    public void setSalaryService(SalaryService salaryService) {
        this.salaryService = salaryService;
    }

    public String result() {
        objectList = salaryService.findByDpt();
        return "reslist";
    }
}
