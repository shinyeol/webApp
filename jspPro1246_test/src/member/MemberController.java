package member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import crypt.BCrypt;
import member.dao.MemberDAO;
import member.dto.MemberDTO;
import page.Pager;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		System.out.println(uri+"접근...");
		String contextPath = request.getContextPath();
		
		MemberDAO dao = new MemberDAO();
		
		if(uri.indexOf("join.do") != -1) {
			String page = "/member/join.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("login.do") != -1) {
			String page = "/member/login.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("sorry.do") != -1) {
			String page = "/admin/sorry.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("board.do") != -1) {
			String page = "/board/board.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("myPage.do") != -1) {
			String page = "/myPage/myPage.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);	
		
		} else if(uri.indexOf("myinfo.do") != -1) {
			String page = "/myPage/myinfo.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);	
		
		} else if(uri.indexOf("memberManage.do") != -1) {
			String page = "/member/memberManage.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);	
		
		} 
		
		// member joinCheck		
		else if(uri.indexOf("joinCheck.do") != -1) {
			String checkBoxChoi = request.getParameter("checkBoxChoi");
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String passwd = BCrypt.hashpw(request.getParameter("passwd"), BCrypt.gensalt());
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String birth = request.getParameter("birth");
			String hp = request.getParameter("hp");
			String addr = request.getParameter("addr");
			String addrDetail = request.getParameter("addrDetail");
			String zip = request.getParameter("zip");
			
			if(sex.equals("male")) {
				sex = "남성";
			} else {
				sex = "여성";
			}
			if(checkBoxChoi!=null) {
				checkBoxChoi = "y";
			} else {
				checkBoxChoi = "n";
			}
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setAgreeAd(checkBoxChoi);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setBirth(birth);
			dto.setHp(hp);
			dto.setSex(sex);
			dto.setAddr(addr);
			dto.setAddrDetail(addrDetail);
			dto.setZip(zip);
			
			System.out.println(dto);
			dao.insert(dto);
			
			request.setAttribute("dto", dto);
			
			String page = "/member/join_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} 
		
		// member loginCheck		
		else if(uri.indexOf("loginCheck.do")!=-1) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			String message = "";
			String page = "";
			
			if(id == "") {
				message = "아이디를 입력해주세요.";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member_servlet/login.do?message="+message;
			} else if(passwd == "") {
				message = "비밀번호를 입력해주세요.";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member_servlet/login.do?message="+message;
			} else {
				MemberDTO dto = new MemberDTO();
				dto.setId(id);
				dto.setPasswd(passwd);
				
				String name = dao.loginCheck(dto);
				
				if(name=="") {
					message = "error";
					message = URLEncoder.encode(message, "utf-8");
					page = "/member_servlet/login.do?message="+message;
				} else {
					System.out.println(name+"님 환영합니다.");
					HttpSession session = request.getSession();
					dto = dao.view(id);
					String email = dto.getEmail();
					String birth = dto.getBirth();
					String hp = dto.getHp();
					String sex = dto.getSex();
					String addr = dto.getAddr();
					String addrDetail = dto.getAddrDetail();
					String zip = dto.getZip();
					String agreeAd = dto.getAgreeAd();
					Date join_date = dto.getJoin_date();
					
					session.setAttribute("agreeAd", agreeAd);
					session.setAttribute("id", id);
					session.setAttribute("email", email);
					session.setAttribute("name", name);
					session.setAttribute("birth", birth);
					session.setAttribute("hp", hp);
					session.setAttribute("sex", sex);
					session.setAttribute("addr", addr);
					session.setAttribute("addrDetail", addrDetail);
					session.setAttribute("zip", zip);
					session.setAttribute("join_date", join_date);
					
					page = "/main/index.jsp";
				}
			}
			response.sendRedirect(contextPath+page);
			
		} 
		
		// myinfo_check 
		else if(uri.indexOf("myinfoCheck.do") != -1) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			System.out.println(id);
			System.out.println(passwd);
			
			String message = "";
			String page = "";
			
			if(passwd == "") {
				message = "비밀번호를 입력해주세요.";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member_servlet/login.do?message="+message;
			} else {
				MemberDTO dto = new MemberDTO();
				dto.setId(id);
				dto.setPasswd(passwd);
				
				String name = dao.loginCheck(dto);
				
				if(name=="") {
					message = "error";
					message = URLEncoder.encode(message, "utf-8");
					page = "/myPage/myinfo.jsp?message="+message;
				} else {
					System.out.println(name+"님 개인정보 수정에 접근");
					page = "/myPage/myinfo_view.jsp";
				}
			}
			response.sendRedirect(contextPath+page);
		}
		
		// member logout		
		else if(uri.indexOf("logout.do")!=-1) {
			System.out.println("로그아웃 접근");
			HttpSession session = request.getSession();
			session.invalidate();
			String message = URLEncoder.encode("logout", "utf-8");
			response.sendRedirect(contextPath+"/member/login.jsp?message="+message);
			
		} 
		
		// member_list		
		else if(uri.indexOf("memberList.do")!=-1) { 
			int curPage = 1;
			int count = dao.getMemberCount();
			
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			
			List<MemberDTO> list = dao.memberList(map);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			request.setAttribute("count", count);
			
			String page = "/member/member_list.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} 
		
		// member_view		
		else if(uri.indexOf("member_view.do") != -1 ) {
			String id = request.getParameter("id");
			MemberDTO dto = dao.view(id);
			request.setAttribute("dto", dto);
			String page="/member/member_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// member_update
		else if(uri.indexOf("member_update.do") != -1) {
			System.out.println("member_update.do호출...");
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String passwd = BCrypt.hashpw(request.getParameter("passwd"), BCrypt.gensalt());
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String birth = request.getParameter("birth");
			String hp = request.getParameter("hp");
			String addr = request.getParameter("addr");
			String addrDetail = request.getParameter("addrDetail");
			String zip = request.getParameter("zip");
			String agreeAd = request.getParameter("agreeAd");
			
			if(sex.equals("male")) {
				sex = "남성";
			} else {
				sex = "여성";
			}
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setBirth(birth);
			dto.setHp(hp);
			dto.setSex(sex);
			dto.setAddr(addr);
			dto.setAddrDetail(addrDetail);
			dto.setZip(zip);
			dto.setAgreeAd(agreeAd);
			
			HttpSession session = request.getSession();
			session.setAttribute("agreeAd", agreeAd);
			session.setAttribute("id", id);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("birth", birth);
			session.setAttribute("hp", hp);
			session.setAttribute("sex", sex);
			session.setAttribute("addr", addr);
			session.setAttribute("addrDetail", addrDetail);
			session.setAttribute("zip", zip);
			
			System.out.println("member update의 dto : "+dto);
			dao.update(dto);
			request.setAttribute("dto", dto);
			
			response.sendRedirect(contextPath+"/myPage/myPage.jsp");

		}
		
		// member_delete
		else if(uri.indexOf("member_delete.do") != -1) {
			System.out.println("member_delete.do호출...");
			String id = request.getParameter("id");
			dao.delete(id);
			response.sendRedirect(contextPath+"/member/memberManage.jsp");
		}
		
		// member_withdraw		
		else if(uri.indexOf("withdraw.do") != -1) {
			System.out.println("withdraw.do호출...");
			String id = request.getParameter("id");
			dao.delete(id);
			HttpSession session = request.getSession();
			session.invalidate();
			String message = URLEncoder.encode("withdraw", "utf-8");
			response.sendRedirect(contextPath+"/member/login.jsp?message="+message);
		}
	
		
// ***** 회원 아이디, 비밀번호 찾기 *****
		
		// member_finding id
		else if(uri.indexOf("findingId.do") != -1) {
			String page = "/member/find_id.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// id_check 
		else if(uri.indexOf("idCheck.do") != -1) {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			
			String message = "";
			String page = "";
			
			MemberDTO dto = new MemberDTO();
			dto.setEmail(email);
			dto.setName(name);
				
			String id = dao.idCheck(dto);
				
			if(id=="") {
				message = "error";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member/find_id.jsp?message="+message;
			} else {
				System.out.println(name+"님  아이디 검색 성공 : "+id);
				request.setAttribute("id", id);
				page = "/member/find_id_result.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// member_finding password
		else if(uri.indexOf("findingPasswd.do") != -1) {
			String page = "/member/find_passwd.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// passwd_check 
		else if(uri.indexOf("passwdCheck.do") != -1) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			
			String message = "";
			String page = "";
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
				
			String result = dao.passwdCheck(dto);
				
			if(result=="") {
				message = "error";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member/find_passwd.jsp?message="+message;
			} else {
				System.out.println(name+"님  비밀번호 검색 성공 : "+id);
				request.setAttribute("id", id);
				page = "/member/find_passwd_result.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// member_update passwd		
		else if(uri.indexOf("updatePasswd.do")!=-1) {
			System.out.println("updatePasswd.do 호출...");
			String id = request.getParameter("id");
			String passwd = BCrypt.hashpw(request.getParameter("passwd"), BCrypt.gensalt());
			
			System.out.println(id);
			System.out.println(passwd);
			
			String page = "";
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPasswd(passwd);
				
			dao.updatePasswd(dto);

			page = "/member/find_passwd_result_fin.jsp";
			response.sendRedirect(contextPath+page);
		} 
		
		else if(uri.indexOf("embiCheckId.do")!=-1) {
			String id = request.getParameter("id");
			System.out.println("embiCheckId id : "+id);
			
			int result = dao.embiCheckId(id);
			System.out.println("id 중복 여부 : "+result);
			
			String page = "";
			String message = "";
			
			if(result == 1) {
				System.out.println("중복인 아이디 : "+id);
				message = "embi";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member/embiCheckId.jsp?message="+message;
			} else {
				System.out.println("아이디 : "+id);
				request.setAttribute("id", id);
				
				message = "uniq";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member/embiCheckId.jsp?id="+id+"&message="+message;
			}
			
			response.sendRedirect(contextPath+page);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
