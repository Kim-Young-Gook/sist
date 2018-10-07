package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.bean.AirSchedule;

public class AirAdFilDao {

	
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory=SqlSessionFactoryManager.getSqlSessionFactory();	
	}
	
	
	public static List<AirSchedule>selectScheduleFil(HashMap<String, Object>map){	
		return sqlSessionFactory.openSession().selectList("selectScheduleFil",map);
	}
	
	
	public static void insertSchedule(AirSchedule scheduleBean) {
		System.out.println("MAPPER=> INSERT");
		SqlSession sqlSession=null;
		try {
			sqlSession= sqlSessionFactory.openSession();
			sqlSession.insert("insertSchedule",scheduleBean);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
	}
	
		
	public static Object selectScheduleInfo(int sNo) {
		return sqlSessionFactory.openSession().selectOne("selectScheduleInfo", sNo);
	}
	
	
	public static void modifySchedule(String modifysNo,AirSchedule schedule ) {
		int modifyNo = Integer.parseInt(modifysNo);
		System.out.println("MAPPER=> MODIFY");	
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("modifySchedule", schedule);
			sqlSession.commit();
		} catch (Exception e) {	
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	
	}
}
