package kr.or.ddit.cfms.head.limit.controller;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbcp2.DelegatingConnection;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import kr.or.ddit.cfms.head.limit.vo.OutlistVO;
import net.sf.log4jdbc.ConnectionSpy;
import oracle.jdbc.driver.OracleConnection;

public class OutlistVOArrayTypeHandler extends BaseTypeHandler<OutlistVO[]>{
	
	private void setTypeMap(Statement stmt, String jdbcTypeName, Class<?> mappedType) throws SQLException {
		Connection conn = stmt.getConnection();
		Map<String, Class<?>> typeMap = conn.getTypeMap();
		typeMap.put(jdbcTypeName, mappedType);
		conn.setTypeMap(typeMap);
	}


	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, OutlistVO[] parameter, JdbcType jdbcType)
			throws SQLException {
		DelegatingConnection<Connection> pooledConn = (DelegatingConnection<Connection>) ps.getConnection();
		ConnectionSpy connectionSpy = (ConnectionSpy) pooledConn.getInnermostDelegateInternal();
		OracleConnection conn = (OracleConnection) connectionSpy.getRealConnection();
		Array array = conn.createARRAY("TY_ARRAY_OUTLIST", parameter);
		ps.setArray(i, array);
	}

	@Override
	public OutlistVO[] getNullableResult(ResultSet originRs, String columnName) throws SQLException {
		setTypeMap(originRs.getStatement(), OutlistVO.getSqlTypeName(), OutlistVO.class);
		Array array = originRs.getArray(columnName);
//		// array 에 각 요소에 대해 접근하기 위한 set 이며, 두개의 컬럼으로 구성됨 첫번째 컬럼:인덱스, 두번째 컬럼:요소값
		ResultSet rs = array.getResultSet();
		List<OutlistVO> tmpList = new ArrayList<>();
		while(rs.next()){
			 tmpList.add((OutlistVO)rs.getObject(2));
		}
		return (OutlistVO[]) tmpList.toArray(new OutlistVO[tmpList.size()]);
	}

	@Override
	public OutlistVO[] getNullableResult(ResultSet originRs, int columnIndex) throws SQLException {
		setTypeMap(originRs.getStatement(), OutlistVO.getSqlTypeName(), OutlistVO.class);
		Array array = originRs.getArray(columnIndex);
//		// array 에 각 요소에 대해 접근하기 위한 set 이며, 두개의 컬럼으로 구성됨 첫번째 컬럼:인덱스, 두번째 컬럼:요소값
		ResultSet rs = array.getResultSet();
		List<OutlistVO> tmpList = new ArrayList<>();
		while(rs.next()){
			 tmpList.add((OutlistVO)rs.getObject(2));
		}
		return (OutlistVO[]) tmpList.toArray(new OutlistVO[tmpList.size()]);
	}

	@Override
	public OutlistVO[] getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		setTypeMap(cs, OutlistVO.getSqlTypeName(), OutlistVO.class);
		Array array = cs.getArray(columnIndex);
//		// array 에 각 요소에 대해 접근하기 위한 set 이며, 두개의 컬럼으로 구성됨 첫번째 컬럼:인덱스, 두번째 컬럼:요소값
		ResultSet rs = array.getResultSet();
		List<OutlistVO> tmpList = new ArrayList<>();
		while(rs.next()){
			 tmpList.add((OutlistVO)rs.getObject(2));
		}
		return (OutlistVO[]) tmpList.toArray(new OutlistVO[tmpList.size()]);
	}
}










