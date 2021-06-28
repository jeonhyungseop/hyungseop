package kr.or.ddit.cfms.head.notice.view;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;

public class HeadDownloadView extends AbstractView {
	private static final Logger logger =
			LoggerFactory.getLogger(HeadDownloadView.class);


	@Value("#{appInfo.adminNotice}")
	private String attatchPath;
	
	private String saveFolder;
	private File folder;
	
	@PostConstruct
	public void init() {
		folder = new File(attatchPath);
		saveFolder = folder.getAbsolutePath();
		logger.info("{} 초기화, {} 주입됨."
				, getClass().getSimpleName()
				, folder.getAbsolutePath()
				,folder
			);
		if(!folder.exists()) {
			folder.mkdirs();
		}
	}
	
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model
			, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		
		AttachfileVO attatch = (AttachfileVO) model.get("attatch");
		String agent = req.getHeader("User-Agent");
		
		File saveFile = new File(saveFolder, attatch.getSave_filenm());
		
		String filename = attatch.getFile_nm();
		if(StringUtils.containsIgnoreCase(agent, "trident")) {
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
		}else {
			byte[] bytes = filename.getBytes();
			filename = new String(bytes, "ISO-8859-1");
		}
		resp.setHeader("Content-Disposition", "attatchment;filename=\""+filename+"\"");
		resp.setHeader("Content-Length", attatch.getFile_size()+"");
		resp.setContentType("application/octet-stream");
		try(
			OutputStream os = resp.getOutputStream();	
		){
			FileUtils.copyFile(saveFile, os);
		}

	}

}
