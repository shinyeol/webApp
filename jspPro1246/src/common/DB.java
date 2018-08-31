package common;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DB {
	
	public static Connection getConn() {
		DataSource ds=null;
		Connection conn=null;
		try {
			//context.xml 파일을 분석하는 객체
			Context context = new InitialContext();
			//context.xml 파일의 Resource 태그의 name 속성 검색
			//java:comp/env/리소스태그의 name
			ds=(DataSource)context.lookup("java:comp/env/jdbc/OracleDB");
			//커넥션풀에서 커넥션을 리턴받음
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
