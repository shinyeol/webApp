package member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import crypt.BCrypt;
import member.dto.MemberDTO;
import sqlmap.MybatisManager;

public class MemberDAO {
	
	public List<MemberDTO> memberList(Map<String, Integer> map) {
		List<MemberDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("member.list", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	
	public String loginCheck(MemberDTO dto) {
		SqlSession session = null;
		String result = "";
		
		try {
			session = MybatisManager.getInstance().openSession();
			MemberDTO dtoResult = session.selectOne("member.loginCheck", dto);
			
			if(dtoResult != null) {			
				String passwd = dtoResult.getPasswd();
				
				if(passwd != null) {
					if(BCrypt.checkpw(dto.getPasswd(), passwd)) {
						result = dtoResult.getName();
					} else {
						result = "";
					}
				} else {
					result = "";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return result;
	}
	
	public MemberDTO view(String id) {
		SqlSession session = null;
		MemberDTO dto = null;

		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("member.view", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return dto;
	}
	
	public void insert(MemberDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("member.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public void update(MemberDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("member.update", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public void delete(String id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("member.delete", id);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public int getMemberCount() {
		int result = 0;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			result = session.selectOne("member.member_count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String idCheck(MemberDTO dto) {
		SqlSession session = null;
		String id = "";
		
		try {
			session = MybatisManager.getInstance().openSession();
			id = session.selectOne("member.idCheck", dto);
			
			if(id == null) {
				id = "";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return id;
	}

	public String passwdCheck(MemberDTO dto) {
		SqlSession session = null;
		String id = "";
		
		try {
			session = MybatisManager.getInstance().openSession();
			id = session.selectOne("member.passwdCheck", dto);
			
			if(id == null) {
				id = "";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return id;
	}

	public void updatePasswd(MemberDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("member.updatePasswd", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
		
}
