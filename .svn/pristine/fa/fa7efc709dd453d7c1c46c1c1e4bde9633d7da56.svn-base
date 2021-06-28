package kr.or.ddit.cfms.head.inven.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.prod.vo.HeadProdVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 이진수
 * @since 2021. 5. 21
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
public class HeadInvenVO implements Serializable{
	
	public HeadInvenVO() {}
	public HeadInvenVO(String head_code) {this.head_code = head_code;}
	public HeadInvenVO(String head_code, String prod_code) {
		this.head_code = head_code;
		this.prod_code = prod_code;
	}
	private String prod_code;
	private String head_code;
	private Integer head_maxcord_qy;
	private Integer head_proinven;
	private Integer head_nowinven;
	private String head_memo;
	private String prod_cl_code;
	private String prod_cl_nm;
	private String prod_nm;
	private String prod_unit_code;
	private String prod_unit_nm;
	private Integer prod_unit_qy;
	private String prod_brcd;
	private Integer prod_puchas_pc;
	private Integer prod_suply_pc;
	private String prod_memo;
	private String prod_mafanm;
	private String prod_use_at;
	private String att_fileno;
	private Integer in_qy;
	
	private int startAtt;
	private int[] delAttSeq;
	
	private HeadProdVO headProdVO;
	
	private List<AttachfileVO> attachfileList;
	private MultipartFile[] inven_files;
	public void setInven_files(MultipartFile[] inven_files) {
		this.inven_files = inven_files;
		if(inven_files!=null) {
			List<AttachfileVO> attatchList = new ArrayList<>();
			for(MultipartFile file : inven_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachfileVO(file));
			}
			if(attatchList.size()>0)
				this.attachfileList = attatchList;
		}
	}
	
	
}
