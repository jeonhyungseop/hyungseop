package kr.or.ddit.cfms.head.limit.vo;

import java.io.Serializable;

import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.fran.prod.vo.FranProdVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenListVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.prod.vo.HeadProdVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 배수진
 * @since 2021. 6. 3
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdlistVO implements Serializable{
	private String order_no;
	private Integer orderlist_seq;
	private String prod_code;
	private Integer order_qy;
	private Integer prod_suply_pc;
	private Integer rnum;
	
	private HeadInvenVO headInvenVO;
	private FranInvenVO franInvenVO;
}
