package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.bean.AirSchedule;

public class LineDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}

	public static Object selectInfoboard(String no) {
		return sqlSessionFactory.openSession().selectOne("selectInfoboard", no);
	}

	public static List<AirSchedule> selectSchedule(HashMap<String, Object> map) {
		return sqlSessionFactory.openSession().selectList("selectSchedule", map);
	}

	public static int getTotalRow(HashMap<String, Object> map) {
		return sqlSessionFactory.openSession().selectOne("getTotalRow3", map);
	}
}
