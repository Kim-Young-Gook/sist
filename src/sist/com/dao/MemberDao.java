package sist.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.bean.Member;
import sist.com.bean.ZipCodeBean;


public class MemberDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	public static boolean idCheck(String id) {
		System.out.println("memberdaoID"+id);
		String dbId = sqlSessionFactory.openSession().selectOne("idCheck",id);
		System.out.println("memberDao:"+dbId);
		return dbId == null ? false : true;
	}
	
	public static List<ZipCodeBean> selectZipCode(String dong){
		System.out.println("memberdaoDONG:"+dong);
		return sqlSessionFactory.openSession().selectList("selectZipCode", dong);
		
	}
	
	public static void insertMember(Member member) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			System.out.println("insetMember:"+member);
			sqlSession.insert("insertMember", member);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) {
				sqlSession.close();
			}
		}
		
	}
	public static Integer getSequence() {
		return sqlSessionFactory.openSession().selectOne("getSequence2");
	}
	
	
	
	public static boolean loginCheck(String id,String pass) {
		SqlSession sqlSession;
		try {
			sqlSession = sqlSessionFactory.openSession();
			String dbpass = sqlSession.selectOne("loginCheck",id);
			if(dbpass!=null && dbpass.equals(pass)) {
				System.out.println(dbpass);
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
}
