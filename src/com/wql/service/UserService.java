package com.wql.service;

import com.wql.bean.Msg;
import com.wql.daoImpl.UserDaoImpl;
import com.wql.entity.User;
import com.wql.util.ValidateUtil;

/**
 * @Description 对传过来的要登陆的用户名和密码，进行调用方法的处理
 * @author 吴奇隆
 * @time 2021.7
 */
public class UserService
{

	private UserDaoImpl userDao = new UserDaoImpl();

	/**
	 * @Description 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	public Msg login(String username, String password)
	{

		User user = new User();
		/**
		 * 调用判空的方法
		 */
		if (ValidateUtil.isInvalidUserName(username) == true)
		{

			// 用一个对象存储返回值
			return new Msg("用户名为空", null);
		}
		/*
		 * 调用DAO层，检查是否存在该用户和 密码是否正确 以及确认其管理权限
		 */
		user.setUsername(username);
		user.setPassword(password);
		// 调用了dao层
		Msg msg = userDao.login(user);
		return msg;
	}
/**
 * @Description 用户注册 
 * @param username
 * @param password
 * @return
 */
	public Msg register(String username, String password,String gender,String mail,String phone)
	{
		int judge = 0;
		User user = new User();
		/*
		 * 调用判空的方法
		 */
		if (ValidateUtil.isInvalidUserName(username) == true)
		{

			// 用一个对象存储返回值
			return new Msg("用户名为空", null);
		}
		else if (ValidateUtil.isInvalidPassword(password) == true)
				{
					return new Msg("密码为空", null);
				}
		else if (ValidateUtil.isInvalidGender(gender) == true)
		{
			return new Msg("性别为空", null);
		}
		else if (ValidateUtil.isInvalidMail(mail) == true)
		{
			return new Msg("邮箱为空", null);
		}
		else if (ValidateUtil.isInvalidPhone(phone) == true)
		{
			return new Msg("电话为空", null);
		}


		/**
		 * 调用DAO层，检查是否存在该用户和 密码是否正确 以及确认其管理权限
		 */
		user.setUsername(username);
		user.setPassword(password);
		user.setGender(gender);
		user.setMail(mail);
		user.setPhone(phone);
		/**
		 * 重复时
		 */
		if (userDao.repetition(user) == 1)
		{
			return new Msg("用户名重复", null);
		}
		else
		{
		judge = userDao.register(user);
				if(judge==1) 
				{
					return new Msg("注册成功", user);
					}
				else 
				{
					return new Msg("注册失败", user);
				}
		}
	}

/**
 * @Description  更新当前用户的个人信息 
 * @param user 当前用户的user对象（装有数据）
 * @return 	true-->成功
 *  				false-->失败
 */
	public boolean personage(User user) {
		int judge = 0;
		//成功为1 失败为0
		judge = userDao.personage(user);
		if(judge==1) 
			{
				return true;
			}
		else
			{
				return false;
			}
		}
	/**
	 * @Description 将头像的地址更新到数据库中
	 * @param user
	 * @return 布尔值
	 */
	public boolean portrait(User user) {
		int judge = 0;
		//成功为1 失败为0
		judge = userDao.portrait(user);
		if(judge==1) 
			{
				return true;
			}
		else
			{
				return false;
			}
		}
	/**
	 * @Description 查询该用户的所有信息 
	 * @param username 用户名
	 * @return user对象 --装有查询结果的信息
	 */
	public User UserInfo(String username)
	{
		User user = new User();
		user = userDao.userInfo(username);
		  if(user!=null) {
			  return user;
		  }
		  else {
			  return null;
		  }
	}
	
	/**
	 * 	@Description 通过用户id得到用户对象数据 
	 * @param userId 用户id
	 * @return user对象
	 */
	public User userInfoByUserId( int userId ){
		User user = new User();
		user = userDao.userInfoByUserId(userId);
		  if(user!=null) {
			  return user;
		  }
		  else {
			  return null;
		  }
	}
}