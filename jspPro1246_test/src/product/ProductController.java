package product;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import product.dao.ProductDAO;
import product.dto.ProductDTO;

@WebServlet("/product_servlet/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		System.out.println(uri+"접근...");
		String contextPath = request.getContextPath();
		
		ProductDAO dao = new ProductDAO();
		
		if(uri.indexOf("bean.do") != -1) {
			String page = "/bean/bean.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("machine.do") != -1) {
			String page = "/machine/machine.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("mochaPort.do") != -1) {
			String page = "/mochaPort/mochaPort.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("handDrip.do") != -1) {
			String page = "/handDrip/handDrip.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("utensils.do") != -1) {
			String page = "/utensils/utensils.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// product_list_per_page		
		else if(uri.indexOf("productListPerPage.do")!=-1) { 
			String p_type = request.getParameter("p_type");
			String p_option1 = request.getParameter("p_option1");
			
			Map<String, String> map = new HashMap<>();
			map.put("p_type", p_type);
			map.put("p_option1", p_option1);
			List<ProductDTO> list = dao.productListPerPage(map);
			request.setAttribute("list", list);
			
			String page = "/"+p_type+"/"+p_type+"_list.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// mochaPort_list_per_page		
		else if(uri.indexOf("mochaPortList.do")!=-1) { 
			String p_type = request.getParameter("p_type");
			String p_option2 = request.getParameter("p_option2");
			
			Map<String, String> map = new HashMap<>();
			map.put("p_type", p_type);
			map.put("p_option2", p_option2);
			List<ProductDTO> list = dao.mochaPortList(map);
			request.setAttribute("list", list);
			
			String page = "/"+p_type+"/"+p_type+"_list.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// product_view		
		else if(uri.indexOf("productView.do") != -1 ) {
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			String p_type = request.getParameter("p_type");
			
			ProductDTO dto = dao.productView(p_idx);
			request.setAttribute("dto", dto);
			
			String page="/"+p_type+"/"+p_type+"_view.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}		
		
		
// ***** admin *****
		// product_manage 
		else if(uri.indexOf("productManage.do") != -1) {
			String page = "/admin/product.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// product_manage_list		
		else if(uri.indexOf("productManageList.do")!=-1) { 
			String p_type = request.getParameter("p_type");
			int count = dao.getProductCount(p_type);
			
			List<ProductDTO> list = dao.productManageList(p_type);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			
			String page = "/admin/product_list.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}	
		
		// product_write
		else if(uri.indexOf("write.do") != -1) {
			String page = "/admin/write.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// product_insert
		else if(uri.indexOf("insert.do") != -1) {
			File uploadDir = new File(Constants.UPLOAD_PATH);
			
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(
					request, Constants.IMAGE_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			String p_type = multi.getParameter("p_type");
			String p_option1 = multi.getParameter("p_option1");
			String p_option2 = multi.getParameter("p_option2");
			String p_option3 = multi.getParameter("p_option3");
			String p_country_of_origin = multi.getParameter("p_country_of_origin");
			String p_name = multi.getParameter("p_name");
			String p_size = multi.getParameter("p_size");
			String p_product_date = multi.getParameter("p_product_date");
			int p_price = Integer.parseInt(multi.getParameter("p_price"));
			int p_point = Integer.parseInt(multi.getParameter("p_point"));
			
			String p_imgPath[] = {"p_img_main", "p_img1", "p_img2"};
			String p_img[] = {"-", "-", "-"};
			
			try {
				Enumeration<?> files = multi.getFileNames();
				int i = 0;
				while(files.hasMoreElements() || i!=3) {
					p_imgPath[i] = (String)files.nextElement();
					p_img[i] = multi.getFilesystemName(p_imgPath[i]);
					System.out.println("p_imgPath["+i+"] : "+p_imgPath[i]);
					System.out.println("p_img["+i+"] : "+p_img[i]);
					i += 1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			ProductDTO dto = new ProductDTO();
			dto.setP_type(p_type);
			dto.setP_option1(p_option1);
			dto.setP_option2(p_option2);
			dto.setP_option3(p_option3);
			dto.setP_country_of_origin(p_country_of_origin);
			dto.setP_name(p_name);
			dto.setP_size(p_size);
			dto.setP_price(p_price);
			dto.setP_point(p_point);
			dto.setP_product_date(p_product_date);
			
			String p_img_main = p_img[0];
			String p_img1 = p_img[2]; 
			String p_img2 = p_img[1];

			
			for(int i=0;i<p_img.length;i++) {
				if(p_img[i] == null || p_img[i].trim().equals("")) {
					p_img[i] = "-";
				}
			}
			
			dto.setP_img_main(p_img_main);
			dto.setP_img1(p_img1);
			dto.setP_img2(p_img2);
			System.out.println(dto);
			dao.insert(dto);
			String page = "/product_servlet/productManage.do";
			response.sendRedirect(contextPath+page);
		}
		
		// product_manage_delete		
		else if(uri.indexOf("delete.do")!=-1) { 
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			
			dao.delete(p_idx);
			
			String page = "/product_servlet/productManage.do";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);	
		}	
		
		// product_manage_view		
		else if(uri.indexOf("viewEdit.do") != -1) {
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			
			ProductDTO dto = dao.productView(p_idx);
			request.setAttribute("dto", dto);
			
			String page="/admin/viewEdit.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// product_manage_update		
		else if(uri.indexOf("pUpdate.do") != -1) {
			
			File uploadDir = new File(Constants.UPLOAD_PATH);
			
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(
					request, Constants.IMAGE_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			int p_idx = Integer.parseInt(multi.getParameter("p_idx"));
			String p_type = multi.getParameter("p_type");
			String p_option1 = multi.getParameter("p_option1");
			String p_option2 = multi.getParameter("p_option2");
			String p_option3 = multi.getParameter("p_option3");
			String p_country_of_origin = multi.getParameter("p_country_of_origin");
			String p_name = multi.getParameter("p_name");
			String p_size = multi.getParameter("p_size");
			String p_product_date = multi.getParameter("p_product_date");
			int p_price = Integer.parseInt(multi.getParameter("p_price"));
			int p_point = Integer.parseInt(multi.getParameter("p_point"));
			
			String p_imgPath[] = {"p_img_main", "p_img1", "p_img2"};
			String p_img[] = {"-", "-", "-"};
			
			try {
				Enumeration<?> files = multi.getFileNames();
				int i = 0;
				while(files.hasMoreElements() || i!=3) {
					p_imgPath[i] = (String)files.nextElement();
					p_img[i] = multi.getFilesystemName(p_imgPath[i]);
					System.out.println("p_imgPath["+i+"] : "+p_imgPath[i]);
					System.out.println("p_img["+i+"] : "+p_img[i]);
					i += 1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			ProductDTO dto = new ProductDTO();
			dto.setP_idx(p_idx);
			dto.setP_type(p_type);
			dto.setP_option1(p_option1);
			dto.setP_option2(p_option2);
			dto.setP_option3(p_option3);
			dto.setP_country_of_origin(p_country_of_origin);
			dto.setP_name(p_name);
			dto.setP_size(p_size);
			dto.setP_price(p_price);
			dto.setP_point(p_point);
			dto.setP_product_date(p_product_date);
			
			String p_img_main = p_img[0];
			String p_img1 = p_img[2]; 
			String p_img2 = p_img[1];
			
			for(int i=0;i<p_img.length;i++) {
				if(p_img[i] == null || p_img[i].trim().equals("")) {
					p_img[i] = "-";
				}
			}
			
			dto.setP_img_main(p_img_main);
			dto.setP_img1(p_img1);
			dto.setP_img2(p_img2);
			
			dao.update(dto);
			System.out.println(dto);
			
			String page = "/product_servlet/productManage.do";
			response.sendRedirect(contextPath+page);
		}		
		
		//
		else if(uri.indexOf("productSearch.do") != -1) {
			String keyword = request.getParameter("p_keyword");
			int count = dao.getSearchCount(keyword);
			
			System.out.println("keyword : "+keyword);
			System.out.println("count : "+count);
			
			List<ProductDTO> list = dao.productSearchList(keyword);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.setAttribute("keyword", keyword);
			
			String page = "/product/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
