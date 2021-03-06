package kr.or.ddit.cfms.head.royal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import kr.or.ddit.cfms.head.royal.dao.IHeadRoyalDAO;

@Component
public class RoyalUpdateJob {
	private static final Logger logger =
			LoggerFactory.getLogger(RoyalUpdateJob.class);
	
	@Inject
	private IHeadRoyalDAO dao;
	
	@Scheduled(cron = "0 30 9 * * ?")
	public void update() {
		Map<String, Object> pMap = new HashMap<>();
		List<String> headCodeList = dao.selectheadcode();
		Integer totalCount = 0;
		for(String code : headCodeList) {
			pMap = new HashMap<>();
			pMap.put("code", code);
			dao.updateRoyalJob(pMap);
			Integer updCount = (Integer) pMap.get("updcount");
			logger.info(code+"에서 "+updCount+"개가 실행됨");
			totalCount += updCount;
		}
		logger.info("가맹비 업데이트 스케줄러가 동작했고, {}(개)가 변경되었음", totalCount);
	}
}
