package service;

import java.util.List;

import po.OperatingroomCustom;
import po.OperationCustom;

public interface OperatingroomService {
	
	public List<OperatingroomCustom> queryRoomList() throws Exception;
	
	public List<OperationCustom> findRoomDetail(String room_id) throws Exception;

}
