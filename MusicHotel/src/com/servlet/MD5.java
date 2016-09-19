package com.servlet;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

	/**
	 * 
	 * @param source需要加密的字符串
	 * @return 加密之后的32位字符串
	 */
	public static String getHash(String password){
		
		//用来将字节转换成16进制表示的字符
		char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};  
		 
		try {
			//得到一个转换类
			MessageDigest md = MessageDigest.getInstance("MD5");
			
			md.update(password.getBytes());//通过update方法处理数据，使密码数组更新摘要
			
			byte[] encryptStr = md.digest();//密文完成哈希计算，获得得到的128位的长整数
			
			char[] str = new char[16*2];//每个字节用16进制表示，使用2个字符
			
			int k =0;
			
			for(int i=0;i<16;i++){
				 byte byte0 = encryptStr[i]; // 取第 i 个字节  
	             str[k++] = hexDigits[byte0 >>> 4 & 0xf]; // 取字节中高 4 位的数字转换, >>> 为逻辑右移，将符号位一起右移  
	             str[k++] = hexDigits[byte0 & 0xf]; // 取字节中低 4 位的数字转换
			}
			
			 return new String(str); // 换后的结果转换为字符串  
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	 public static void main(String[] args) {  
	        System.out.println(getHash("zyy06057727")); 
	 }
}
