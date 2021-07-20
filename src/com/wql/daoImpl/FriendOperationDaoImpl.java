package com.wql.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wql.dao.FriendOperationDao;
import com.wql.util.MyDataSource;
/**
 * @Description 好友关系操作的具体实现类
 * @author 吴奇隆
 * @time 2021.7
 */
public class FriendOperationDaoImpl implements FriendOperationDao
{
	private Connection con;
	//新建一个数据库连接池对象
	MyDataSource dataSource = new MyDataSource();
			/**
			 * 更改好友关系---update--friend表
			 */
			@Override
			public boolean friendUpdate(int fromUserId, int toUserId ,int status)
			{
				//返回结果
				boolean judge = false;
				try {
					//数据库连接池
					con = dataSource.getConnection();
					//更改friend表的字段
					String sql="UPDATE friend SET status = ?  WHERE from_user_id = ? AND to_user_id = ? ";
					PreparedStatement stmt=con.prepareStatement(sql);
					stmt.setInt(1,status);
					stmt.setInt(2,fromUserId);
					stmt.setInt(3,toUserId);
					//进行更新操作，返回成功更新的条数
					int ret = stmt.executeUpdate();
					if(ret == 1)
					{
						judge = true;
					}
				} catch (SQLException e) {
					e.printStackTrace();

					System.out.println("friendopreation---friendUpdate--数据库连接异常");
				} finally{
					dataSource.backConnection(con);
				}
				return judge;
			}
			/**
			 * 删除好友关系---delete--friend表
			 */
			@Override
			public boolean friendDelete(int fromUserId, int toUserId) {
				//返回结果
				boolean judge = false;
				try {
					//数据库连接池
					con = dataSource.getConnection();
					//更改user表的个人信息的字段      portrait=?,
					String sql="DELETE FROM friend WHERE from_user_id = ? AND to_user_id = ? ";
					PreparedStatement stmt=con.prepareStatement(sql);
					stmt.setInt(1,fromUserId);
					stmt.setInt(2,toUserId);
					//进行删除操作，返回成功删除的条数
					int ret = stmt.executeUpdate();
					if(ret == 1)
					{
						judge = true;
					}
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("friendopreation---friendDelete--数据库连接异常");
				} finally{
					dataSource.backConnection(con);
				}
				return judge;
			}
			/**
			 *增加好友关系---insert--friend表(默认增加时是单向关注--即status为1)
			 */
			@Override
			public boolean friendInsert(int fromUserId, int toUserId) {
				boolean judge = false;
				try {
					//获取数据库连接池中的一个连接
					con = dataSource.getConnection();
					//默认增加时是单向关注
					String sql="insert into friend (from_user_id,to_user_id,status) values (?,?,1)";
					PreparedStatement stmt=con.prepareStatement(sql);
					stmt.setInt(1, fromUserId);
					stmt.setInt(2, toUserId);
					int t = stmt.executeUpdate();
					if(t>0)
					{
						judge = true;
					}
				} catch (SQLException e) {
					judge=false;
					System.out.println("friendopreation---friendInsert--数据库连接异常");
					e.printStackTrace();
				}
				finally {
					dataSource.backConnection(con);
					}
				return judge;
			}
			/**
			 * 找到是否存在该记录--并且查询出该记录中的status--friend表
			 */
			@Override
			public int friendQuery(int fromUserId, int toUserId) {
				// 默认好友关系的无状态为0
				int status = 0;
				try {
					con = dataSource.getConnection();
					String sql="SELECT status  FROM friend WHERE from_user_id = ? AND to_user_id = ?";
					PreparedStatement stmt=con.prepareStatement(sql);
					stmt.setInt(1, fromUserId);
					stmt.setInt(2, toUserId);
					ResultSet res=stmt.executeQuery();
					while(res.next())
					{
						status=res.getInt("status");
					}
				}
				catch (SQLException e) {
					e.printStackTrace();
					System.out.println("friendopreation---friendQuery--数据库连接异常");
				}
				finally {
					dataSource.backConnection(con);
					}
				return status;
			}
}



