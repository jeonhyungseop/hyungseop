package kr.or.ddit.cfms.head.deposit.vo;

import java.io.Serializable;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 작성자명
 * @since 2021. 5. 24
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HeadsmnVO implements Serializable {
	
	private Integer dsmn_seq;
	private String head_code;
	private Integer dsmn_blce;
	private Integer dsmn_mvmoney;
	private String dsmn_rcppay_se;
	private String elctc_mt_code;
	private String memo;
	private String dsmn_mvtime;
	private Integer rnum;
	
	private String dscnm;
	private String escnm;
	private String yymmdd;
	private String hh24mi;
	
}
