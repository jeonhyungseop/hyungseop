package kr.or.ddit.cfms.head.employee.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "emp_id")
public class EmployeeVO implements Serializable{
	
	
	
	private String emp_id;
	private String head_code;
	private Integer dept_seq;
	private String emp_pass;
	private String emp_nm;
	private String emp_zipno;
	private String emp_baadd;
	private String emp_deadd;
	private String emp_telno;
	private String emp_celno;
	private String emp_email;
	private String emp_birtday;
	private String emp_encpn;
	private String emp_retde;
	private Integer emp_base_vcde;
	private Double emp_remndr_vcde;
	private String emp_se_code;
	private String emp_clsf_code;
	private String emp_bacc;
	private String emp_bnm;
	private String att_fileno;// 통합첨부 파일번호
	
	private String before_att_fileno;
	
	private Double emp_minus;
	
	
	private int startAtt;
	private int[] delAttSeq;
	
	private List<DeptVO> deptList;
	private List<AttachfileVO> attachfileList;
	private MultipartFile[] emp_files;
	
	public void setEmp_files(MultipartFile[] emp_files) {
		this.emp_files = emp_files;
		if(emp_files!=null) {
			List<AttachfileVO> attatchList = new ArrayList<>();
			for(MultipartFile file : emp_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachfileVO(file));
			}
			if(attatchList.size()>0)
				this.attachfileList = attatchList;
		}
	}
}
