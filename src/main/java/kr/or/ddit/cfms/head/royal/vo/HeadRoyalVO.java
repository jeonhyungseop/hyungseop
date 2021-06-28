package kr.or.ddit.cfms.head.royal.vo;

import java.io.Serializable;
import javax.validation.constraints.NotBlank;
import kr.or.ddit.cfms.validator.InsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "head_code")
@NoArgsConstructor
@AllArgsConstructor
public class HeadRoyalVO implements Serializable{
	public HeadRoyalVO(String head_code) {this.head_code=head_code;}
	
	public HeadRoyalVO(String head_code, Integer royalty, String royalty_apli_start_de) {
		this.head_code=head_code;
		this.royalty = royalty;
		this.royalty_apli_start_de = royalty_apli_start_de;
	}
	private Integer rnum;
	@NotBlank(groups = InsertGroup.class)
	private String head_code;//가맹본부 코드
	@NotBlank(groups = InsertGroup.class)
	private Integer royalty;//가맹비
	@NotBlank(groups = InsertGroup.class)
	private String royalty_apli_start_de;//가맹비 적용 시작 일자
	private String royalty_use_at;//가맹비 사용여부
	private Integer use_day;//사용일자
	private String last_day;//각 가맹비의 마지막 일자
}