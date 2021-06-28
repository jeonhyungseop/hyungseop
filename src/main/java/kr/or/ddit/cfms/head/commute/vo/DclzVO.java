package kr.or.ddit.cfms.head.commute.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class DclzVO implements Serializable {
	private Integer dclz_seq;
	private String emp_id;
	private String dclz_stdrde;
	private String attend_time;
	private String lvffc_time;
	private Integer worktime_sm;
	private String dclz_se_code;
	private String dclz_change_prvonsh;
	private String dclz_change_confm_at;
	
	private List<EmployeeVO> employeeList;
	private List<DeptVO> deptList;
	private List<AttachfileVO> attachfileList;
	
}
