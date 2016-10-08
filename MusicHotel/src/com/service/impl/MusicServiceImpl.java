package com.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.MusicDao;
import com.po.Hotel;
import com.po.Music;
import com.service.MusicService;
import com.util.WriteFile;
@Service
public class MusicServiceImpl implements MusicService {
	
	@Autowired
	private MusicDao dao;

	
	@Override
	public int addMusic(Music music) {
		
		int count=dao.addMusic(music);
		return count;
	}

	@Override
	public int deleteMusic(Music music,String path) {
		
		//删除歌曲的时候，要把歌曲的封面信息和歌曲文件一起删除
		int count=dao.deleteMusic(music.getMusicId());
		if("music/coverImg/default.jpg".equals(music.getCoverImg())){
			
			//默认封面不用删
		}else{
			
			File file1 = new File(path+"//"+music.getCoverImg());
			File file2 = new File(path+"//"+music.getPath());
			
			if(file1.exists()){
				file1.delete();
			}
			
			if(file2.exists()){
				file2.delete();
			}
		}
		
		
		return count;
	}

	@Override
	public int updateMusic(Music music) {
	
		int count=dao.updateMusic(music);
		return count;
	}

	@Override
	public List<Music> getMusicByMusicId(List<Integer> list) {
		
		List<Music> list1 = new ArrayList<Music>();
		
		Iterator<Integer> i = list.iterator();
		while(i.hasNext()){
			Integer in = i.next();
			Music music = dao.getMusicByMusicId(in);
			list1.add(music);
		}
		
		return list1;
	}
	
