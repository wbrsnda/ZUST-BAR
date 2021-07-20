package com.wql.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * @Description PO 与数据库中的user表相映射 存放与用户登录注册和个人信息有关的数据
 * @author 吴奇隆
 * @time 2021.7
 */
public class User {

	 /**
	  * 用户id
	  */
	private int userId; 
	/**
	 * 用户名
	 */
	private String username;  
	/**
	 * 密码
	 */
	private String password;  
	/**
	 * 管理员权限的区分,默认为普通用户，以及黑名单
	 */
	private int status=0;
	/**
	 * 是否被举报的状态量 0-----未被举报  1-------被举报
	 */
	private String gender;
	/**
	 * 性别
	 */
	private String mail;
	/**
	 * 邮箱
	 */
	private String phone;
	/**
	 * 电话
	 */
	private java.sql.Timestamp titleTime ;
	
	/**
	 * 头像------  --- -图片地址
	 */
	private String portrait;
	/**
	 * 个性签名---能存250个中文字符
	 */
	private String signature;
	/**
	 * 自我介绍
	 */
	private  String selfIntroduc;
	/**
	 * 用户昵称
	 */
	private String nickname;
/**
 * 用户的地址
 */
	private String address;
	/**
	 * 用户注册时间
	 */
	private java.sql.Timestamp time ;
	/**
	 * @param userId
	 * @param username
	 * @param password
	 * @param status
	 * @param gender
	 * @param mail
	 * @param phone
	 * @param titleTime
	 * @param portrait
	 * @param signature
	 * @param selfIntroduc
	 * @param nickname
	 * @param address
	 * @param time
	 */
	public User(int userId, String username, String password, int status, String gender,String mail,String phone, Timestamp titleTime,
			String portrait, String signature, String selfIntroduc, String nickname, String address, Timestamp time)
	{
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.status = status;
		this.gender = gender;
		this.mail = mail;
		this.phone = phone;
		this.titleTime = titleTime;
		this.portrait = portrait;
		this.signature = signature;
		this.selfIntroduc = selfIntroduc;
		this.nickname = nickname;
		this.address = address;
		this.time = time;
	}
	/**
	 * 
	 */
	public User()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public String getGender(){return gender;}
	public void setGender(String gender){this.gender=gender;}
	public String getMail(){return mail;}
	public void setMail(String mail){this.mail=mail;}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public java.sql.Timestamp getTitleTime()
	{
		return titleTime;
	}
	public void setTitleTime(java.sql.Timestamp titleTime)
	{
		this.titleTime = titleTime;
	}
	public String getPortrait()
	{
		return portrait;
	}
	public void setPortrait(String portrait)
	{
		this.portrait = portrait;
	}
	public String getSignature()
	{
		return signature;
	}
	public void setSignature(String signature)
	{
		this.signature = signature;
	}
	public String getSelfIntroduc()
	{
		return selfIntroduc;
	}
	public void setSelfIntroduc(String selfIntroduc)
	{
		this.selfIntroduc = selfIntroduc;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getTime()
	{
		//更改其时间格式
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return  df.format(time);
	}
	public void setTime(java.sql.Timestamp time)
	{
		this.time = time;
	}
}
