package kr.or.ddit.cfms.head.limit.vo;

import java.io.Serializable;
import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.fran.prod.vo.FranProdVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 배수진
 * @since 2021. 6. 10
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 10      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class InlistVO implements Serializable, SQLData{
	private Integer in_seq;
	private String prod_code;
	private String in_no;
	private Integer in_qy;
	private Integer rnum;
	
	private String fran_code;
	private FranProdVO prodVO;
	private HeadInvenVO headInvenVO;
	private FranInvenVO franInvenVO;
	
	private static String sqlTypeName = "TY_INLISTVO";
	
	public static String getSqlTypeName() {
		return sqlTypeName;
	}
	
	@Override
	public String getSQLTypeName() throws SQLException {
		return sqlTypeName;
	}
	@Override
	public void readSQL(SQLInput stream, String typeName) throws SQLException {
		sqlTypeName = typeName;
		
		prod_code = stream.readString();
		fran_code= stream.readString();
		in_no = stream.readString();
		in_seq = stream.readInt();
		in_qy = stream.readInt();
	}
	@Override
	public void writeSQL(SQLOutput stream) throws SQLException {
		stream.writeString(prod_code);
		stream.writeString(fran_code);
		stream.writeString(in_no);
		stream.writeInt(in_seq);
		stream.writeInt(in_qy);
		
	}
}
