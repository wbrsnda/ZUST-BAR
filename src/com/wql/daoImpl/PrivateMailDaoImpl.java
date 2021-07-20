package com.wql.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wql.dao.PrivateMailDao;
import com.wql.entity.Privatemail;
import com.wql.util.MyDataSource;
/**
 * @Description 关于私信的数据库操作
 * @author 吴奇隆
 * @time 2021.7
 */
public class PrivateMailDaoImpl implements PrivateMailDao
{
	private Connection con;
	private PreparedStatement stmt;
	//新建一个数据库连接池对象
	MyDataSource dataSource = new MyDataSource();
	/**
	 *SELECT--- 在privatemail表中查找当前用户id收到的私信记录，得到其记录总数
	 */
	@Override
	public int getTotalCount( int userId )
	{
		//总数据量
		int count = -1;
		try {
			//获取连接池连接
			con = dataSource.getConnection();
			//查询数据库中记录的总数量---满足的条件---当前用户是私信的接收者
			String sql = "SELECT  count(1) FROM privatemail WHERE  to_user_id = ? ";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) //若查询结果不为空
			{
				//总数据量
			count = rs.getInt(1);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("PrivateMailDaoImpl---getTotalCount--数据库连接异常");
		} finally{
			dataSource.backConnection(con);
		}
		return count;
	}
	/**
	 * SELECT--查询当前用户的收到的私信的数据集合
	 */
	@Override
	public List<Privatemail> queryPrivatemailByPage(int currentPage, int pageSize , int userId )
	{
		List<Privatemail> privatemails = null;
		privatemails = new ArrayList<Privatemail>();
		try {
			con = dataSource.getConnection();
			//分页查询的sql语句
			String sql = "SELECT * FROM privatemail WHERE to_user_id = ?  ORDER BY chat_time DESC  limit ? offset ?";
			//占位符代表的参数
			//limit 查询的数目====pageSize
			//offset对应的记录开始数
			int begin = ( currentPage-1 )*pageSize;
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userId);
			stmt.setInt(2, pageSize);
			stmt.setInt(3, begin);
			ResultSet rs = stmt.executeQuery();
			//拿到数据集合
			while(rs.next()){
				Privatemail privatemail = new Privatemail();
				//辨别一条记录的值---拿到privatemail表中的数据
				//私信的基本信息
				privatemail.setPrivatemailId(rs.getInt("privatemail_id"));
				privatemail.setFromUserId(rs.getInt("from_user_id"));
				privatemail.setToUserId(rs.getInt("to_user_id"));
				//私信的详情
				privatemail.setChatMsg(rs.getString("chat_msg"));
				privatemail.setChatTime(rs.getTimestamp("chat_time"));
				//当前私信的状态
				privatemail.setStatus(rs.getInt("status"));
				privatemail.setRead(rs.getInt("read"));
				//放到集合中
				privatemails.add(privatemail);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("PrivateMailDaoImpl---queryPrivatemailListByPage--数据库连接异常");
		} finally{
			dataSource.backConnection(con);
		}
		return privatemails;
	}
/**
 * SELECT---得到符合当前用户和被选择的用户的私信记录总数
 */
	@Override
	public int getShowTotalCount(int userId ,int toUserId)
	{
		//总数据量
		int count = -1;
		try {
			//获取连接池连接
			con = dataSource.getConnection();
			//查询数据库中记录的总数量---满足的条件---当前用户是私信的接收者或者是发送者
			String sql = "SELECT  count(1) FROM privatemail WHERE    from_user_id = ? AND to_user_id = ?    OR    to_user_id = ? AND from_user_id = ?   ";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userId);
			stmt.setInt(2, toUserId);
			stmt.setInt(3, userId);
			stmt.setInt(4, toUserId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) //若查询结果不为空
			{
				//总数据量
			count = rs.getInt(1);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("PrivateMailDaoImpl---getShowTotalCount--数据库连接异常");
		} finally{
			dataSource.backConnection(con);
		}
		return count;
	}
	/**
	 * SELECT---在privatemail表中查找有关当前用户id和当前用户选择的用户的私信记录--数据集合
	 */
	@Override
	public List<Privatemail> queryShowByPage(int currentPage, int pageSize, int userId  , int  toUserId)
	{
		List<Privatemail> privatemails = null;
		privatemails = new ArrayList<Privatemail>();
		try {
			con = dataSource.getConnection();
			//分页查询的sql语句
			String sql = "SELECT * FROM privatemail   WHERE    from_user_id = ? AND to_user_id = ?    OR    to_user_id = ? AND from_user_id  = ? ORDER BY chat_time DESC  limit ? offset ?";
			//占位符代表的参数
			//limit 查询的数目====pageSize
			//offset对应的记录开始数
			int begin = ( currentPage-1 )*pageSize;
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userId);
			stmt.setInt(2, toUserId);
			stmt.setInt(3, userId);
			stmt.setInt(4, toUserId);
			stmt.setInt(5, pageSize);
			stmt.setInt(6, begin);
			ResultSet rs = stmt.executeQuery();
			//拿到数据集合
			while(rs.next()){
				Privatemail privatemail = new Privatemail();
				//辨别一条记录的值---拿到doumail表中的数据
				//私信的基本信息
				privatemail.setPrivatemailId(rs.getInt("privatemail_id"));
				privatemail.setFromUserId(rs.getInt("from_user_id"));
				privatemail.setToUserId(rs.getInt("to_user_id"));
				//私信的详情
				privatemail.setChatMsg(rs.getString("chat_msg"));
				privatemail.setChatTime(rs.getTimestamp("chat_time"));
				//当前私信的状态
				privatemail.setStatus(rs.getInt("status"));
				privatemail.setRead(rs.getInt("read"));
				//放到集合中
				privatemails.add(privatemail);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("PrivateMailDaoImpl---queryShowByPage--数据库连接异常");
		} finally{
			dataSource.backConnection(con);
		}
		return privatemails;
	}
	/**
	 * INSERT---增加一条记录到privatemial表中
	 */
	@Override
	public boolean privatemailInsert(Privatemail privatemail)
	{
		boolean judge = false;
		try {
			//获取数据库连接池中的一个连接
			con = dataSource.getConnection();
			//增加一条记录到doumail表中
			String sql="insert into privatemail  ( from_user_id , to_user_id , chat_msg ) values (?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql) ;
			stmt.setInt ( 1, privatemail.getFromUserId() );
			stmt.setInt ( 2, privatemail.getToUserId());
			//用户发送私信的消息
			stmt.setString(3, privatemail.getChatMsg());
			int t = stmt.executeUpdate();
			if(t>0) 
			{
				judge = true;
			}
		} catch (SQLException e) {
			judge=false;
			System.out.println("PrivateMailDaoImpl---privatemailInsert--数据库连接异常");
			e.printStackTrace();
		}
		finally {
			dataSource.backConnection(con);
			}
		return judge;
	}
}
