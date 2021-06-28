package kr.or.ddit.cfms.head.goods.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 이진수
 * @since 2021. 6. 15
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HeadGoodsVO implements Serializable{
	public HeadGoodsVO(String head_code) {
		this.head_code = head_code;
	}
	
	
	private Integer rnum;
	private String goods_code;
	private String head_code;
	private String goods_nm;
	private String goods_cl_code;
	private Integer goods_suply_pc;
	private String goods_reci;
	private String goods_upde;
	private String goods_dc;
	private Integer goods_basepc;
	private String special_at;
	private String sale_at;
	private String com_code_nm;
	private String att_fileno;
	
	private int startAtt;
	private int[] delAttSeq;
	
	private List<HeadGoodsVO> headGoodsListVO;
	private List<AttachfileVO> attachfileList;
	private MultipartFile[] prod_files;
	
	public void setProd_files(MultipartFile[] prod_files) {
		this.prod_files = prod_files;
		if(prod_files!=null) {
			List<AttachfileVO> attatchList = new ArrayList<>();
			for(MultipartFile file : prod_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachfileVO(file));
			}
			if(attatchList.size()>0)
				this.attachfileList = attatchList;
		}
	}
}






































