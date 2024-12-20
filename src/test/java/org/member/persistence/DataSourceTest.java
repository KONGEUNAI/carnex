package org.member.persistence;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
// @RunWith 애너테이션은 JUnit 테스트를 진행할 때 추가로 실행하는 클래스를 지정한다.
// SpringJUnit4ClassRunner.class는 @ContextConfiguration로 설정한 파일을 실행한다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// @ContextConfiguration는 실행할 파일을 지정한다.
// Run on Server로 스프링 프로젝트를 실행할 경우 ①web.xml 실행 > ②root-context.xml 실행 > ③servlet-context.xml 실행
// JUnit Test로 단위 테스트 메소드로 지정된 메소드를 실행한다. 따라서 root-context.xml을 강제로 실행해야한다.
public class DataSourceTest {
	
	@Inject
	private DataSource dataSource; // 데이터베이스 연결을 관리하는 빈이다.
	// @Inject 애너테이션으로 스프링에 등록된 DataSource 빈을 주입한다.
	
	@Test // JUnit 단위 테스트 메소드임을 지정한다.
	public void testDataSource() {
		Connection conn = null;
		
		try {
			conn = dataSource.getConnection();
			System.out.println("root-context.xml에서 DataSource 객체를 생성하여 스프링 빈으로 등록 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}













