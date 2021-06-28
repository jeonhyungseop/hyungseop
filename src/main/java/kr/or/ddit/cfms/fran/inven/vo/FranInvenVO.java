package kr.or.ddit.cfms.fran.inven.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.prod.vo.HeadProdVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 이진수
 * @since 2021. 5. 26
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FranInvenVO implements Serializable{
	private String prod_code;
	private String fran_code;
	private Integer fran_nowinven;
	private Integer fran_proinven;
	private String fran_memo;
	private String prod_cl_code;
	private String prod_nm;
	private String prod_unit_code;
	private Integer prod_unit_qy;
	private String prod_brcd;
	private Integer prod_puchas_pc;
	private Integer prod_suply_pc;
	private String prod_memo;
	private String prod_mafanm;
	private String att_fileno;
	
	private String com_code_nm;
	private String use_at;
	
	private String[] update_prod_codes;
	private String[] del_prod_codes;
	
	private HeadProdVO headProdVO;
	
	private List<AttachfileVO> attachfileList;
	
}
