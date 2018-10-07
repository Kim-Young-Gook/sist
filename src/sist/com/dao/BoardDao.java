package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.bean.Board;

public class BoardDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	public static List<Board> selectBoard(HashMap<String, Object> map) {
		return sqlSessionFactory.openSession().selectList("selectBoard", map);
	}

	public static Integer getSequence() {
		Integer seq = 0;
		System.out.println(seq);
		try {
			seq = (Integer)sqlSessionFactory.openSession().selectOne("getSequence");
		} catch (Exception e) {
			e.printStackTrace();
			seq = 99;
		}
		System.out.println(seq);
		return seq;
	}
	
	public static Object selectInfoBoard(int no) {
		return sqlSessionFactory.openSession().selectOne("selectInfoBoard", no);
	}

	public static int getTotalRow(HashMap<String, Object> map) {
		return sqlSessionFactory.openSession().selectOne("getTotalRow", map);
	}

	public static void updateHit(int no) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("updateHit", no);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	public static void updateBoard(Board board) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("updateBoard", board);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	public static void updateStep(Board board) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("updateStep", board);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

	}

	public static void updateReply(Board board) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("updateReply", board);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public static void insertBoard(Board board) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("insertBoard", board);

			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	public static String getPassWord(int no) {
		return sqlSessionFactory.openSession().selectOne("getPassWord", no);
	}
	public static void deleteBoard(Board board) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("deleteBoard", board);

			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}
}
