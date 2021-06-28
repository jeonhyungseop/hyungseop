package kr.or.ddit.cfms.commons.vo;

import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
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
@EqualsAndHashCode(of="att_fileno")
@NoArgsConstructor
@AllArgsConstructor
public class AttachfileVO {
	private transient MultipartFile file;
	
	public AttachfileVO(MultipartFile file) {
		super();
		this.file = file;
		this.file_nm = file.getOriginalFilename();
		this.save_filenm = UUID.randomUUID().toString();
		this.file_type = file.getContentType();
		this.file_size = file.getSize();
	}
	
	private String att_fileno;
	private Integer att_seq;
	private String biz_se;
	private String file_path;
	private String file_nm;
	private String save_filenm;
	private String file_type;
	private Long file_size;
	private String updatetime;
	private String updateuser_id;
	private String updtime;
	private String upduser_id;
	
	private String file_img;
	
	private int del_att_seq;
	
//	public void saveTo(File saveFolder) throws IOException {
//		file.transferTo(new File(saveFolder.getAbsolutePath(), save_filenm));
//	}
	public void saveTo(String saveFolder) throws IOException {
		file.transferTo(new File(saveFolder, save_filenm));
	}
}
