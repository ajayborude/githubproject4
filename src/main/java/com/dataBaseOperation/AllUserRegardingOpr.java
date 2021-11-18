package com.dataBaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dataBaseConnection.DataBaseConnection;

public class AllUserRegardingOpr {

	public static int insert(UserDetails ud) {
		Connection conn = null;
		int result = 0;
		conn = DataBaseConnection.getConnection();
		String s = " INSERT INTO `user_table` (`FullName`, `Email`, `Password`) VALUES (?, ?, ?) ";
		try {

			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getEmail());
			ps.setString(3, ud.getPassword());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static UserDetails getLogin(String email, String pass) {
		Connection conn = null;
		UserDetails ud = null;
		conn = DataBaseConnection.getConnection();
		String s = " Select * from `user_table` Where `Email`=? and `Password`=? ";
		try {

			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				ud=new UserDetails();
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				ud.setEmail(rs.getString(3));
				ud.setPassword(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ud;
	}
}
