package cyf.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
public class Employee {
    private int empno;
    private String empname;
    private BigDecimal empsalary;
    private Integer dptno;

    @Id
    @Column(name = "empno", nullable = false)
    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    @Basic
    @Column(name = "empname", nullable = true, length = 50)
    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname;
    }

    @Basic
    @Column(name = "empsalary", nullable = true, precision = 2)
    public BigDecimal getEmpsalary() {
        return empsalary;
    }

    public void setEmpsalary(BigDecimal empsalary) {
        this.empsalary = empsalary;
    }

    @Basic
    @Column(name = "dptno", nullable = true)
    public Integer getDptno() {
        return dptno;
    }

    public void setDptno(Integer dptno) {
        this.dptno = dptno;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Employee employee = (Employee) o;
        return empno == employee.empno &&
                Objects.equals(empname, employee.empname) &&
                Objects.equals(empsalary, employee.empsalary) &&
                Objects.equals(dptno, employee.dptno);
    }

    @Override
    public int hashCode() {
        return Objects.hash(empno, empname, empsalary, dptno);
    }
}
