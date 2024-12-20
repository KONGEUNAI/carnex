package org.member.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCDriverTest {

	@Test // JUnit 단위 테스트 메소드임을 지정한다.
	public void testJdbcDriver() {
		
		Connection conn;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			// JDBC Driver를 찾아서 메모리에 로드한다.
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/storage", "dba", "dbapwd");
			System.out.println("JDBC 연결 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}










