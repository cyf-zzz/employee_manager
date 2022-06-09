package cyf.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Map;
import java.util.Objects;

@Entity
public class Salary {
    private int id;
    private Integer empno;
    private BigDecimal empsalary;
    private String empyear;
    private String empmonth;
    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "empno", nullable = true)
    public Integer getEmpno() {
        return empno;
    }

    public void setEmpno(Integer empno) {
        this.empno = empno;
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
    @Column(name = "empyear", nullable = true, length = 10)
    public String getEmpyear() {
        return empyear;
    }

    public void setEmpyear(String empyear) {
        this.empyear = empyear;
    }

    @Basic
    @Column(name = "empmonth", nullable = true, length = 10)
    public String getEmpmonth() {
        return empmonth;
    }

    public void setEmpmonth(String empmonth) {
        this.empmonth = empmonth;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Salary salary = (Salary) o;
        return id == salary.id &&
                Objects.equals(empno, salary.empno) &&
                Objects.equals(empsalary, salary.empsalary) &&
                Objects.equals(empyear, salary.empyear) &&
                Objects.equals(empmonth, salary.empmonth);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, empno, empsalary, empyear, empmonth);
    }
}
