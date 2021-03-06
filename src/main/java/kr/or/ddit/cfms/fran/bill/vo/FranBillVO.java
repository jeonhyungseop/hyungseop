package kr.or.ddit.cfms.fran.bill.vo;

import java.io.Serializable;

import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "bilclct_seq")
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FranBillVO implements Serializable{
	public FranBillVO(String head_code, String fran_code) {
		this.head_code = head_code;
		this.fran_code = fran_code;
	}
	private Integer rnum;
	private Integer bilclct_seq;
	private String fran_code;
	private String head_code;
	private String bilclct_schde;
	private String bilclct_comde;
	private String bilclct_cn;
	private String bilclct_sttus_code;
	private String pay_se_code;
	private String royalty_apli_start_de;
	private Integer royalty;
	private String royalty_use_at;
	
	private FrdsmnVO frdsmnVO;
}