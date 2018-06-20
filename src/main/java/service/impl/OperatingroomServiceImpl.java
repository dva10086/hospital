package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import mapper.OperatingroomDao;
import mapper.OperationDao;
import po.OperatingroomCustom;
import po.OperationCustom;
import service.OperatingroomService;

public class OperatingroomServiceImpl implements OperatingroomService{
	
	@Autowired
	private OperatingroomDao operatingroomDao;
	@Autowired
	private OperationDao operationDao;

	public List<OperatingroomCustom> queryRoomList() throws Exception {
		// TODO Auto-generated method stub
		
		return operatingroomDao.queryRoomList();
	}

	public List<OperationCustom> findRoomDetail(String room_id) throws Exception {
		// TODO Auto-generated method stub
		
		return operationDao.findRoomDetail(room_id);
	}

}
