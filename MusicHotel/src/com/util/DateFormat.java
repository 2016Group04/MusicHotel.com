package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static String dateFormat(Date date){
		
		
		String dateCurrent = sdf.format(date);
		
		String dateC = dateCurrent.split(" ")[0];
		
		return dateC;
	}
	
	public static String dateFormatLong(Date date){
		String dateCurrent = sdf.format(date);
		
		return dateCurrent;
	}
	
	
	public static void main(String[] args){
		
		Date date = new Date();
		System.out.println(date);
		
		System.out.println(DateFormat.dateFormatLong(date));
	}
}
