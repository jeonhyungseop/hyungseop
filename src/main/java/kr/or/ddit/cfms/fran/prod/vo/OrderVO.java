package kr.or.ddit.cfms.fran.prod.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO implements Serializable{
	private String order_no;
	private String fran_code;
	private String order_time;
	private String order_sttus_code;
	private Integer order_suplypc_sm;
	private String pay_mt_code;
	private String order_confm_time;
	private String order_cnl_reason;
	
	private FranProdVO franProdVO;
}
