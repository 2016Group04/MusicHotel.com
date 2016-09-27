package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HotelDao;
import com.page.PageInfo;
import com.po.Hotel;
import com.service.HotelService;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelDao hotelDao;
	
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

}
