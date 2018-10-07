package sist.com.dao;

import java.io.Reader;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ibatis.common.resources.Resources;

public class SqlSessionFactoryManager {

	private static SqlSessionFactory sqlSessionFactory;
	static{
		try {
			
			Reader reader = Resources.getResourceAsReader("sist/com/dao/Config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); // sqlSessionFactory ������ ���� ������� ����� ����.  config ���� read�� db������ 
			
		} catch (Exception e) {
			System.out.println("sqlSessionFactory Error---");
			// TODO: handle exception
			e.printStackTrace();
			
		}
	}
	//static
		public static SqlSessionFactory getSqlSessionFactory() {
			return sqlSessionFactory;
		}
}
