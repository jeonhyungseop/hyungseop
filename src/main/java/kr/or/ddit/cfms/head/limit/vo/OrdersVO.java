package kr.or.ddit.cfms.head.limit.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 배수진
 * @since 2021. 6. 2
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersVO implements Serializable{
	
	public OrdersVO(String code) {
		if(code.length() > 5) {
			this.fran_code = code;
		}else {
			this.head_code = code;
			
		}
	}
	
	private String order_no;
	private String fran_code;
	private String order_time;
	private String order_sttus_code;
	private String orc_nm;
	private Integer order_suplypc_sm;
	private String pay_mt_code;
	private String head_code;
	private String bizrno;
	private String fran_comnm;
	private String fran_srbde;
	private String fran_opende;
	private String fran_clsbizde;
	private String fran_id;
	private String fran_pass;
	private String fran_zipno;
	private String fran_baadd;
	private String fran_deadd;
	private String fran_se_code;
	private String fsc_nm;
	private String fran_telno;
	private String fowner_nm;
	private String fowner_celno;
	private String fowner_birtday;
	private String fowner_email;
	private String pin_no;
	private String auth_pass;
	private String fran_bizrno;
	private String att_fileno;
	private String out_code;
	private String out_sttus_code;
	private String osc_nm;
	private String out_time;
	private String in_no;
	private String in_sttus_code;
	private String isc_nm;
	private String in_time;
	private Integer rnum;
	private String order_confm_time;
	private String order_cnl_reason;
	private String out_cmpt_time;
	private String out_cnl_reason;
	private String in_cmpt_time;
	
	private InVO inVO;
	private LimitVO limitVO;
	private OutVO outVO;
	private HeadInvenVO headInven;
	
	private String yymmdd;
	private String hh24mi;
	
	private List<OrdlistVO> orderlistVO;
	private List<OutlistVO> outListVO;
	private List<InlistVO> inListVO;
	private List<HeadInvenVO> headInvenVO;
	private List<String> prods;
	
	private Map <String, String> steps;
	private int totalRecode;
	
}
