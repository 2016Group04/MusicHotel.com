package com.service.impl;

import java.io.File;
import java.util.ArrayList;
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

import com.dao.MusicDao;
import com.po.Music;
import com.service.MusicService;
import com.util.Base64;
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
	public int deleteMusic(int musicId) {
		int count=dao.deleteMusic(musicId);
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
	public List<Integer> upload(HttpServletRequest request,
			String productImagesUploadPath) {
		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		// 设置内存缓冲区阈值为512k
		itemFactory.setSizeThreshold(0x80000);
		String coverImg = "";
		String path = "";
		String title  ="";
		String hotelId = "";
		String album = "";
		String genre = "";
		String artist = "";
		File tempDir = new File("D:\\temp");
		
		List<String> musicName = new ArrayList<String>();
		if (!tempDir.exists()) {
			tempDir.mkdir();
		}// 设置临时文件目录
		itemFactory.setRepository(tempDir);

		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		// 设置上传文件的最大数据量 10M
		fileUpload.setFileSizeMax(0xA00000);

		// 解析上传文件流，得到FileItem对象的列表
		List<String> fileNameList = new ArrayList<String>();
		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);

			System.out.println("size=" + fileItems.size());

			Iterator<FileItem> it = fileItems.iterator();
			
			
			
			while (it.hasNext()) {				
				
				FileItem item = it.next();			
				
				// 如果是文件域
				if (!item.isFormField()) {
					System.out.println("是文件域");
					path = item.getName();
					long size = item.getSize();
					System.out.println("name====="+path);
					System.out.println("size====="+size);
					if ((path == null || path.equals("")) && size == 0) {
						fileNameList.add("");
						continue;
					}

					System.out.println("name=" + item.getName());
					System.out.println("size=" + item.getSize());

					File uploadFileDir = new File(productImagesUploadPath);
					
					System.out.println("uploadFileDir:" + uploadFileDir);

					if (!uploadFileDir.exists()) {
						uploadFileDir.mkdir();
					}

					int index = path.lastIndexOf(File.separator);
					if (index > 0) {// 是全路径
						path = path.substring(index + 1, path.length());
					}

					// 生成唯一的名字避免同名覆盖
					System.out.println("生成唯一的名字避免同名覆盖");
					long currentTime = System.currentTimeMillis();
					Random random = new Random();
					int num1 = random.nextInt(10000);
					int dotPosition = path.lastIndexOf(".");
					String fileBeginName = path.substring(0, dotPosition);
					String fileEndName = path.substring(dotPosition);
					path = fileBeginName + "_" + currentTime + "_" + num1 + "_" + fileEndName;

					System.out.println("文件名：" + path);

					File file = new File(uploadFileDir, path);
					// 上传文件
					item.write(file);
					
					

				} else {
					// 是普通的表单域
					System.out.println("普通的表单域");
					String fieldName = item.getFieldName();
					String value = new String((item.getString()).getBytes("iso-8859-1"),"UTF-8"); 
					System.out.println("fieldName=" + fieldName);
					
					if("hotelId".equals(fieldName)){
						
						hotelId = value;
						System.out.println("hotelId==="+hotelId);
					}else if("title".equals(fieldName)){
						
						title = value;
						System.out.println("title==="+title);
					}else if("artist".equals(fieldName)){
						
						artist = value;
						System.out.println("artist===="+artist);
					}else if("album".equals(fieldName)){
						
						album = value;
						System.out.println("album===="+album);
					}else if("genre".equals(fieldName)){
						
						genre = value;
						System.out.println("genre===="+genre);
					}else if("coverImg".equals(fieldName)){
						String base64 = value;//获得是base64的值
						System.out.println("base64===="+base64);
						long currentTime = System.currentTimeMillis();
						Random random = new Random();
						int num1 = random.nextInt(10000);
						
						coverImg = currentTime + "_" + num1 + ".png";
						
						Base64.decodeBase64ToImage(base64, productImagesUploadPath+"\\coverImg\\", coverImg);
						
					}
					
					
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		List<Integer> list = new ArrayList<Integer>();
		
		
		list.add(new Integer(hotelId));
		
		Music music = new Music();
		
		music.setAlbum(album);
		music.setArtist(artist);
		music.setCoverImg(coverImg);
		music.setGenre(genre);
		music.setPath(path);
		music.setTitile(title);
		
		this.addMusic(music);
		
		Music musicNew = this.getMusicByPath(path);
		
		list.add(musicNew.getMusicId());
		
		return list;
	}

}
