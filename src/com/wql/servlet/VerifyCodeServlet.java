package com.wql.servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wql.util.VerifyCode;

import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @Description  用来生成图片验证码
 * @author 吴奇隆
 * @time 2021.7
 */
@WebServlet(name = "VerifyCodeServlet", value = "/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //创建util中的负责生成验证码图片的对象
    	VerifyCode vc = new VerifyCode();
        //获取图片对象
        BufferedImage bi = vc.getImage();
        //获得图片的文本内容
        String text = vc.getText();
        // 将系统生成的文本内容保存到session中
        request.getSession().setAttribute("text", text);
        //向浏览器输出图片
        VerifyCode.output(bi, response.getOutputStream());
    }
}
