package kr.or.ddit.cfms.head.mysalary.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "salary_seq")
public class SalaryVO implements Serializable {
	private Integer salary_seq;
	private String emp_id;
	private String salary_de;
	private Integer salary_money;
	
	private List<DeptVO> deptList;
	private List<EmployeeVO> employeeList;
	private List<HeadquartersVO> headList;
	private List<AttachfileVO> attachfileList;
	
}
