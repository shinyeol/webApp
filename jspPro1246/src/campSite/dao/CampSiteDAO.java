package campSite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import campSite.dto.CampSiteDTO;
import common.DB;

public class CampSiteDAO {
	
	public int insertGoSite(CampSiteDTO dto) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "INSERT INTO goCampingBooking(locationName, siteType, arrivalDate, departureDate, numAdults, numKids, numInfants, equipmentType, siteWidth, siteLength, totalPrice)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getLocationName());
			pstmt.setString(2, dto.getSiteType());
			pstmt.setString(3, dto.getArrivalDate());
			pstmt.setString(4, dto.getDepartureDate());
			pstmt.setInt(5, dto.getNumAdults());
			pstmt.setInt(6, dto.getNumKids());
			pstmt.setInt(7, dto.getNumInfants());
			pstmt.setString(8, dto.getEquipmentType());
			pstmt.setInt(9, dto.getSiteWidth());
			pstmt.setInt(10, dto.getSiteLength());
			pstmt.setInt(11, dto.getTotalPrice());
			
			result = pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	public List<CampSiteDTO> siteList() {
		List<CampSiteDTO> items = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM goCampingBooking order by locationName";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CampSiteDTO dto = new CampSiteDTO();
				dto.setLocationName(rs.getString("locationName"));
				dto.setSiteType(rs.getString("siteType"));
				dto.setArrivalDate(rs.getString("arrivalDate"));
				dto.setDepartureDate(rs.getString("departureDate"));
				dto.setNumAdults(rs.getInt("numAdults"));
				dto.setNumKids(rs.getInt("numKids"));
				dto.setNumInfants(rs.getInt("numInfants"));
				dto.setEquipmentType(rs.getString("equipmentType"));
				dto.setSiteWidth(rs.getInt("siteWidth"));
				dto.setSiteLength(rs.getInt("siteLength"));
				dto.setTotalPrice(rs.getInt("totalPrice"));
				
				items.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e3) {
				e3.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e4) {
				e4.printStackTrace();
			}
		}
		return items;
	}
}
