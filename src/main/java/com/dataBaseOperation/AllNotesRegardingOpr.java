package com.dataBaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dataBaseConnection.DataBaseConnection;

public class AllNotesRegardingOpr {

	public static int insert(NotesDetails nd) {
		Connection conn = null;
		int result = 0;
		conn = DataBaseConnection.getConnection();
		String s = " INSERT INTO `notes` (`Title`, `Content`, `User-Id`) VALUES (?, ?, ?) ";
		try {

			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, nd.getTitle());
			ps.setString(2, nd.getContent());
		    ps.setInt(3, nd.getUser_id());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
	
	public static NotesDetails getNotesByID(int note_id)
	{
		Connection conn;
		NotesDetails nd = null;
		conn=DataBaseConnection.getConnection();
		String s="Select * from `notes` where `Id`=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, note_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				nd=new NotesDetails();
				nd.setId(rs.getInt(1));
				nd.setTitle(rs.getString(2));
				nd.setContent(rs.getNString(3));
				
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return nd;
	}
	
	public static List<NotesDetails> getNotesById(int id){
		Connection conn;
		List<NotesDetails> list=new ArrayList<NotesDetails>();
		NotesDetails nd;
		conn=DataBaseConnection.getConnection();
		String s=" Select * from `notes` where `User-id`=? ";
		try {
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				nd=new NotesDetails();
				nd.setId(rs.getInt(1));
				nd.setTitle(rs.getString(2));
				nd.setContent(rs.getNString(3));
				nd.setDate(rs.getString(4));
				list.add(nd);
			}

			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public static int editNotes(NotesDetails nd)
	{
		Connection conn;
		
		int result = 0;
		conn=DataBaseConnection.getConnection();
		String s="Update `notes` set `Title`=?, `Content`=? where `Id`=? ";
		
		try {
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setString(1, nd.getTitle());
			ps.setString(2, nd.getContent());
			;
			ps.setInt(3, nd.getId());
			result=ps.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int deleteNotes(int id)
	{
		Connection conn;
		
		int result = 0;
		conn=DataBaseConnection.getConnection();
		String s="Delete from `notes` where `Id`=? ";
		
		try {
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, id);
			result=ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
}