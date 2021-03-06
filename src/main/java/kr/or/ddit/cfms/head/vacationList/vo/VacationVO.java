package kr.or.ddit.cfms.head.vacationList.vo;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "vcreq_seq")
public class VacationVO {
	private Integer vcreq_seq;
	private String emp_id;
	private String vcatn_startde;
	private String vcatn_endde;
	private Double vcatn_usede;
	private String vcatn_prvonsh;
	private String vcatn_confm_at;
	private String vcatn_se_code;
	
	private List<EmployeeVO> employeeList;
	private List<DeptVO> deptList;
	private List<AttachfileVO> attachfileList;
	
	private String head_code;
	private String changeMonth;
	
	private Double emp_minus;
	private Double emp_remndr_vcde;
}
