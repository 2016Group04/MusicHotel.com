package com.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RandomCodeServlet extends HttpServlet {

	
	    //验证码图片的宽度。
	    private int width=80;
	    //验证码图片的高度。
	    private int height=30;
	    
	    /**
	     * 功能：动态生成验证码图片
	     * 
	     */
	    protected void service(HttpServletRequest request,HttpServletResponse response)
	    	throws ServletException,IOException{
	    	
	    	
	    	BufferedImage img = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	    	Graphics2D gd = img.createGraphics();
	    	
	    	//给生成的2D图片填充颜色
	    	gd.setColor(Color.WHITE);
	    	gd.fillRect(0, 0, width, height);
	    	
	    	//生成字体，字体的大小是根据图片的大小来决定的
	    	Font font = new Font("Times New Roman",Font.ITALIC,20);
	    	//用生成的字体来设置字体
	    	gd.setFont(font);
	    	
	    	//给图片画上边框
	    	gd.setColor(Color.BLACK);
	    	gd.drawRect(0, 0, width-1, height-1);
	    	
	    	//创建一个随机数类
	    	Random random = new Random();
	    	
	    	//随机产生100条干扰线
	    	gd.setColor(Color.LIGHT_GRAY);
	    	for(int i=0;i<160;i++){
	    		
	    		int x = random.nextInt(width);
	    		int y = random.nextInt(height);
	    		int x1 = random.nextInt(10);
	    		int y1 = random.nextInt(10);
	    		gd.drawLine(x, y, x+x1, y+y1);
	    	}
	    	
	    	//把生成的验证码放在一个变量中，以便后来和用户输入的进行比较
	    	StringBuffer sbf = new StringBuffer();
	    	
	    	//随机产生四位验证码
	    	String[] str = {"0","1","2","3","4","5","6","7","8","9","q","Q","w","W","e","E",
	    			"r","R","T","t","y","Y","u","U","i","I","O","o","p","P",
	    			"a","A","S","s","d","D","f","F","g","G","h","H","j","J",
	    			"k","K","L","l","z","Z","x","X","c","C","v","V","B","b","n","N","m","m"};
	    	
	    	//颜色分量
	    	int red = 0;
	    	int green = 0;
	    	int blue = 0;
	    	for(int i=0;i<4;i++){
	    		//在字符串数组中随机选择一个字符串
	    		int j = random.nextInt(61);
	    		String s = str[j];
	    		//随机产生颜色分量，以便验证码在图片中的颜色不一样
	    		red = random.nextInt(110);
	    		green = random.nextInt(50);
	    		blue = random.nextInt(50);
	    		
	    		//用随机的颜色将验证码绘制到图片中
	    		gd.setColor(new Color(red,green,blue));
	    		gd.drawString(s, 13*i+20, 20);
	    		
	    		sbf.append(s);
	    	}
	    	
	    	//将随机生成的验证码放在session中
	    	HttpSession session = request.getSession(true);
	    	session.setAttribute("randomCode", sbf.toString());
	    	
	    	//禁止图像缓存
	    	 response.setHeader("Pragma","no-cache");
	    	 response.setHeader("Cache-Control","no-cache");
	    	 response.setDateHeader("Expires", 0);
	    	 response.setContentType("image/jpeg");
	    	 
	    	 //将图像输出到servlet输出流中
	    	 ServletOutputStream sos = response.getOutputStream();
	    	 ImageIO.write(img, "jpeg", sos);
	    	 sos.close();
	    }
	    
	    
}
