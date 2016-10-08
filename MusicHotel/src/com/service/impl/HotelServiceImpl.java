package com.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dao.HotelDao;
import com.page.PageInfo;
import com.po.Hotel;
import com.service.HotelService;
import com.util.DateFormat;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelDao hotelDao;
	
	//增加一个hotel
	@Override
	public void addHotel(Hotel hotel){
		
		int count = hotelDao.addHotel(hotel);
		
		if(count<1){
			System.out.println("没有添加任何新的hotel");
		}else{
			System.out.println("添加了一个新的hotel");
		}
	}
	
	//根据id查一个
	@Override
	public Hotel getHotelById(Integer hotelId) {
		Hotel hotel = null;
		hotel = hotelDao.getHotelById(hotelId);
		return hotel;
	}

	//查所有
	@Override
	public List<Hotel> getAllHotel() {
		List<Hotel> list = null;
		String sql = "SELECT * FROM hotel order by hotel_id desc";
		list = hotelDao.getHotelBySql(sql);
		return list;
	}

	//分页查
	@Override
	public List<Hotel> getHotelByPage(PageInfo pageInfo) {
		List<Hotel> list = null;
		String sql = "SELECT * FROM hotel ORDER BY hotel_id DESC LIMIT " + pageInfo.getBegin() + ",5";
		list = hotelDao.getHotelBySql(sql);
		return list;
	}

	//查询总共有多少条记录
	@Override
	public int getTotalRecordSum() {
		String sql = "SELECT COUNT(*) AS totalRecordSum FROM hotel";
		int totalRecordSum = hotelDao.getTotalRecordSum(sql);
		return totalRecordSum;
	}
	
	//查热门期刊 按喜欢人数查
		@Override
		public List<Hotel> getHotHotel() {
			List<Hotel> list = null;
			String sql = "SELECT * FROM hotel ORDER BY like_sum DESC LIMIT 0,5;";
			list = hotelDao.getHotelBySql(sql);
			return list;
		}
		
		//点收藏后 likeSum+1
		@Override
		public void addLikeSum(Integer hotelId) {
			hotelDao.addLikeSum(hotelId);
		}
		
		//点收藏后 likeSum+1
		@Override
		public void deleteLikeSum(Integer hotelId) {
			hotelDao.deleteLikeSum(hotelId);
		}

		@Override
		public int getMaxHotelId() {
			int maxHotelId = hotelDao.getMaxHotelId();
			return maxHotelId;
		}

		@Override
		public int getMinHotelId() {
			int minHotelId = hotelDao.getMinHotelId();
			return minHotelId;
		}
		
	//根据用户id来获取由用户创建的所有的hotel
	@Override
	public List<Hotel> getHotelByUserId(int userId){
		
		String sql = "select * from hotel where user_id=" + userId;
		
		List<Hotel> list = hotelDao.getHotelBySql(sql);
		
		return list;
	}
	
	//根据id删除一个hotel
	@Override
	public void deleteHotel(int hotelId){
		
		int count = hotelDao.deleteHotel(hotelId);
		
		if(count<=0){
			System.out.println("没有删除任何hotel");
		}else{
			System.out.println("删除hotel成功");
		}
	}
	
	//根据hotel的标题来获得hotel
	@Override
	public Hotel getHotelByTitile(String titile){
			
		
		Hotel hotel = null;
		String sql = "SELECT * FROM hotel WHERE title='"+titile+"'";
		
		List<Hotel> list = hotelDao.getHotelBySql(sql);
		
		if(list!=null&&list.size()>=1){
			hotel = list.get(0);
		}
		
		return hotel;
	}
	
	//上传hotel封面图片
	@Override
	public Hotel upload(HttpServletRequest request,
			Hotel hotel, MultipartFile file) {
		
		String realpath = request.getSession().getServletContext().getRealPath("");
		String txtPath = realpath + "//JSP//txt";
		String imgPath = realpath + "//JSP//img//hotel//coverImg";
		
		String desc = hotel.getHotelDesc();
		
	            try {  
	                
	            	// 生成唯一的名字避免同名覆盖
	        		System.out.println("存简介");
	        		long currentTime = System.currentTimeMillis();	        		
	        		String descFileName = currentTime + hotel.getTitle() + ".txt";
	        		System.out.println("简介文件名：" + descFileName);
	        		File descFile = new File(txtPath, descFileName);
	                
	                if(!descFile.getParentFile().exists()) {  
			            //如果目标文件所在的目录不存在，则创建父目录  
			            System.out.println("目标文件所在目录不存在，准备创建它！");  
			            if(!descFile.getParentFile().mkdirs()) {  
			                System.out.println("创建目标文件所在目录失败！");  		               
			            }  
			        }
	                // 存简介文件  
	                if (!descFile.exists()) {			    
	                	descFile.createNewFile();
	     				FileWriter fw = new FileWriter(descFile.getAbsoluteFile());
	     			   BufferedWriter bw = new BufferedWriter(fw);
	     			   bw.write(desc);
	     			   bw.close();
	     			   
	     			   hotel.setHotelDesc(descFileName);
	     			}
	     		   } catch (IOException e) {
	     				e.printStackTrace();
	     			}

	                
	             
	       
		// 上传文件
		//存文章封面
	     // 判断文件是否为空  
	        if (!file.isEmpty()) {  
	            try {  
	                
	            	// 生成唯一的名字避免同名覆盖
	        		System.out.println("生成唯一的名字避免同名覆盖");
	        		long currentTime = System.currentTimeMillis();	        		
	        		String coverImg = currentTime + file.getOriginalFilename();
	        		System.out.println("文件名：" + coverImg);
	        		File imgFile = new File(imgPath, coverImg);
	                
	                if(!imgFile.getParentFile().exists()) {  
			            //如果目标文件所在的目录不存在，则创建父目录  
			            System.out.println("目标文件所在目录不存在，准备创建它！");  
			            if(!imgFile.getParentFile().mkdirs()) {  
			                System.out.println("创建目标文件所在目录失败！");  		               
			            }  
			        }
	                // 转存文件  
	                file.transferTo(imgFile);  
	                
	                hotel.setCoverImg(coverImg);
	                
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }else{
	        	//图片文件是空   设置成defalut
	        	hotel.setCoverImg("default.jpg");;
	        }

		
		// 把上传的文件名保存到数据库相应的字段中
	    Date date = new Date();
	    hotel.setCreateDate(date);
	        
		System.out.println("hotel============"+hotel);	
		
		hotelDao.addHotel(hotel);
	
		Hotel hotelNew = this.getHotelByTitile(hotel.getTitle());
		
		return hotelNew;
	}

}
