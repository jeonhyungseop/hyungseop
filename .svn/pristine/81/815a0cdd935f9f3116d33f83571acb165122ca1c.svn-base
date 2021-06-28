package kr.or.ddit.cfms.head.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.head.inven.controller.HeadInvenController;
import kr.or.ddit.cfms.head.notice.service.IHeadNoticeService;

@Controller
@RequestMapping("/head/notice")
public class HNoticeFileController {
	private static final Logger logger = LoggerFactory.getLogger(HNoticeFileController.class);
	@Inject
	private WebApplicationContext container;
	private ServletContext application;

	@Inject
	private IHeadNoticeService service;

	@Value("#{appInfo['boardImages']}")
	private String saveFolderURL;
	private File saveFolder;

	@PostConstruct
	public void init() {
		application = container.getServletContext();
		String saveFolderPath = application.getRealPath(saveFolderURL);
		saveFolder = new File(saveFolderPath);
	}

	@RequestMapping(value = "/boardImage", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> imageUpload(@RequestPart("upload") MultipartFile upload)
			throws IllegalStateException, IOException {
		Map<String, Object> resultMap = new HashMap<>();
		if (!upload.isEmpty()) {
			String saveName = UUID.randomUUID().toString();
			upload.transferTo(new File(saveFolder, saveName));
			int uploaded = 1;
			String fileName = upload.getOriginalFilename();
			String url = application.getContextPath() + saveFolderURL + "/" + saveName;
			resultMap.put("uploaded", uploaded);
			resultMap.put("fileName", fileName);
			resultMap.put("url", url);
		}
		return resultMap;
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.POST)
	public String download(
//		@RequestParam("what") String att_no
		@ModelAttribute("attach") AttachfileVO attachfileVO	
		, Model model
	){
		logger.info("파일아 나와라잇{}", attachfileVO);
		AttachfileVO attatch = service.download(attachfileVO);
		model.addAttribute("attatch", attatch);
		return "downloadView";
	}

}
