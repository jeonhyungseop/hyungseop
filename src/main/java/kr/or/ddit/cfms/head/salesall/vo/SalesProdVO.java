package kr.or.ddit.cfms.head.salesall.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SalesProdVO implements Serializable{
	
	public SalesProdVO(String head_code) {
		super();
		this.head_code = head_code;
	}
	public SalesProdVO(String head_code, String prod_code) {
		super();
		this.head_code = head_code;
		this.prod_code = prod_code;
	}
	
	private String head_code;
	private String prod_code;
	private String rnum;
	private String fran_comnm;
	private String in_cmpt_time;
	private Integer in_qy;
	private Integer prod_suply_pc;
}
