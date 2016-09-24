package com.service.impl;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.service.JavaMailService;
@Service
public class JavaMailServiceImpl implements JavaMailService{

	private String mailHost = "smtp.sina.com";
	private String mailPort = "25";
	private String username = "271429728qq@sina.com";
	private String password = "zhang19941215";
	
	private Properties props = new Properties();
	@Override
	public boolean sendTextMail(String from, String to, String subject,
			String content) {
		
		boolean flag = true;
		
		//设置一下javaMail 需要的基本配置信息 
		props.put("mail.smtp.host", mailHost);
		//props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", mailPort);
		props.setProperty("mail.smtp.socketFactory.port", mailPort);
		props.setProperty("mail.smtp.auth", "true");
		
		
		
		
		try {
			Message message = getMessage(from,to,subject,content);
			Transport.send(message);
		} catch (AddressException e) {
			flag = false;
			e.printStackTrace();
		} catch (MessagingException e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public Message getMessage(String from, String to, String subject,
			String content) throws AddressException, MessagingException{
		Message message = null;
		
		//建立一个 邮件客户端  和  smtp服务器之间的会话
		Session session = Session.getDefaultInstance(props, 
				new Authenticator(){

					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						
						return new PasswordAuthentication(username,password);
					}
			
			
		});
		
		message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setSubject(subject);
		message.setSentDate(new Date());
		message.setContent(content, "text/html;charset=utf-8");
		
		return message;
	}
}
