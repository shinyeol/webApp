package boardComment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import boardComment.dto.BoardCommentDTO;
import sqlmap.MybatisManager;

public class BoardCommentDAO {
	
	public List<BoardCommentDTO> list(int num) {
		List<BoardCommentDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("boardComment.list", num);
			
			for(BoardCommentDTO dto : list) {
				String content = dto.getContent();
				content = content.replace("<", "&lt;");
				content = content.replace(">", "&gt;");
				content = content.replace("\n", "<br>");
				content = content.replace("  ", "&nbsp;&nbsp;");
				
				dto.setContent(content);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void commentAdd(BoardCommentDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("boardComment.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void delete(int num) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("boardComment.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}
	
	public boolean passwdCheck(int comment_num, String passwd) {
		boolean result = false;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			BoardCommentDTO dto = new BoardCommentDTO();
			dto.setComment_num(comment_num);
			dto.setPasswd(passwd);
			int count = session.selectOne("boardComment.passwdCheck", dto);
			
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

	public BoardCommentDTO view(int comment_num) {
		SqlSession session = null;
		BoardCommentDTO dto = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("boardComment.view", comment_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return dto;
	}

	public List<BoardCommentDTO> getComment_num(int num) {
		List<BoardCommentDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("boardComment.getComment_num", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void deleteAll(BoardCommentDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("boardComment.deleteAll", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
}
