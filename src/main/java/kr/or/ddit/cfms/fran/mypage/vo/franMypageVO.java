package kr.or.ddit.cfms.fran.mypage.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class franMypageVO implements Serializable{
	
	
	
	private String fran_code;
	private String head_code;
	private String bizrno;
	private String fran_comnm;
	private String fran_srbde;
	private String fran_opende;
	private String fran_clsbizde;
	private String fran_sttus_code;
	private String fran_id;
	private String fran_pass;
	private String fran_zipno;
	private String fran_baadd;
	private String fran_deadd;
	private String fran_se_code;
	private Integer fran_lati;
	private Integer fran_loti;
	private String fran_telno;
	private String fowner_nm;
	private String fowner_celno;
	private String fowner_birtday;
	private String fowner_email;
	private String pin_no;
	private String auth_pass;
	private String fran_bizrno;
	private String att_fileno;
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
