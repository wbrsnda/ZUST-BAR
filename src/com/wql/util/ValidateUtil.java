package com.wql.util;

/**
 * @Description  验证用户名和密码、性别、邮箱、电话是否在数据库中已经存在，如果已存在则返回真，没有则返回假
 * @author 吴奇隆
 * @time 2021.7
 */
public class ValidateUtil {
	/**
	 * @Description 类方法 判空处理 验证用户名
	 * @param userName
	 * @return
	 */
	public static boolean isInvalidUserName(String userName){
		if(userName == null || userName.equals("")){
			System.out.println("isInvalidUserName");
			return true;
		}
		return false;
	}
/**
 * @Description 判断密码是否为空 
 * @param password
 * @return 布尔值
 */
	public static boolean isInvalidPassword(String password){
		if(password == null || password.equals("")){
			return true;
		}
		return false;
	}
	/**
	 * @Description 判断性别是否为空
	 * @param gender
	 * @return 布尔值
	 */
	public static boolean isInvalidGender(String gender){
		if(gender == null || gender.equals("")){
			return true;
		}
		return false;
	}
	/**
	 * @Description 判断邮箱是否为空
	 * @param mail
	 * @return 布尔值
	 */
	public static boolean isInvalidMail(String mail){
		if(mail == null || mail.equals("")){
			return true;
		}
		return false;
	}
	/**
	 * @Description 判断电话是否为空
	 * @param phone
	 * @return 布尔值
	 */
	public static boolean isInvalidPhone(String phone){
		if(phone == null || phone.equals("")){
			return true;
		}
		return false;
	}
}
