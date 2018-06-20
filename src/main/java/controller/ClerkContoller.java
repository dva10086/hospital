package controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import po.OperatingroomCustom;
import po.Operation;
import po.OperationCustom;
import service.OperatingroomService;
import service.OperationService;

@Controller
@RequestMapping("/jsp")
public class ClerkContoller {
	
	@Autowired
	public OperationService operationService;
	@Autowired
	public OperatingroomService operatingroomService;
	
	//查询所有手术信息
	@RequestMapping("/queryOperation.action")
	public ModelAndView queryOperation() throws Exception {
		
		List<OperationCustom> operationList = operationService.queryOperationList();
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("operationList",operationList);
		
		modelandview.setViewName("operation_index");
		
		return modelandview;
	}
	
	//查看某一个手术
	@RequestMapping("/singleOperation.action")
	public ModelAndView singleOperation(String id) throws Exception {
		
		Operation operation = operationService.getOperation(id);
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("operation",operation);
		
		modelandview.setViewName("operation_manual");
		
		return modelandview;	
	}
	
	//取出所有手术室
	@RequestMapping("/queryRoom.action")
	public ModelAndView queryRoom() throws Exception {
		
		List<OperatingroomCustom> roomList = operatingroomService.queryRoomList();
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("roomList", roomList);
		
		modelandview.setViewName("operationRoom_index");
		
		return modelandview;
	}
	
	//查看手术室明细
		@RequestMapping("/detailRoom.action")
		public ModelAndView detailRoom(String date,String room_id) throws Exception {
			
			System.out.println("时间"+date);
			System.out.println("房间号"+room_id);
			List<OperationCustom> details = operatingroomService.findRoomDetail(room_id);
			List<Operation> results = new ArrayList<Operation>();
			
			Operation operation;
			Timestamp today;
			String day;
			DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			
			for( int i = 0 ; i < details.size() ; i++) {
				operation = details.get(i);
				today = operation.getTime_start();
				day = sdf.format(today);
				if( date.equals(day) ) {
					results.add(operation);
				}
			}
			
			ModelAndView modelandview = new ModelAndView();
			modelandview.addObject("results", results);
			modelandview.setViewName("operationRoom_room");
			
			return modelandview;
		}

}
