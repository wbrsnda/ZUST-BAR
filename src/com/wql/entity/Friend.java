package com.wql.entity;
/**
 * @Description 好友关系表对应的实体类
 * @author 吴奇隆
 * @time 2021.7
 */
public class Friend
{
	/**
	 * 好友关系分组的id
	 */
	private int friendId;
/**
 * 进行好友关系操作的用户
 */
 private int fromUserId;
 /**
  * 好友关系的对象的用户Id
  */
private int toUserId ;
/**
 * 好友关系的状态
 */
private int status ;
		/**
		 * @param friendId
		 * @param fromUserId
		 * @param toUserId
		 * @param status
		 */
		public Friend(int friendId, int fromUserId, int toUserId, int status)
		{
			super();
			this.friendId = friendId;
			this.fromUserId = fromUserId;
			this.toUserId = toUserId;
			this.status = status;
		}
		/**
		 * 
		 */
		public Friend()
		{
			super();
			// TODO Auto-generated constructor stub
		}
		public int getFriendId()
		{
			return friendId;
		}
		
		public void setFriendId(int friendId)
		{
			this.friendId = friendId;
		}
		
		public int getFromUserId()
		{
			return fromUserId;
		}
		
		public void setFromUserId(int fromUserId)
		{
			this.fromUserId = fromUserId;
		}
		
		public int getToUserId()
		{
			return toUserId;
		}
		
		public void setToUserId(int toUserId)
		{
			this.toUserId = toUserId;
		}
		
		public int getStatus()
		{
			return status;
		}
		
		public void setStatus(int status)
		{
			this.status = status;
		}

}
