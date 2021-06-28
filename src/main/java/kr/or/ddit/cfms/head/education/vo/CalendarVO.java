package kr.or.ddit.cfms.head.education.vo;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
public class CalendarVO implements Serializable{
	private String id;
	private String groupId;
	private Boolean allDay;
	private Date start;
	private Date end;
	private String startStr;
	private String endStr;
	private String title;
	private String url;
	private String[] classNames;
	private Boolean editable;
	private Boolean startEditable;
	private Boolean durationEditable;
	private Boolean resourceEditable;
	private String color;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
}