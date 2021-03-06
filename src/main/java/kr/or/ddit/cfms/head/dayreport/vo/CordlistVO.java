package kr.or.ddit.cfms.head.dayreport.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 배수진
 * @since 2021. 6. 17
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 17      배수진ㄴ       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="cord_seq")
@ToString
public class CordlistVO implements Serializable{
	private Integer cord_seq;
	private String cord_code;
	private String goods_code;
	private String fran_code;
	private Integer goods_qy;
	private Integer goods_pc;
	private String ordpay_no;
	private String goods_nm;
	private String pay_sttus_code;
	
}
