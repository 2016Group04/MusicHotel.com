package com.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class WriteFile {

	 public static void fileWriter(String fileName,String[] clist) throws IOException{
	        //创建一个FileWriter对象
	        FileWriter fw = new FileWriter(fileName);
	        //遍历clist集合写入到fileName中
	      for(String str:clist){
	            fw.write(str);
	            fw.write("\n");
	      }
	        //刷新缓冲区
	        fw.flush();
	        //关闭文件流对象
	        fw.close();
	   }
	 
	 
	 public static String[] fileReader(String filepath){
		 FileReader reader =null;
	        BufferedReader bufferedReader =null;
	        String[] hotelDesc = new String[100];
	        try{
	        reader = new FileReader(filepath);    
	        bufferedReader = new BufferedReader(reader);
	       
	        String s = "";
	        int i = 0;
	        while(true){
	            s =bufferedReader.readLine();
	            if(s ==null){
	                break;
	            }
	           //System.out.println("read===="+s);
	           hotelDesc[i] = s;
	           i++;
	        }
	            

	        
	        }catch(Exception e){
	            System.out.println(e);
	        }
	        finally{
	            try{
	                bufferedReader.close();
	                reader.close();

	            }catch(Exception e){
	                System.out.println(e);
	            }
	        }
	        
	        
	        return hotelDesc;
	 }
	 
	 public static String baseReader(String filepath){
		 FileReader reader =null;
	        BufferedReader bufferedReader =null;
	        String c = "";
	        try{
	        reader = new FileReader(filepath);    
	        bufferedReader = new BufferedReader(reader);
	       
	        String s = "";
	        
	        while(true){
	            s =bufferedReader.readLine();
	            if(s ==null){
	                break;
	            }
	           //System.out.println("read===="+s);
	         c = c + s;
	        }
	            

	        
	        }catch(Exception e){
	            System.out.println(e);
	        }
	        finally{
	            try{
	                bufferedReader.close();
	                reader.close();

	            }catch(Exception e){
	                System.out.println(e);
	            }
	        }
	        
	        
	        return c;
	 }
}
