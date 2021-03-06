package kr.or.ddit.cfms.head.royal.vo;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "bilclct_seq")
@NoArgsConstructor
@AllArgsConstructor
public class HeadBillVO implements Serializable{
	public HeadBillVO(String code) {this.head_code = code;}
	private Integer rnum;
	private Integer bilclct_seq;//수납 일련번호
	private String fran_code;//가맹점 코드
	private String head_code;//가맹본부 코드
	private String bilclct_schde;//수납 예정일자
	private String bilclct_comde;//수납 완료일자
	private String bilclct_cn;//수납 내용
	private String bilclct_sttus_code;//수납 상태코드(BSC)
	private String pay_se_code;//결제 수단코드(PSC)
	private String fran_comnm;//가맹점 이름
	private String royalty_apli_start_de;//가맹비 적용 시작 일자
}