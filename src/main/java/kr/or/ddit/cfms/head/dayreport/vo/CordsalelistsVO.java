package kr.or.ddit.cfms.head.dayreport.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 배수진
 * @since 2021. 6. 16
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 16      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode (of= "cord_code")
@ToString
public class CordsalelistsVO implements Serializable { 
	private Integer rnum;
	private String cord_code;
	private String fran_code;
	private String fran_comnm;
	private String cord_time;
	private String cord_sttus_code;
	private String cord_sttus_nm;
	private String cord_cl_code;
	private String cord_cl_nm;
	private Integer cord_total;
	private String ordpay_no;
	private String ordpay_time;
	private Integer ordpay_money;
	private String pay_sttus_code;
	private String pay_sttus_nm;
	private String pay_se_code;
	private String pay_se_nm;
}
