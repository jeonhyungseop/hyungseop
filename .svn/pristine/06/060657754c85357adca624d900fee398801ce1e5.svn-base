package kr.or.ddit.cfms.head.commons.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.validator.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = {"head_code", "head_id"})
@ToString
public class HeadquartersVO implements Serializable{
	private String att_fileno;
	@NotBlank(groups = InsertGroup.class)
	private String head_comnm_em;
	@NotBlank(groups = InsertGroup.class)
	private String head_code;
	@NotBlank(groups = InsertGroup.class)
	private String head_id;
	@NotBlank(groups = InsertGroup.class)
	private String head_pass;
	@NotBlank(groups = InsertGroup.class)
	private String head_nm;
	@NotBlank(groups = InsertGroup.class)
	private String head_comnm;
	@NotBlank(groups = InsertGroup.class)
	private String head_zipno;
	@NotBlank(groups = InsertGroup.class)
	private String head_baadd;
	private String head_deadd;
	@NotBlank(groups = InsertGroup.class)
	private String head_telno;
	@NotBlank(groups = InsertGroup.class)
	private String head_email;
	@NotBlank(groups = InsertGroup.class)
	private String head_srbde;
	private String head_chargernm;
	@NotBlank(groups = InsertGroup.class)
	private String induty_code;
	private String repay_at;
	private String head_ledate;
	@NotBlank(groups = InsertGroup.class)
	private String head_bizrno;
	private Integer base_worktime;
	private Integer lunch_starttime;
	private Integer lunch_endtime;
	private Integer dinner_starttime;
	private Integer dinner_endtime;
	private String salary_base_de;
	
	private List<ComCodeVO> comCodeList;
	
	private List<StipulationVO> stipulationList;
	
	private List<AttachfileVO> attachfileList;
	private MultipartFile[] head_files;
	
	public void setHead_files(MultipartFile[] head_files) {
		this.head_files = head_files;
		if(head_files!=null) {
			List<AttachfileVO> attatchList = new ArrayList<>();
			for(MultipartFile file : head_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachfileVO(file));
			}
			if(attatchList.size()>0)
				this.attachfileList = attatchList;
		}
	}
	
}