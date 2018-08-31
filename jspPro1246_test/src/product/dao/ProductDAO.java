package product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import product.dto.ProductDTO;
import sqlmap.MybatisManager;

public class ProductDAO {

	public void insert(ProductDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("product.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public List<ProductDTO> productListPerPage(Map<String, String> map) {
		List<ProductDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("product.productListPerPage", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ProductDTO> productManageList(String p_type) {
		List<ProductDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("product.productManageList", p_type);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public ProductDTO productView(int p_idx) {
		SqlSession session = null;
		ProductDTO dto = null;

		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("product.productView", p_idx);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return dto;
	}

	public void delete(int p_idx) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("product.delete", p_idx);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public List<ProductDTO> mochaPortList(Map<String, String> map) {
		List<ProductDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("product.mochaPortList", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public int getProductCount(String p_type) {
		int result = 0;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			result = session.selectOne("product.product_count", p_type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void update(ProductDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("product.update", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public int getSearchCount(String keyword) {
		int result = 0;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()) {
			result = session.selectOne("product.search_count", keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<ProductDTO> productSearchList(String keyword) {
		List<ProductDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("product.productSearchList", keyword);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	

}
