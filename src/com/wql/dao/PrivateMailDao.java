package com.wql.dao;

import java.util.List;

import com.wql.entity.Privatemail;

/**
 * @Description 私信的数据库操作
 * @author 吴奇隆
 * @time 2021.7
 */
public interface PrivateMailDao
{
	/**
	 * @Description 查询列表的记录总数--privatemail
	 * @param userId
	 * @return 记录总数
	 */
	public int getTotalCount( int userId );



	/**
	 * @Description 通过用户定义的页面数和页面大小，进行分页查询
	 * @param currentPage 当前页
	 * @param pageSize    页面大小
	 * @param userId 当前用户的id
	 * @return doumail (只含有doumail表中含有的数据集合)
	 */
	public List<Privatemail> queryPrivatemailByPage(int currentPage, int pageSize , int userId );
	
	/**
	 * @Description 查询列表中的找到符合发送者和接受者的记录--privatemail
	 * @param userId 当前用户的id
	 * @param toUserId 展示消息记录的对方的id
	 * @return 记录总数
	 */
	public int getShowTotalCount(int userId ,int toUserId) ;



	/**
	 * @Description 通过用户定义的页面数和页面大小，进行分页查询--找到符合发送者和接受者的记录
	 * @param currentPage 当前页
	 * @param pageSize    页面大小
	 * @param userId 当前用户的id
	 * @param toUserId 展示消息记录的对方的id
	 * @return privatemails (只含有privatemail表中含有的数据集合)
	 */
	public List<Privatemail> queryShowByPage(int currentPage, int pageSize , int userId , int toUserId);
	
	
	
	/**
	 * @Description  INSERT 增加一条豆邮的消息 
	 * @param privatemail 对象
	 * @return 成功与否
	 */
	public boolean privatemailInsert(Privatemail privatemail);

}
