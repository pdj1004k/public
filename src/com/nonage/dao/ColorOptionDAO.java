package com.nonage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nonage.dto.ColorOptionVO;

import util.DBManager;

public class ColorOptionDAO {
	 private static ColorOptionDAO instance = new ColorOptionDAO();

	  public static ColorOptionDAO getInstance() {
	    return instance;
	  }
	  public int insertColor(ColorOptionVO optionVO) {
		  
		  int result =0;
		  String sql="insert into color_option (cseq,pseq,color_name,color_size)values(color_option_seq.nextval,?,?,?)";
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  conn=DBManager.getConnection();
		  try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, optionVO.getPseq());
			pstmt.setString(2, optionVO.getColor_name());
			pstmt.setInt(3, optionVO.getColor_size());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return result;
	  }
	public  ArrayList<ColorOptionVO> listColorOption(String pseq){
		
		ArrayList<ColorOptionVO>colorList=new ArrayList<ColorOptionVO>();
		String sql= "select * from color_option where pseq=?"; 
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		conn=DBManager.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			rs=pstmt.executeQuery();
			while(rs.next()) {
		
				colorList.add(new ColorOptionVO(
						rs.getInt("cseq"),
						rs.getInt("pseq"),
						rs.getString("color_name"),
						rs.getInt("color_size")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBManager.close(conn,pstmt,rs);
		}
		return colorList;
	}
}
