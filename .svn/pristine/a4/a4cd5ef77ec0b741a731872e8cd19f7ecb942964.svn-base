package kr.or.ddit.cfms.fran.prod.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 이진수
 * @since 2021. 6. 1
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 1      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FranProdVO implements Serializable{
	private String prod_code;
	private String prod_cl_code;
	private String prod_nm;
	private String prod_unit_code;
	private Integer prod_unit_qy;
	private String prod_brcd;
	private Integer prod_puchas_pc;
	private Integer prod_suply_pc;
	private String memo;
	private String prod_mafanm;
	private String att_fileno;
	
	private List<AttachfileVO> attachfileList;
	private MultipartFile[] prod_files;
	public void setInven_files(MultipartFile[] prod_files) {
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
