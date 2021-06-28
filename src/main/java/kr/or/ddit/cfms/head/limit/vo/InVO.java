package kr.or.ddit.cfms.head.limit.vo;

import java.io.Serializable;

import kr.or.ddit.cfms.fran.prod.vo.FranProdVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 배수진
 * @since 2021. 6. 1
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 1      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class InVO implements Serializable{ 
	private String in_no;
	private String fran_code;
	private String out_code;
	private String in_sttus_code;
	private String in_time;
	private String in_cmpt_time;

}
