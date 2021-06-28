package kr.or.ddit.cfms.fran.commons.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.validator.InsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "fran_code")
@NoArgsConstructor
@AllArgsConstructor
public class FranchiseVO implements Serializable{
	public FranchiseVO(String head_code) {this.head_code=head_code;}
	private int rnum;//인덱스번호
	@NotBlank(groups = InsertGroup.class)
	private String fran_code;//가맹점 코드
	@NotBlank(groups = InsertGroup.class)
	private String head_code;//가맹본부 코드
	@NotBlank(groups = InsertGroup.class)
	private String bizrno;//가맹본부 사업자번호
	@NotBlank(groups = InsertGroup.class)
	private String fran_comnm;//가맹점 상호
	@NotBlank(groups = InsertGroup.class)
	private String fran_srbde;//가맹점 가입일자
	private String fran_opende;//가맹점 오픈일자
	private String fran_clsbizde;//가맹점 폐업일자
	@NotBlank(groups = InsertGroup.class)
	private String fran_sttus_code;//가맹점 상태 코드(오픈, 오픈준비중등)
	@NotBlank(groups = InsertGroup.class)
	private String fran_id;//가맹점 아이디
	@NotBlank(groups = InsertGroup.class)
	private String fran_pass;//가맹점 비밀번호
	@NotBlank(groups = InsertGroup.class)
	private String fran_zipno;//가맹점 우편번호
	@NotBlank(groups = InsertGroup.class)
	private String fran_baadd;//가맹점 기본주소
	private String fran_deadd;//가맹점 상세주소
	private String fran_area;//가맹점 지역
	@NotBlank(groups = InsertGroup.class)
	private String fran_se_code;//가맹점 구분 코드(직영점, 가맹점)
	private Double fran_lati;//가맹점 위도
	private Double fran_loti;//가맹점 경도
	private String fran_telno;//가맹점 전화번호
	@NotBlank(groups = InsertGroup.class)
	private String fowner_nm;//가맹점주 이름
	private String fowner_celno;//가맹점주 핸드폰번호
	private String fowner_birtday;//가맹점주 생년월일
	@NotBlank(groups = InsertGroup.class)
	private String fowner_email;//가맹점주 이메일
	@NotBlank(groups = InsertGroup.class)
	private String pin_no;//PIN 번호
	private String auth_pass;//권한 비밀번호
	private String fran_bizrno;//가맹점 사업자번호
	private String att_fileno;//통함첨부 파일번호
	
	private int startAtt;
	private int[] delAttSeq;
	
	private List<AttachfileVO> attachfileList;//파일리스트
	private MultipartFile[] fran_files;
	public void setFran_files(MultipartFile[] fran_files) {
		this.fran_files = fran_files;
		if(fran_files!=null) {
			List<AttachfileVO> attatchList = new ArrayList<>();
			for(MultipartFile file : fran_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachfileVO(file));
			}
			if(attatchList.size()>0)
				this.attachfileList = attatchList;
		}
	}
}