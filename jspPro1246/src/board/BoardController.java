package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BoardDAO;
import board.dto.BoardDTO;
import boardComment.dao.BoardCommentDAO;
import boardComment.dto.BoardCommentDTO;
import common.Constants;
import page.Pager;

@WebServlet("/board_servlet/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURL().toString();
		System.out.println(url+"호출...");
		String contextPath = request.getContextPath();
		BoardDAO dao = new BoardDAO();
		BoardCommentDAO bcDao = new BoardCommentDAO();
		
		if(url.indexOf("list.do") != -1) {
			int curPage = 1;
			String b_type = request.getParameter("b_type");
			int count = dao.getBoardCount(b_type);
			
			System.out.println("게시판 영역확인 : "+b_type);
			
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("b_type", b_type);
			
			List<BoardDTO> list = dao.list(map);
			request.setAttribute("b_type", b_type);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			request.setAttribute("count", count);
			
			String page = "/board/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("insert.do") != -1) {
			File uploadDir = new File(Constants.UPLOAD_PATH);
			
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			String b_type = multi.getParameter("b_type");
			String writer = multi.getParameter("writer");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String passwd = multi.getParameter("passwd");
			String ip = request.getRemoteAddr();
			String filename = " "; 
			int filesize = 0;
			
			try {
				Enumeration<?> files = multi.getFileNames();
				
				while(files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					filename = multi.getFilesystemName(file1);
					File f1 = multi.getFile(file1);
					
					if(f1 != null) {
						filesize = (int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto = new BoardDTO();
			dto.setB_type(b_type);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			
			if(filename == null || filename.trim().equals("")) {
				filename = "-";
			}
			
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			System.out.println(dto);
			dao.insert(dto);
			String page = "/board_servlet/list.do?b_type="+b_type;
			response.sendRedirect(contextPath+page);
			
		}else if(url.indexOf("update.do") != -1) {
			File uploadDir = new File(Constants.UPLOAD_PATH);
			
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			int num = Integer.parseInt(multi.getParameter("num"));
			String b_type = multi.getParameter("b_type");
			String writer = multi.getParameter("writer");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String passwd = multi.getParameter("passwd");

			String ip = request.getRemoteAddr();
			String filename = " "; 
			int filesize = 0;
			
			try {
				Enumeration<?> files = multi.getFileNames();
				
				while(files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					filename = multi.getFilesystemName(file1);
					File f1 = multi.getFile(file1);
					
					if(f1 != null) {
						filesize = (int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto = new BoardDTO();
			dto.setNum(num);
			dto.setB_type(b_type);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			
			if(filename == null || filename.trim().equals("")) {
				BoardDTO dto2 = dao.view(num);
				String fName = dto2.getFilename();
				int fSize = dto2.getFilesize();
				int fDown = dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			} else {
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			
			String fileDel = multi.getParameter("fileDel");
			if(fileDel != null && fileDel.equals("on")) {
				String fileName = dao.getFileName(num);
				File f = new File(Constants.UPLOAD_PATH+fileName);
				f.delete();
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			
			dao.update(dto);
			String page = "/board_servlet/list.do?b_type="+b_type;
			response.sendRedirect(contextPath+page);
		
		} else if(url.indexOf("delete.do") != -1) {
			String b_type = request.getParameter("b_type");
			int comment_count = 0;
			int ref_count = 0;
			int num = Integer.parseInt(request.getParameter("num"));
			
			comment_count = dao.getComment_count(num);
			ref_count = dao.getRef_count(num);
			System.out.println("comment_count :"+comment_count);
			System.out.println("ref_count :"+ref_count);
					
			if(comment_count!=0) {
				bcDao.delete(num);
			}
			
			if(ref_count > 1) {
				dao.hidden(num);
			} else {
				dao.delete(num);		
			}
		
			String page = "/board_servlet/list.do?"+b_type;
			response.sendRedirect(contextPath+page);
		
		}else if(url.indexOf("download.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			String filename = dao.getFileName(num);
			System.out.println("첨부파일 이름 : "+filename);
			
			String path = Constants.UPLOAD_PATH + filename;
			byte b[] = new byte[4096];
			
			FileInputStream fis = new FileInputStream(path);
			System.out.println("ServletContext : "+getServletContext());
			String mimeType = getServletContext().getMimeType(path);
			System.out.println("mimeType : "+mimeType);
			
			if(mimeType == null) {
				mimeType = "application/octet-stream;char-set=utf-8";
			}
			
			filename = new String(filename.getBytes("utf-8"), "8859_1"); 
			response.setHeader("Content-Disposition", "attachment;filename="+filename);		
			
			ServletOutputStream out = response.getOutputStream();
			int numRead;
			
			while(true) {
				numRead = fis.read(b,0,b.length);
				if(numRead == -1) break;
				out.write(b, 0, numRead);
			}
			out.flush();
			out.close();
			fis.close();
			dao.plusDown(num);
			
		}else if(url.indexOf("view.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			
			HttpSession session = request.getSession();
			dao.plusReadcount(num, session);
			
			BoardDTO dto = dao.viewReplace(num);
			request.setAttribute("dto", dto);
			
			String b_type = dto.getB_type();
			request.setAttribute("b_type", b_type);
			
			String page = "/board/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("commentList.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			bcDao = new BoardCommentDAO();
			List<BoardCommentDTO> list = bcDao.list(num);
			System.out.println("댓글을 표시할 게시물 번호 : "+num);
			
			request.setAttribute("list", list);
			String page = "/board/comment_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("passwd_check.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			String passwd = request.getParameter("passwd");
			
			System.out.println("게시물번호:"+num);
			System.out.println("사용자가 입력한 비번:"+passwd);

			boolean result = dao.passwdCheck(num, passwd);
			System.out.println("결과:"+result);
			String page = "";

			if(result) {
				page = "/board/edit.jsp";
				request.setAttribute("dto", dao.view(num));
				
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {
				page = "/board_servlet/view.do?num="+num+"&message=error";
				response.sendRedirect(contextPath+page);
			}
			
		}else if(url.indexOf("comment_add.do") != -1) {
			BoardCommentDTO dto = new BoardCommentDTO();
 			int board_num = Integer.parseInt(request.getParameter("board_num"));
			String writer = request.getParameter("writer");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setPasswd(passwd);
			dto.setContent(content);
			System.out.println(dto);
			bcDao.commentAdd(dto);
			
		}else if(url.indexOf("commentDelete.do") != -1) {
			BoardCommentDTO bcDTO = new BoardCommentDTO();
			int comment_num = Integer.parseInt(request.getParameter("comment_num"));
			String passwd = request.getParameter("passwd");
			System.out.println("삭제할 게시물 : "+comment_num);
			System.out.println("입력한 비번 : "+passwd);
			bcDTO = bcDao.view(comment_num);
			
			int num = bcDTO.getBoard_num();
			
			boolean result = bcDao.passwdCheck(comment_num, passwd);
			System.out.println("결과:"+result);
			String page = "";
			
			if(result) {
				bcDao.delete(comment_num);
				page = "/board/view.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {
				page = "/board_servlet/view.do?num="+num+"&comment_message=error";
				response.sendRedirect(contextPath+page);
			}
			
		}else if(url.indexOf("reply.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDTO dto = dao.view(num);
			dto.setContent("\n"+dto.getContent()+"\n\n------------------------------------------------ "
					+ "원문 내용 ------------------------------------------------\n");
			request.setAttribute("dto", dto);
			String page = "/board/reply.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("insertReply.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDTO dto = dao.view(num);
			int ref = dto.getRef();
			int re_step = dto.getRe_step()+1;
			int re_level = dto.getRe_level()+1;
			
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String passwd = request.getParameter("passwd");
			String ip = request.getRemoteAddr();
			
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			dto.setRef(ref);
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			
			dao.updateStep(ref, re_step);
			dao.reply(dto);
			
			String page = "/board_servlet/list.do";
			response.sendRedirect(contextPath + page);
			
		}else if(url.indexOf("search.do") != -1) {
			int curPage = 1;
			String b_type = request.getParameter("b_type");
			String search_option = request.getParameter("search_option");
			String keyword = request.getParameter("keyword");
			
			System.out.println("게시판 영역확인 : "+b_type);
			
			Map<String, String> count_map = new HashMap<>();
			count_map.put("search_option", search_option);
			count_map.put("keyword", keyword);
			count_map.put("b_type", b_type);
			
			int count = dao.searchCount(count_map);
			
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			String startToString = Integer.toString(start);
			String endToString = Integer.toString(end);
			
			Map<String, String> map = new HashMap<>();
			map.put("start", startToString);
			map.put("end", endToString);
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			map.put("b_type", b_type);
			
			List<BoardDTO> list = dao.searchList(map);
			
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			request.setAttribute("page", pager);
			request.setAttribute("count", count);
			request.setAttribute("b_type", b_type);
			
			String page = "/board/search.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} 
		
		// board write
		else if(url.indexOf("write.do") != -1) {
			String b_type = request.getParameter("b_type");
			request.setAttribute("b_type", b_type);
			String page = "/board/write.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
