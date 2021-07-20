package com.wql.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wql.entity.Privatemail;
import org.json.JSONObject;

import com.wql.dao.UserDao;
import com.wql.daoImpl.UserDaoImpl;
import com.wql.entity.Page;
import com.wql.entity.User;
import com.wql.service.PrivateMailService;
import com.wql.service.FriendOperationService;

/**
 * @Description 用于私信的数据处理和页面的跳转
 * @author 吴奇隆
 * @time 2021.7
 */
@WebServlet("/PrivateMailServlet")
public class PrivateMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PRIVATEMAIL_PAGE = "/jsp/privatemail.jsp";
	 private static final String PRIVATEMAIL_SHOW_PAGE = "/jsp/privatemail_show.jsp";
	 /**
	  * 黑名单的页面--提醒用户不能进行使用私信的功能
	  */
	 private static final String BLACKLIST_PAGE = "/jsp/blacklist.jsp";
	 @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FriendOperationService friendOperationService = new FriendOperationService() ;
		PrivateMailService privateMailService = new PrivateMailService() ;
		UserDao userDao = new  UserDaoImpl();
		// 改成中文编码
				request.setCharacterEncoding("utf-8");
				 // 得到session---拿到当前用户的用户id
				HttpSession session = request.getSession();
				User u = null; 
				u =  new User();
				u = (User) session.getAttribute("userInfo");
			   int userId = 0;
				  /**
					 * 当前用户的id值
					 */
				if (u != null) { userId = u.getUserId(); }
				// 将分页所需的字段，封装到page对象中
				Page page = new Page();
				int currentPage = 1;
				// 当前要显示的页面---超链接里面的请求数据
				String currentPageStr = request.getParameter("currentPage");
				// 第一页--默认的页面
				if (currentPageStr == null || "".equals(currentPageStr))
					{
						currentPage = 1;
					}
				else
					{
						// 当前页--用户选择的页面数
						currentPage = Integer.parseInt(currentPageStr);
					}
						// 一页的大小
						int pageSize = 10;
		
					
						//定义被对话的用户的id
						int toUserId = 0  ;
						String toUserIdStr = request.getParameter("to_user_id");
						if( toUserIdStr==null  ||  "".equals ( toUserIdStr ) )
							{                                                              }
						//将被对话的用户的id的字符串形式解析为int类型
						else 
							{
							toUserId = Integer.parseInt(toUserIdStr);
							//放在request域中
							request.setAttribute("toUserId", toUserId);
							//得到昵称，并放在session中
							session.setAttribute("nickname", userDao.userInfoByUserId(toUserId).getNickname());
							}		
						
						//对双方的好友关系进行判断，返回结果
						int status1= friendOperationService.friendQuery(userId, toUserId);
						int status2= friendOperationService.friendQuery( toUserId , userId);
						//被拉黑的情况下
						if(status1 == 3 || status2 ==3 ) {
							//返回消息的值
							request.setAttribute("msg", "黑名单限制");
							// 跳转到blacklist.jsp的页面
							request.getRequestDispatcher(BLACKLIST_PAGE).forward(request, response);
							return;
						}
									
					//预处理的功能
					//当前要显示的页面---私信对话功能- -超链接里面的请求所对应的实现方式
					 String preMethod = request.getParameter("pre_method"); 
					 if(preMethod!=null ) 
						 {
							//请求的方法
							request.setAttribute("pre_method", preMethod);
							

								//对消息进行预处理----进行私信对话
								switch (preMethod) 
									{ 
								  		//用户进行了私信对话的内容的提交
										case "privatemail_content":
												{    
													//对话的内容--content
													String content = request.getParameter("content");
													if( content!=null  && !"".equals ( content ) )
														{   
															//设置文本框中的内容的设置
															request.setAttribute("content", content);                           
															//用户评论的内容
															String chatMsg = request.getParameter("content");
															
													
															//将数据组装到一个对象中
																Privatemail privatemail = new Privatemail() ;
															privatemail.setFromUserId(userId);
															privatemail.setToUserId(toUserId);
															privatemail.setChatMsg(chatMsg);
															if ( privateMailService.privatemailInsert(privatemail) )
															{
																System.out.println("私信消息增加成功");
															}
														}
													else 
														{
													
														}	
												}
										default: break; 
									}
						 }
						else {			}
							
					
						
						
						
						
						
						// 当前要显示的页面---超链接里面的请求所对应的实现方式
						String method = request.getParameter("method");
						// 请求的方法
						request.setAttribute("method", method);
						//switch多重选择
						switch (method)
						{
								// 我的私信列表
								case "my_privatemail_list":
									{
										// 总数据数
										int totalCount = privateMailService.getTotalCount( userId );
						
										// 组装page对象
										// 先set totalCount属性 作为分子
										page.setTotalCount(totalCount);
										page.setCurrentPage(currentPage);
										page.setPageSize(pageSize);
						
										/**
										 * 拿到数据集合--分页
										 */
										List<Privatemail> privatemails = new ArrayList<Privatemail>();
										privatemails = privateMailService.queryPrivatemailByPage(currentPage, pageSize, userId);
										//放入page对象中
										page.setObjects(privatemails);
										// 将数据传给request
										request.setAttribute("p", page);
										request.setAttribute("msg", "我的私信");
						
										// 跳转到privatemail.jsp的页面
										request.getRequestDispatcher(PRIVATEMAIL_PAGE).forward(request, response);
										return;
									}
								case"privatemail_show":
									{
										
										// 跳转到privatemail_show.jsp的页面
										request.getRequestDispatcher(PRIVATEMAIL_SHOW_PAGE).forward(request, response);
										return;
									}
									
									//私信对话消息区中的显示
								case"privatemail_show_details":
									{
										// 总数据数
										int totalCount = privateMailService.getShowCount(userId, toUserId) ;
						
										// 组装page对象
										// 先set totalCount属性 作为分子
										page.setTotalCount(totalCount);
										page.setCurrentPage(currentPage);
										page.setPageSize(pageSize);
						
										/**
										 * 拿到数据集合--根据评论分页后得到的数据进行查询并且返回结果--得到的是私信对话记录的数据集合
										 */
										List<Privatemail> privatemails = new ArrayList<Privatemail>();
										privatemails = privateMailService.queryShowByPage(currentPage, pageSize, userId, toUserId);
										
										page.setObjects(privatemails);
										//1、使用JSONObject
										JSONObject json = new JSONObject(page);
										
										//JSON对象转化为字符串
								        String strJson=json.toString();
								        
								        System.out.println("私信对话的展示privatemail--"+"strJson:"+strJson);
								        response.setContentType("text/html;charset=UTF-8");
										//用输出流--将数据传给doumail_show.jsp的页面--动态刷新
								        PrintWriter writer = response.getWriter();
								        writer.write(strJson);
								        //数据量较大的情况下用flush
								        writer.flush();
										return;
									}	
									default: break;
								}
	}


	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
