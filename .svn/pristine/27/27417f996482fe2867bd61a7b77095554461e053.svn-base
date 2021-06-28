package kr.or.ddit.cfms.utils;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;

/**
 * @author 이진수
 * @since 2021. 6. 5
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public class ImageBase64Util {
	public void imageBase(List<AttachfileVO> attachFileListVO) {
		InputStream imageStream;
		if(attachFileListVO.size() > 0 || !attachFileListVO.isEmpty()) {
			
			for(AttachfileVO attach : attachFileListVO) {
				if(attach.getAtt_fileno() == null) continue; 
				try {
					
					/** 썸네일 이미지 */ 
					
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path()+"/"+attach.getSave_filenm());
					// IOUtils.toByteArray 바이트배열로 바꿔서 저장
					byte[] imageBtyeArray = IOUtils.toByteArray(imageStream);
					imageStream.close();
					// 이진데이터로 바꾼다
					// 바이트배열을 Base64.encodeBase64형식에 맞춰서 인코딩 하는 작업
					byte[] encodeBase64 = Base64.encodeBase64(imageBtyeArray);
					// 인코딩 된 데이터를 보내준다.
					String base64DataString = new String(encodeBase64, "UTF-8");
					// file_img저장될때는 사용되는게 아니고 이미지를 표현할떄 사용된다.
					attach.setFile_img(base64DataString);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
		}
	}
}
