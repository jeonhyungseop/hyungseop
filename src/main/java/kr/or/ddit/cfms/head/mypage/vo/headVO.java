package kr.or.ddit.cfms.head.mypage.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "head_id")
public class headVO implements Serializable{

	
	private String att_fileno;
	private String head_comnm_em;
	private String head_code;
	private String head_id;
	private String head_pass;
	private String head_nm;
	private String head_comnm;
	private String head_zipno;
	private String head_baadd;
	private String head_deadd;
	private String head_telno;
	private String head_email;
	private String head_srbde;
	private String head_chargernm;
	private String induty_code;
	private String repay_at;
	private String head_ledate;
	private String head_bizrno;
	private Integer base_worktime;
	private Integer lunch_starttime;
	private Integer lunch_endtime;
	private Integer dinner_starttime;
	private Integer dinner_endtime;
	private String salary_base_de;
	
	
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
