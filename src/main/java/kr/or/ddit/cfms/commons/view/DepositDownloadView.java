package kr.or.ddit.cfms.commons.view;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;

public class DepositDownloadView extends AbstractView {
	private static final Logger logger =
			LoggerFactory.getLogger(DepositDownloadView.class);

	@Value("#{appInfo.attatch}")
	private File saveFolder;
	
	@PostConstruct
	public void init() {
		logger.info("{} 초기화, {} 주입됨."
				, getClass().getSimpleName()
				, saveFolder.getAbsolutePath());
	}
	
	
	@Override
	protected void  renderMergedOutputModel(Map<String, Object> model
			, HttpServletRequest req,
			HttpServletResponse resp
			) throws Exception {
		
		logger.info("{}", model.toString());
		
		String tableName = (String)model.get("tableName");
		List<HeadsmnVO> headExcelData = null;
		List<FrdsmnVO> franExcelData = null;
		if(tableName.equals("TB_HEADQUARTERS")) {
			headExcelData =  (List<HeadsmnVO>) model.get("excelDataList");
		}else {
			franExcelData = (List<FrdsmnVO>) model.get("excelDataList");
		}
		
		
		// 워크북 생성
				Workbook wb = new HSSFWorkbook();
				Sheet sheet = wb.createSheet("예치금 조회 내역");
				Row row = null;
				Cell cell = null;
				int rowNo = 0;

				// 테이블 헤더용 스타일
				CellStyle headStyle = wb.createCellStyle();

				// 가는 경계선을 가집니다.
				headStyle.setBorderTop(BorderStyle.THIN);
				headStyle.setBorderBottom(BorderStyle.THIN);
				headStyle.setBorderLeft(BorderStyle.THIN);
				headStyle.setBorderRight(BorderStyle.THIN);

				// 배경색은 노란색입니다.
				headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
				headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

				// 데이터는 가운데 정렬합니다.
				headStyle.setAlignment(HorizontalAlignment.CENTER);

				// 데이터용 경계 스타일 테두리만 지정
				CellStyle bodyStyle = wb.createCellStyle();
				bodyStyle.setBorderTop(BorderStyle.THIN);
				bodyStyle.setBorderBottom(BorderStyle.THIN);
				bodyStyle.setBorderLeft(BorderStyle.THIN);
				bodyStyle.setBorderRight(BorderStyle.THIN);

				// 헤더 생성
				row = sheet.createRow(rowNo++);
				cell = row.createCell(0);
				cell.setCellStyle(headStyle);
				cell.setCellValue("날짜");
				cell = row.createCell(1);
				cell.setCellStyle(headStyle);
				cell.setCellValue("시간");
				cell = row.createCell(2);
				cell.setCellStyle(headStyle);
				cell.setCellValue("상태");
				cell = row.createCell(3);
				cell.setCellStyle(headStyle);
				cell.setCellValue("금액");
				cell = row.createCell(4);
				cell.setCellStyle(headStyle);
				cell.setCellValue("잔액");

				// 데이터 부분 생성
				
				if(tableName.equals("TB_HEADQUARTERS")) {
					
					for (HeadsmnVO vo : headExcelData) {
						row = sheet.createRow(rowNo++);
						cell = row.createCell(0);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getYymmdd());
						cell = row.createCell(1);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getHh24mi());
						cell = row.createCell(2);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getDsmn_rcppay_se());
						cell = row.createCell(3);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getDsmn_mvmoney());
						cell = row.createCell(4);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getDsmn_blce());
					}
					
				}else {
					for (FrdsmnVO vo : franExcelData) {
						row = sheet.createRow(rowNo++);
						cell = row.createCell(0);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getYymmdd());
						cell = row.createCell(1);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getHh24mi());
						cell = row.createCell(2);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getDsmn_rcppay_se());
						cell = row.createCell(3);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getDsmn_mvmoney());
						cell = row.createCell(4);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(vo.getDsmn_blce());
					}
				}
				ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
				wb.write(outByteStream);
				byte [] outArray = outByteStream.toByteArray();
				
				String agent = req.getHeader("User-Agent");
				
				File saveFile = new File(saveFolder, "excel.xls");
				
				String filename = "excel.xls";


				resp.setHeader("Content-Disposition", "attatchment;filename=\""+filename+"\"");
				resp.setHeader("Content-Length", outArray.length +"");
				resp.setContentType("application/ms-excel");
				try(
					ServletOutputStream  os = resp.getOutputStream();	
				){
					wb.write(os);	
					logger.info(os.toString());
					wb.close();
					os.close();
				}

				


	}

}
