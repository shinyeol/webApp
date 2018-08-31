package cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cart.dto.CartDTO;
import sqlmap.MybatisManager;

public class CartDAO {

	public List<CartDTO> list(String id) {
		List<CartDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("cart.list", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public int sumMoney(String id) {
		SqlSession session = null;
		int sum = 0;
		
		try {
			session = MybatisManager.getInstance().openSession();
			sum = session.selectOne("cart.sumMoney", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return sum;
	}

	public void insert(CartDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("cart.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public void delete(int c_idx) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("cart.delete", c_idx);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	public void update(CartDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("cart.update", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

}
