package kr.or.ddit.cfms.admin.headmanage.vo;

import java.util.List;

import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;
import lombok.Data;

@Data
public class PayListVO {
	private Integer pay_seq;
	private String head_code;
	private String syspay_code;
	private String pay_se_code;
	private String syspay_pay_time;
	private String syspay_end_time;
	private String syspay_repay_at;
	private String syspay_use_at;
	
	private String syspay_nm;
	private String com_code_nm;
	
	private List<systempaymentVO> systempaymentList;
	private HeadsmnVO headsmnList;
	
	//사용중이던 상품vo
	private PayListVO usedpayVO;
}
