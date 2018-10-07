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
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); // sqlSessionFactory 빌더에 의해 만들어짐 만드는 공장.  config 에서 read함 db정보를 
			
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
