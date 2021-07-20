package com.wql.dao;
/**
 * @Description 用户更改好友关系的DAO操作
 * @author 吴奇隆
 * @time 2021.7
 */
public interface FriendOperationDao
{
	/**
	 * @Description  UPDATE-将好友关系更改为 当前用户选择的好友关系
	 * @param fromUserId  friend表中记录的发出者
	 * @param toUserId 用户选择的好友
	 * @param status 更改之后的好友状态
	 * @return 成功与否
	 */
	public boolean friendUpdate(int fromUserId, int toUserId ,int status );
	/**
	 * @Description DELETE-将好友关系为无状态---即在数据库没有存在该记录
	 * @param fromUserId 记录发出者
	 * @param toUserId 记录接收者
	 * @return 成功与否
	 */
	public boolean friendDelete(int fromUserId, int toUserId);
	/**
	 * @Description INSERT 增加一条好友关系----从双方关系为无状态到一方关注另一方
	 * @param fromUserId 记录发出者
	 * @param toUserId 记录接收者
	 * @return 成功与否
	 */
	public boolean friendInsert(int fromUserId, int toUserId);
	/**
	 * @Description 查询当前friend表中一条记录中双方的好友关系
	 * @param fromUserId 记录发出者
	 * @param toUserId 记录接收者
	 * @return status--当前这条记录中双方的关系-----设置0为无状态
	 */
	public int friendQuery(int fromUserId, int toUserId);
}
