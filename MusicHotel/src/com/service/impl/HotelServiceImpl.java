package com.service.impl;

import java.io.File;
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
import org.springframework.stereotype.Service;

import com.dao.HotelDao;
import com.page.PageInfo;
import com.po.Hotel;
import com.service.HotelService;
import com.util.WriteFile;

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
		String sql = "SELECT * FROM hotel ORDER BY hotel_id DESC LIMIT " + pageInfo.getBegin() + "," + pageInfo.getEnd();
		list = hotelDao.getHotelBySql(sql);
		return list;
	}

	@Override
	public int getTotalRecordSum() {
		String sql = "SELECT COUNT(*) AS totalRecordSum FROM hotel";
		int totalRecordSum = hotelDao.getTotalRecordSum(sql);
		return totalRecordSum;
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
		String sql = "SELECT * FROM hotel WHERE titile='"+titile+"'";
		
		List<Hotel> list = hotelDao.getHotelBySql(sql);
		
		if(list!=null&&list.size()>=1){
			hotel = list.get(0);
		}
		
		return hotel;
	}
	
	//上传hotel封面图片
	@Override
	public Hotel upload(HttpServletRequest request,
			String productImagesUploadPath,String txtUploadPath,Date date) {
		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		// 设置内存缓冲区阈值为512k
		itemFactory.setSizeThreshold(0x80000);
		String coverImg = "";
		String txtName = "";
		String style = "";
		String titile = "";
		String hotelDesc = "";
		File tempDir = new File("D:\\temp");
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
			
			String imgFileDir = "coverImg";
			String txtFileDir = "hotelDesc";
			
			while (it.hasNext()) {				
				
				FileItem item = it.next();			
				
				// 如果是文件域
				if (!item.isFormField()) {
					System.out.println("是文件域");
					coverImg = item.getName();
					long size = item.getSize();
					if ((coverImg == null || coverImg.equals("")) && size == 0) {
						fileNameList.add("");
						continue;
					}

					System.out.println("name=" + item.getName());
					System.out.println("size=" + item.getSize());

					File uploadFileDir = new File(productImagesUploadPath+"/"+imgFileDir);
					
					System.out.println("uploadFileDir:" + uploadFileDir);

					if (!uploadFileDir.exists()) {
						uploadFileDir.mkdir();
					}

					int index = coverImg.lastIndexOf(File.separator);
					if (index > 0) {// 是全路径
						coverImg = coverImg.substring(index + 1, coverImg.length());
					}

					// 生成唯一的名字避免同名覆盖
					System.out.println("生成唯一的名字避免同名覆盖");
					long currentTime = System.currentTimeMillis();
					Random random = new Random();
					int num1 = random.nextInt(10000);
					int dotPosition = coverImg.lastIndexOf(".");
					String fileBeginName = coverImg.substring(0, dotPosition);
					String fileEndName = coverImg.substring(dotPosition);
					coverImg = fileBeginName + "_" + currentTime + "_" + num1 + "_" + fileEndName;

					System.out.println("文件名：" + coverImg);

					File file = new File(uploadFileDir, coverImg);
					// 上传文件
					item.write(file);

				} else {
					// 是普通的表单域
					System.out.println("普通的表单域");
					String fieldName = item.getFieldName();
					String value = new String((item.getString("iso8859-1")).getBytes("iso8859-1"),"UTF-8"); 
					System.out.println("fieldName=" + fieldName);
					System.out.println("value=" + value);
					if (fieldName.equals("style")) {
						style = value;
					}else if (fieldName.equals("titile")) {
						titile = value;
					}else if (fieldName.equals("hotelDesc")) {
						//在此处将文件上传,使用按行写
						hotelDesc = value;
						
						String[] hoteld = value.split("\n");
						long currentTime = System.currentTimeMillis();
						Random random = new Random();
						int num1 = random.nextInt(10000);
						txtName = currentTime + num1 + ".txt";//生成一个随机的名字
						String path = txtUploadPath + "//" + txtName;
						System.out.println("path:======"+txtUploadPath);
						System.out.println("name====="+txtName);
						System.out.println("pppp======"+path);
						WriteFile.fileWriter(path, hoteld);
					}
					
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 把上传的文件名保存到数据库相应的字段中
		
		Hotel hotel = new Hotel();
		
		hotel.setCoverImg(coverImg);
		hotel.setStyle(style);
		hotel.setTitile(titile);
		hotel.setHotelDesc(txtName);
		hotel.setCreateDate(date);
		System.out.println("hotel============"+hotel);
		
		hotelDao.addHotel(hotel);
	
		Hotel hotelNew = this.getHotelByTitile(titile);
		
		return hotelNew;
	}

}
