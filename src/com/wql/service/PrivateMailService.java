package com.wql.service;

import java.util.ArrayList;
import java.util.List;

import com.wql.dao.PrivateMailDao;
import com.wql.dao.UserDao;
import com.wql.daoImpl.PrivateMailDaoImpl;
import com.wql.daoImpl.UserDaoImpl;
import com.wql.entity.Privatemail;
import com.wql.entity.User;

/**
 * @Description 处理和私信相关的业务逻辑，负责数据的拼接
 * @author 吴奇隆
 * @time 2021.7
 */
public class PrivateMailService
{
	
	
	UserDao userDao  = new UserDaoImpl() ;
	PrivateMailDao privateMailDao = new PrivateMailDaoImpl() ;
	
		/**
		 * @Description 查询符合条件的数据的总条数---privatemail表中查询
		 * @param userId 当前用户的id
		 * @return 总条数
		 */
		public int getTotalCount( int userId ) {
			return privateMailDao.getTotalCount(  userId ) ;
			}
		
		
		/**
		 * @Description  分页查询符合条件的私信
		 * @param currentPage 当前页面 
		 * @param pageSize 页面大小
		 * @param userId 当前用户的Id
		 * @return 数据集合
		 */
		public List<Privatemail> queryPrivatemailByPage( int currentPage, int pageSize ,int userId ){
		List<Privatemail> privatemails = new ArrayList<Privatemail>() ;
		List<Privatemail> privatemails1 = new ArrayList<Privatemail>() ;
		
		User fromUser = new User();
		User toUser = new User() ;
		
		//先拿到文章表的信息
			privatemails1 = privateMailDao.queryPrivatemailByPage(currentPage, pageSize, userId);
		//进行数据的拼接
		for( Privatemail privatemail : privatemails1 )
		{ 
				fromUser = null ;
				toUser = null ;
				//拿到用户的基本信息
				fromUser = userDao.userInfoByUserId(privatemail.getFromUserId());
				toUser = userDao.userInfoByUserId(privatemail.getToUserId());
				//私信发出者---赋给privatemails
			privatemail.setFromUserImg(fromUser.getPortrait());
			privatemail.setFromUserNick(fromUser.getNickname());
				//私信接收者
			privatemail.setToUserImg(toUser.getPortrait());
			privatemail.setToUserNick(toUser.getNickname());
				
				//放到数据集合中
			privatemails.add(privatemail);
		}
		return privatemails;
	}

		
		/**
		 * @Description 查询符合条件的数据的总条数---私信消息展示的记录总数
		 * @param userId 当前用户的id
		 * @param toUserId 被当前用户选择的用户id
		 * @return 总条数
		 */
		public int getShowCount( int userId ,int toUserId ) {
			return privateMailDao.getShowTotalCount(userId, toUserId);
			}
		
		
		/**
		 * @Description  分页查询符合条件的豆邮----私信消息的展示
		 * @param currentPage 当前页面 
		 * @param pageSize 页面大小
		 * @param userId 当前用户的Id
		 * @param toUserId 被当前用户选择的用户id
		 * @return 数据集合
		 */
		public List<Privatemail> queryShowByPage( int currentPage, int pageSize ,int userId ,int toUserId){
		List<Privatemail> privatemails = new ArrayList<Privatemail>() ;
		List<Privatemail> privatemails1 = new ArrayList<Privatemail>() ;
		
		User fromUser = new User();
		User toUser = new User() ;
		
		//先拿到文章表的信息
			privatemails1 = privateMailDao.queryShowByPage(currentPage, pageSize, userId, toUserId) ;
		//进行数据的拼接
		for( Privatemail privatemail : privatemails1 )
		{ 
				fromUser = null ;
				toUser = null ;
				//拿到用户的基本信息
				fromUser = userDao.userInfoByUserId(privatemail.getFromUserId());
				toUser = userDao.userInfoByUserId(privatemail.getToUserId());
				//私信发出者---赋给privatemails
			privatemail.setFromUserImg(fromUser.getPortrait());
			privatemail.setFromUserNick(fromUser.getNickname());
				//私信接收者
			privatemail.setToUserImg(toUser.getPortrait());
			privatemail.setToUserNick(toUser.getNickname());
				
				//放到数据集合中
			privatemails.add(privatemail);
		}
		return privatemails;
	}
		
		/**
		 * @Description  进行私信的增加
		 * @param privatemail
		 * @return 成功与否
		 */
		public boolean privatemailInsert(Privatemail privatemail) {
			//将组装后的对象作为参数传到增加的DAO中
			return privateMailDao.privatemailInsert(privatemail);
		}
		
}
