package kr.or.ddit.cfms.head.limit.vo;

import java.io.Serializable;
import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

import kr.or.ddit.cfms.fran.prod.vo.FranProdVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 배수진
 * @since 2021. 6. 9
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OutlistVO implements Serializable, SQLData {
	private Integer out_seq;
	private String prod_code;
	private String out_code;
	private Integer out_qy;
	
	private String head_code;
	private String fran_code;
	
	private Integer rnum;
	private FranProdVO prodVO;
	
	private static String sqlTypeName = "TY_OUTLISTVO";
	
	public static String getSqlTypeName() {
		return sqlTypeName;
	}
	
	//SQLData implemnts method
	@Override
	public String getSQLTypeName() throws SQLException {
		return sqlTypeName;
	}
	@Override
	public void readSQL(SQLInput stream, String typeName) throws SQLException {
		sqlTypeName = typeName;
		
		prod_code = stream.readString();
		out_qy = stream.readInt();
		head_code = stream.readString();
		fran_code = stream.readString();
		out_code = stream.readString();
		out_seq = stream.readInt();
		
	}
	@Override
	public void writeSQL(SQLOutput stream) throws SQLException {
		stream.writeString(prod_code);
		stream.writeInt(out_qy);
		stream.writeString(head_code);
		stream.writeString(fran_code);
		stream.writeString(out_code);
		stream.writeInt(out_seq);
	}
	
}
