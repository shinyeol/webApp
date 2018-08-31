package board.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardDTO;
import sqlmap.MybatisManager;

public class BoardDAO {
	
	public List<BoardDTO> list(Map<String, Object> map) {
		List<BoardDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("board.list", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void insert(BoardDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("board.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public String getFileName(int num) {
		String result = "";
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("board.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return result;
	}

	public void plusDown(int num) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.plusDown", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
	}

	public BoardDTO view(int num) {
		SqlSession session = null;
		BoardDTO dto = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("board.view", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return dto;
	}
	
	public BoardDTO viewReplace(int num) {
		SqlSession session = null;
		BoardDTO dto = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("board.view", num);
			String content = dto.getContent();
			content = content.replace("<", "&lt;");
			content = content.replace(">", "&gt;");
			content = content.replace("\n", "<br>");
			content = content.replace("  ", "&nbsp;&nbsp;");
			dto.setContent(content);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return dto;
	}

	public void plusReadcount(int num, HttpSession count_session) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			long read_time = 0;
			if(count_session.getAttribute("read_time_"+num) != null) {
				read_time = (long)count_session.getAttribute("read_time_"+num);
			}
			
			long current_time = System.currentTimeMillis();
			if(current_time - read_time > 24 * 60 * 60 * 1000) {
				session.update("board.plusReadcount", num);
				session.commit();
				count_session.setAttribute("read_time_"+num, current_time);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
	}

	public boolean passwdCheck(int num, String passwd) {
		boolean result = false;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			BoardDTO dto = new BoardDTO();
			dto.setNum(num);
			dto.setPasswd(passwd);
			int count = session.selectOne("board.passwdCheck", dto);
			
			if(count == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}

	public void update(BoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.update", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public void delete(int num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.delete", num);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public int getComment_count(int num) {
		SqlSession session = null;
		int comment_count = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			comment_count = session.selectOne("board.comment_count", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return comment_count;
	}

	public void updateStep(int ref, int re_step) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			BoardDTO dto = new BoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("board.updateStep", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public void reply(BoardDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("board.reply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public int getRef_count(int num) {
		SqlSession session = null;
		int comment_count = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			comment_count = session.selectOne("board.ref_count", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return comment_count;
	}

	public void hidden(int num) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.hidden", num);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public List<BoardDTO> searchList(Map<String, String> map) {
		List<BoardDTO> list = null;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			list = session.selectList("board.searchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getBoardCount(String b_type) {
		int result = 0;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			result = session.selectOne("board.board_count", b_type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int searchCount(Map<String, String> map) {
		int result = 0;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			result = session.selectOne("board.search_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int myBoardCount(String writer) {
		int result = 0;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			result = session.selectOne("board.myBoardCount", writer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<BoardDTO> myBoardList(String writer) {
		List<BoardDTO> list = null;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			list = session.selectList("board.myBoardList", writer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
