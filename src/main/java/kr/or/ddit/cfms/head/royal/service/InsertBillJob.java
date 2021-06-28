package kr.or.ddit.cfms.head.royal.service;

import java.util.HashMap;
import java.util.Map;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import kr.or.ddit.cfms.head.royal.dao.IHeadRoyalDAO;

@Component
public class InsertBillJob {
	private static final Logger logger =
			LoggerFactory.getLogger(InsertBillJob.class);
	
	@Inject
	private IHeadRoyalDAO dao;
	
	@Scheduled(cron = "0 0 10 1 * ?")
	public void insert() {
		Map<String, Object> pMap = new HashMap<>();
		dao.insertBillJob(pMap);
		Integer insCount = (Integer) pMap.get("inscount");
		logger.info("가맹비 수납 내역 추가 스케줄러가 동작했고, {}(개)가 추가되었음", insCount);
	}
}
