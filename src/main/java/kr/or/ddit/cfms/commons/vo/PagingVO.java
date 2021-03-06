package kr.or.ddit.cfms.commons.vo;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
@Setter
@Getter
@NoArgsConstructor
public class PagingVO<T> implements Serializable{
	
	public PagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	
	public PagingVO(int screenSize, int blockSize, int currentPage) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
//		this.currentPage = currentPage;
		
		this.currentPage = currentPage;
		startRow = (currentPage - 1)*this.screenSize + 1;
		endRow = currentPage * this.screenSize;
		endPage = (currentPage+(this.blockSize-1))/this.blockSize * this.blockSize;
		startPage = endPage - (this.blockSize - 1);
	}
	
	public PagingVO(int screenSize, int blockSize, int currentPage, Object searchVO) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
		
		this.currentPage = currentPage;
		startRow = (currentPage - 1)*this.screenSize + 1;
		endRow = currentPage * this.screenSize;
		endPage = (currentPage+(this.blockSize-1))/this.blockSize * this.blockSize;
		startPage = endPage - (this.blockSize - 1);
		
		Map<String, Object> searchField = new HashMap<>();
		try {
			for(Field field : searchVO.getClass().getDeclaredFields()) {
				field.setAccessible(true);
				Object value = field.get(searchVO);
				searchField.put(field.getName(), value);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		this.searchMap = searchField;
	}

	private int totalRecord;
	private int screenSize = 10;
	private int blockSize = 5;
	private int currentPage;
	
	private int totalPage;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	private List<T> dataList;
	private String head_code;
	private String fran_code;
	private String emp_id;
	private SearchVO simpleSearch;
	
	private T detailSearch;
	
	private int depositBlce;
	
	private Map<String, Object> searchMap = new HashMap<>();
	

	
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = totalRecord % screenSize == 0 ?
							totalRecord/screenSize :
							totalRecord/screenSize + 1;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		startRow = (currentPage - 1)*screenSize + 1;
		endRow = currentPage * screenSize;
		endPage = (currentPage+(blockSize-1))/blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
	}
	
	private static String aPattern = "<a href='#' data-page='%d'>[%s]</a>";
	private static String currentPagePtrn= "<a href='#'>[%s]</a>";
	
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		if(startPage > 1) {
			html.append(
				String.format(aPattern, (startPage-1), "<")	
			);
		}
		endPage = endPage < totalPage ? endPage : totalPage;
		for(int page=startPage; page<=endPage; page++) {
			if(page==currentPage) {
				html.append(
					String.format(currentPagePtrn, page+"")	
				);
			}else {
				html.append(
					String.format(aPattern, page, page+"")	
				);
			}
		}
		if(endPage < totalPage) {
			html.append(
				String.format(aPattern, (endPage + 1), ">")	
			);
		}
		return html.toString();
	}
	private static String pageItem = "<li class='page-item %s' %s>"
			+"<a class='page-link' href='#' data-page='%d'>%s</a>"
			+ "</li>";

	public String getPagingHTMLBS() {
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='...' class='mt-3'>");
		html.append("<ul class='pagination pagination-primary dataTable-pagination'>");
		String first = null;
		String second = null;
		int third = -1;
		String fourth = "<";
		if(startPage > 1) {
			first = "";
			second = "";
			third = startPage - 1;
		}else {
			first ="disabled";
			second = "tabindex='-1' aria-disabled='true'";
			third = -1;
		}
		html.append(
			String.format(pageItem, first, second, third, fourth)	
		);
		endPage = endPage < totalPage ? endPage : totalPage;
		for(int page=startPage; page<=endPage; page++) {
			second = "";
			third = page;
			fourth = page + "";
			if(page==currentPage) {
				first = "active";
			}else {
				first = "";
			}
			html.append(
				String.format(pageItem, first, second, third, fourth)	
			);
		}
		fourth = ">";
		if(endPage < totalPage) {
			first = "";
			second = "";
			third = endPage + 1;
		}else {
			first ="disabled";
			second = "tabindex='-1' aria-disabled='true'";
			third = -1;
		}
		html.append(
			String.format(pageItem, first, second, third, fourth)	
		);
		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}

	public void addSearchMap(String key, String searchType) {
		// TODO Auto-generated method stub
		if(searchMap == null){
			searchMap = new HashMap<>();
		}
		searchMap.put(key, searchType);
	}
}