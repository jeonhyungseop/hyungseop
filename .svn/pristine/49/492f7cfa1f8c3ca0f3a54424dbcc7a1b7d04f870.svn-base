package kr.or.ddit.cfms.head.education.vo;

import java.io.Serializable;
import java.util.List;
import javax.validation.constraints.NotBlank;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.validator.InsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 진유리
 * @since 2021. 06. 15
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * ------------     --------    ----------------------
 * 2021. 06. 15     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Data
@ToString
@EqualsAndHashCode(of = "edc_code")
@NoArgsConstructor
@AllArgsConstructor
public class EducationVO implements Serializable{
	@NotBlank(groups = InsertGroup.class)
	private String edc_code;//교육코드
	@NotBlank(groups = InsertGroup.class)
	private String emp_id;//직원 아이디
	@NotBlank(groups = InsertGroup.class)
	private String edc_cl_code;//교육 분류 코드(ECC)
	@NotBlank(groups = InsertGroup.class)
	private String edc_nm;//교육 명
	@NotBlank(groups = InsertGroup.class)
	private String edc_start_time;//교육 시작일시
	@NotBlank(groups = InsertGroup.class)
	private String edc_end_time;//교육 종료일시
	private String edc_cn;//교육 내용
	@NotBlank(groups = InsertGroup.class)
	private String edc_place;//교육 장소
	private String edc_del_at;
	private String edc_cl_code_val;
	private String edc_start;
	private String edc_end;
	
	public EducationVO(String edc_code, String edc_start_time, String edc_end_time) {
		this.edc_code = edc_code;
		this.edc_start_time = edc_start_time;
		this.edc_end_time = edc_end_time;
	}
	//직원리스트
	private List<EmployeeVO> employeeList;
	
	private List<EduListVO> eduList;
	
	private String[] franList;
}