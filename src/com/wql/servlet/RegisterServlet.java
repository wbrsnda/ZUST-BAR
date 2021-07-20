package com.wql.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wql.bean.Msg;
import com.wql.entity.User;
import com.wql.service.UserService;
import com.wql.util.MD5Util;
/**
 * @Description 用户注册 
 * @author 吴奇隆
 * @time 2021.7
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		static final String REGISTER_USER_SECCESSS = "用户登录成功";
		static final String USERNAME_EMPTY="用户名为空";
		static final String PASSWORD_EMPTY="密码为空";
		static final String USERNAME_REPETITION="用户名重复";
		static final String GENDER_EMPTY="性别为空";
		static final String MAIL_EMPTY="邮箱为空";
		static final String PHONE_EMPTY="电话为空";

		static final String REGISTER_SUCCESS="注册成功";
/**
 * 注册成功之后跳转到登录界面
 */
		private static final String LOGIN_VIEW = "/jsp/login.jsp";
		private static final String FAILED_VIEW = "/jsp/register.jsp";
		/**
		 * 调用service层的方法
		 */
		UserService us = new UserService();
		User user = new User();
		Msg msg = new Msg();

		
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			//设置utf-8编码
			request.setCharacterEncoding("utf-8");
			
			  //拿到request中的信息，即表单中的用户名和密码 
			  String name = request.getParameter("uname");
			  String pwd1 = request.getParameter("upwd");
			  String gender = request.getParameter("gender");
			  String mail = request.getParameter("mail");
			  String phone = request.getParameter("phone");

			  //pwd用md5加密
			    String pwd = MD5Util.MD5Encode(pwd1,"utf8");

			  
			  //调用service层的注册功能
			  msg= us.register(name,pwd,gender,mail,phone);
			  
			  //对调用的结果进行分析，并且进行不同的处理
		
		  if(USERNAME_EMPTY.equals(msg.getResult())) 
		  {
			 request.setAttribute("errorMsg", "用户名为空"); 
		  request.getRequestDispatcher(FAILED_VIEW).forward(request, response);
		  return ;
		  } 
		  else  if(PASSWORD_EMPTY .equals(msg.getResult()))
		  			{
			  			request.setAttribute("errorMsg", "密码为空");
			  			request.getRequestDispatcher(FAILED_VIEW).forward(request, response); 
			  			return;
			  			}
		  			else  if(USERNAME_REPETITION.equals(msg.getResult())) 
		  			{
		  					request.setAttribute("errorMsg", "用户名重复");
		  					request.getRequestDispatcher(FAILED_VIEW).forward(request, response); 
		  					return;
		  					
		  			}
		  else  if(GENDER_EMPTY .equals(msg.getResult()))
		  {
			  request.setAttribute("errorMsg", "性别为空");
			  request.getRequestDispatcher(FAILED_VIEW).forward(request, response);
			  return;
		  }
		  else  if(MAIL_EMPTY .equals(msg.getResult()))
		  {
			  request.setAttribute("errorMsg", "邮箱为空");
			  request.getRequestDispatcher(FAILED_VIEW).forward(request, response);
			  return;
		  }
		  else  if(PHONE_EMPTY .equals(msg.getResult()))
		  {
			  request.setAttribute("errorMsg", "电话为空");
			  request.getRequestDispatcher(FAILED_VIEW).forward(request, response);
			  return;
		  }
				  			else  if(REGISTER_SUCCESS.equals(msg.getResult())) 
						  	{
				  					System.out.println("在RegisterServlet中-----------注册成功");
				  					request.setAttribute("errorMsg", "注册成功");
				  					request.getRequestDispatcher(LOGIN_VIEW).forward(request, response); 
				  					return;
				  					}
		 
			  }

		@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
