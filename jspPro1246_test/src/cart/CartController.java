package cart;

import java.io.IOException;
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

import cart.dao.CartDAO;
import cart.dto.CartDTO;

@WebServlet("/cart_servlet/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		System.out.println(uri+"접근...");
		String contextPath = request.getContextPath();
		
		CartDAO dao = new CartDAO();
		
		// cart_insert
		if(uri.indexOf("insert.do")!=-1) {
			CartDTO dto = new CartDTO();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			String name = (String)session.getAttribute("name");
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			String c_img = request.getParameter("c_img");
			String p_name = request.getParameter("p_name");
			String p_type = request.getParameter("p_type");
			int price = Integer.parseInt(request.getParameter("price"));
			
			String page = "";
			
			if (id == null) {
				page = "/member_servlet/login.do";
			} else {
				
				dto.setId(id);
				dto.setP_idx(p_idx);
				dto.setAmount(amount);
				dto.setC_img(c_img);
				dto.setP_name(p_name);
				dto.setName(name);
				dto.setPrice(price);
				dto.setP_type(p_type);
				System.out.println("cart_insert_dto : "+dto);
				dao.insert(dto);
				
				page = "/cart_servlet/list.do";
			}
			response.sendRedirect(contextPath+page);	
		}
		
		// cart_list
		else if(uri.indexOf("list.do")!=-1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			Map<String, Object> map = new HashMap<>();
			
			if(id != null) {
				List<CartDTO> dto = dao.list(id);
				int sumMoney = dao.sumMoney(id);
				int fee = sumMoney >= 30000 ? 0 : 2500;
				int sum = sumMoney + fee;
				map.put("sumMoney", sumMoney);
				map.put("fee", fee);
				map.put("sum", sum);
				map.put("count", dto.size());
				
				request.setAttribute("dto", dto);
				request.setAttribute("map", map);
			} 
			String page = "/order/cart.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// cart_delete
		else if(uri.indexOf("delete.do")!=-1) {
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			dao.delete(c_idx);
			String page = "/cart_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}
		
		// cart_update
		else if(uri.indexOf("update.do")!=-1) {
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			
			CartDTO dto = new CartDTO();
			dto.setC_idx(c_idx);
			dto.setAmount(amount);
			dao.update(dto);
			
			String page = "/cart_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
