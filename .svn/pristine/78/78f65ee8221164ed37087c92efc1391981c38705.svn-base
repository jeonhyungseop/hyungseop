package kr.or.ddit.cfms.fran.trade.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class TradeSearchVO implements Serializable{
	private Integer page;
	private Integer screenSize;
	private String searchType;
	private String searchWord;
	private String minDate;
	private String maxDate;
	private String orsCode;
	private String oscCode;
	private String istCode;

	public TradeSearchVO() {
		super();
		this.page = 1;
		this.screenSize = 10;
	}
	
	public void setPage(Integer page) {
		if(page == null ||  page == 0 ) {
			this.page = 1;
		}else {
			this.page = page;
		}
	}
	public void setScreenSize(Integer screenSize) {
		if(screenSize == null ||  screenSize == 0 ) {
			this.screenSize = 10;
		}else {
			this.screenSize = screenSize;
		}
	}
}
