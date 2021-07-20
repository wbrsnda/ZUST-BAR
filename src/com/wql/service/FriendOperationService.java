package com.wql.service;

import com.wql.dao.FriendOperationDao;
import com.wql.daoImpl.FriendOperationDaoImpl;
/**
 * @Description 好友关系的业务逻辑层
 * @author 吴奇隆
 * @time 2021.7
 */
public class FriendOperationService
{
	/**
	 * 引入DAO层
	 */
	FriendOperationDao friendOperationDao = new FriendOperationDaoImpl();
	/**
	 * @Description 将好友从黑名单移除--等同于删除A->B的记录
	 * @param fromUserId 当前用户的ID
	 * @param toUserId 被选中的用户ID
	 * @return 成功与否
	 */
	public boolean friendDelete(int fromUserId, int toUserId) {
		boolean judge = false;
			if( friendOperationDao.friendDelete(fromUserId, toUserId) )
				{
					judge = true;
				}
			else
				{ }
		return judge;
	}
	/**
	 * @Description  好友关系状态的更新
	 * @param fromUserId 当前用户的ID
	 * @param toUserId 被选中的用户ID
	 * @param status 更新后的状态
	 * @return 成功与否
	 */
	public boolean friendUpdate(int fromUserId, int toUserId,int status) {
		boolean judge = false;
			if( friendOperationDao.friendUpdate(fromUserId, toUserId,status) )
				{
					judge = true;
				}
			else { }
		return judge;
	}
	/**
	 * @Description 好友关系状态的查询
	 * @param fromUserId 当前用户的ID
	 * @param toUserId 被选中的用户ID
	 * @return status 当前friend表中的好友关系
	 */
	public int friendQuery(int fromUserId, int toUserId) {
		//查询是否有此记录--并且查出其状态
		return friendOperationDao.friendQuery(fromUserId, toUserId) ;
	}
	/**
	 * @Description  关注---增加一条记录---status默认为1
	 * @param fromUserId 当前用户的ID
	 * @param toUserId 被选中的用户ID
	 * @return 成功与否
	 */
	public boolean friendInsert(int fromUserId, int toUserId ) {
		boolean judge = false;
			//新增一条好友关系记录到friend表中
			if( friendOperationDao.friendInsert(fromUserId, toUserId))
				{
				      		//得到该好友关系对应的结果
				      		judge = true ;
				}
			else { }
		return judge;
	}
}