	//根据MusicId来查找
	public Music getMusicByMusicId(int musicId){
		Music music = null;
		
		music = dao.getMusicByMusicId(musicId);
		
		return music;
		
	}
	
	
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml");
		MusicServiceImpl service=(MusicServiceImpl)context.getBean("musicService");
		Music music= new Music();
		
	}
	
	//根据音乐文件的名字来得到music
	@Override
	public Music getMusicByPath(String path){
	
		Music music = null;
		
		String sql = "SELECT * FROM music WHERE path='"+path+"'";
		List<Music> list = dao.getMusicBySql(sql);
		
		if(list!=null&&list.size()>=1){
			music = list.get(0);
		}
		return music;
			
	}
	
	
	//上传音乐文件
	@Override
	public int upload(HttpServletRequest request,
			Music music, int hotelId, MultipartFile file) {
		
		String realpath = request.getSession().getServletContext().getRealPath("");
		String musicPath = realpath + "//JSP//music";
		
		String base64 = music.getCoverImg();
		if(base64.equals("music/coverImg/default.jpg")){
	            try {  
	                //存图片
	            	// 生成唯一的名字避免同名覆盖
	        		System.out.println("存图片");
	        		long currentTime = System.currentTimeMillis();	        		
	        		String imgFileName = currentTime + music.getTitle();
	        		System.out.println("图片文件名：" + imgFileName);
	        		File imgFile = new File(musicPath, imgFileName);
	                
	                if(!imgFile.getParentFile().exists()) {  
			            //如果目标文件所在的目录不存在，则创建父目录  
			            System.out.println("目标文件所在目录不存在，准备创建它！");  
			            if(!imgFile.getParentFile().mkdirs()) {  
			                System.out.println("创建目标文件所在目录失败！");  		               
			            }  
			        }
	                // 存简介文件  
	                if (!imgFile.exists()) {			    
	                	imgFile.createNewFile();
	     				FileWriter fw = new FileWriter(imgFile.getAbsoluteFile());
	     			   BufferedWriter bw = new BufferedWriter(fw);
	     			   bw.write(base64);
	     			   bw.close();
	     			   
	     			   music.setCoverImg(imgFileName);
	     			}
	     		   } catch (IOException e) {
	     				e.printStackTrace();
	     			}

		}else{
			music.setCoverImg(base64);
		}   
	             
	       
		// 上传音乐文件
	     // 判断文件是否为空  
	        if (!file.isEmpty()) {  
	            try {  
	                
	            	// 生成唯一的名字避免同名覆盖
	        		System.out.println("生成唯一的名字避免同名覆盖");
	        		long currentTime = System.currentTimeMillis();	        		
	        		String musicFileName = currentTime + file.getOriginalFilename();
	        		System.out.println("文件名：" + musicFileName);
	        		File musicFile = new File(musicPath, musicFileName);
	                
	                if(!musicFile.getParentFile().exists()) {  
			            //如果目标文件所在的目录不存在，则创建父目录  
			            System.out.println("目标文件所在目录不存在，准备创建它！");  
			            if(!musicFile.getParentFile().mkdirs()) {  
			                System.out.println("创建目标文件所在目录失败！");  		               
			            }  
			        }
	                // 转存文件  
	                file.transferTo(musicFile);  
	                
	                music.setPath(musicFileName);
	                
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }
	
		  
		
	        
		System.out.println("hotel============"+music);	
		
		this.addMusic(music);
		 
		int musicId = this.getMusicByPath(music.getPath()).getMusicId();
		return musicId;
	}
	
	//删除列表中的所有的歌曲
	@Override
	public void deleteMusicByList(List<Integer> list,String path){
		
		Iterator<Integer> i = list.iterator();
		
		while(i.hasNext()){
			
			int musicId = i.next(); 
			
			Music music = this.getMusicByMusicId(musicId);
			
			this.deleteMusic(music, path);
		}
	}
	
	// 根据传过来的Music查数据库，歌名、专辑名、歌手相同就认为是同一首歌
		//返回已存在音乐的id，或者没存在返回0
		@Override
		public int ifExist (Music music){
			int musicId = 0;
			
			musicId = dao.ifExist(music);
			
			return musicId;
		}
		
		//上传音乐文件
			@Override
			public void uploadOneMusic(Music music, HttpServletRequest request, MultipartFile file) {
				
				String path = request.getSession().getServletContext().getRealPath("/") + "upload/";
				
				
				String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			     Random random=new Random();
			     StringBuffer sb=new StringBuffer();
			     for(int i=0;i<30;i++){
			       int number=random.nextInt(62);
			       sb.append(str.charAt(number));
			     }
			     String imgFile = sb.toString();
			     
				
				//存专辑封面
				String base64 = music.getCoverImg();
				
				File img = new File(path + "cover/" + imgFile);
				try {
					
					if(!img.getParentFile().exists()) {  
			            //如果目标文件所在的目录不存在，则创建父目录  
			            System.out.println("目标文件所在目录不存在，准备创建它！");  
			            if(!img.getParentFile().mkdirs()) {  
			                System.out.println("创建目标文件所在目录失败！");  		               
			            }  
			        }  
					
				   if (!img.exists()) {			    
						img.createNewFile();
						FileWriter fw = new FileWriter(img.getAbsoluteFile());
					   BufferedWriter bw = new BufferedWriter(fw);
					   bw.write(base64);
					   bw.close();
					   //把封面图片由原来的base64改为存base64的文件名
					   music.setCoverImg(imgFile);
					}
				   } catch (IOException e) {
						e.printStackTrace();
					}
				   
				
				//存音乐文件
				 // 判断文件是否为空  
		        if (!file.isEmpty()) {  
		            try {  
		                // 音乐文件保存路径  
		                String filePath = path + "music/" + file.getOriginalFilename();  
		                
		                File musicFile = new File(filePath);
		                
		                if(!musicFile.getParentFile().exists()) {  
				            //如果目标文件所在的目录不存在，则创建父目录  
				            System.out.println("目标文件所在目录不存在，准备创建它！");  
				            if(!musicFile.getParentFile().mkdirs()) {  
				                System.out.println("创建目标文件所在目录失败！");  		               
				            }  
				        }
		                // 转存文件  
		                file.transferTo(musicFile);  
		            } catch (Exception e) {  
		                e.printStackTrace();  
		            }  
		        } 
		        
		      //在数据库中插入记录
				dao.addMusic(music);
				System.out.println("音乐已上传，成功插入记录到数据库");
				System.out.println(music.getTitle());
			}
		

}
