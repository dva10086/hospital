<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"  %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>手术信息主界面</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="layui/layui.js"></script>
    <script src="jquery-3.3.1.min.js"></script>
    <script type ="text/javascript" src="jquery.form.js"></script>
</head>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>预约</legend>
    <form id="f1" class="layui-form layui-form-pane" action="">
        <!--这里藏了一个参数-->
        <input type="hidden" name="action" value="search">
        <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">预约类型</label>
            <div class="layui-input-block">
                <input type="radio" name="type" value="done" title="已处理" checked="">
                <input type="radio" name="type" value="undone" title="未处理">
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-block">
                <!--这里是使用ajax发送异步请求，你只需要写好后台的处理方法 历史-》历史list，预约-》预约list 我写search函数-->
                <input type="button" class="layui-btn layui-btn-danger"  lay-submit=""  name="查看" value="查看" onclick="search()"/>
            </div>
        </div>
        </div>
    </form>
</fieldset>
<fieldset class="layui-elem-field">
    <legend>手术预约列表</legend>
    <div id="d1">
        <form id="f2" action="" method="post">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>手术id</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>患者id</th>
                    <th>手术室id</th>
                    <th>医生id</th>
                    <th>麻醉师id</th>
                    <th>护士数量</th>
                    <th>预约状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <!--遍历手术列表-->
                <!--
                <c:forEach var="flight" items="${sessionScope.flightlist}">
                    <!--<tbody>
                    <!--<tr>-
                        <!--<td>${flight.id}</td>-->
                        <!--<td>${flight.departure}</td>-->
                        <!--<td>${flight.arrival}</td>-->
                        <!--<td>${flight.airline}</td>-->
                        <!--<td>${flight.date}</td>-->
                        <!--<td>${flight.start_time}</td>-->
                        <!--<td>${flight.end_time}</td>-->
                        <!--<td>${flight.price}</td>-->
                        <!--<td><button type="submit" name="flight_id" class="layui-btn layui-btn-xs" value="${flight.id}" >预定</button></td>-->
                    <!--</tr>-->
                    <!--</tbody>-->
                <!--</c:forEach>-->
                
              <c:forEach items="${operationList}" var = "o">
              <tbody>
              <tr>
                  <td>${o.operation_id }</td>
                  <td>${o.time_start }</td>
                  <td>${o.time_finish }</td>
                  <td>${o.patient_id }</td>
                  <td>${o.operatingroom_id }</td>
                  <td>${o.doctor_id }</td>
                  <td>${o.anesthetist_id }</td>
                  <td>${o.nurseNum }</td>
                  <c:choose>
                  		<c:when test="${o.status == 1}">
                  		<td>简单安排</td>
                  		<td><a href="${pageContext.request.contextPath }/jsp/singleOperation.action?id=${o.operation_id}"><button type="button" class="layui-btn layui-btn-primary layui-btn-xs"  >手动</button></a><button type="submit" class="layui-btn layui-btn-xs"  onclick="delete_transaction(this)">自动</button></td>
                  		</c:when>
                  		<c:when test="${o.status == 2}">
                  		<td>未确定</td>
                  		<td></td>
                  		</c:when>
                  		<c:when test="${o.status == 3}">
                  		<td>已拒绝</td>
                  		<td><a href="${pageContext.request.contextPath }/jsp/singleOperation.action?id=${o.operation_id}"><button type="button" class="layui-btn layui-btn-primary layui-btn-xs"  >手动</button></a></td>
                  		</c:when>
                  		<c:when test="${o.status == 4}">
                  		<td>已确定</td>
                  		<td></td>
                  		</c:when>
                  		<c:when test="${o.status == 5}">
                  		<td>手术完成</td>
                  		<td><button type="submit" class="layui-btn layui-btn-danger layui-btn-xs"  onclick="delete_transaction(this)">编辑</button></td>
                  		</c:when>
                  		<c:when test="${o.status == 6}">
                  		<td>手术取消</td>
                  		<td></td>
                  		</c:when>
                  </c:choose>
              <!--<td>
                      <a href="跳到servlet处理参数"><button type="button" class="layui-btn layui-btn-primary layui-btn-xs"  value="button写在<a>里面，直接带着参数 即手术id 调转">手动</button></a>
                      <button type="submit" class="layui-btn layui-btn-xs"  onclick="delete_transaction(this)">自动</button>
                      <button type="submit" class="layui-btn layui-btn-danger layui-btn-xs"  onclick="delete_transaction(this)">编辑</button></td>-->
              </tr>
              </tbody>
              </c:forEach>
              
            </table>
        </form>
    </div>
</fieldset>

<script type="text/javascript">
    function search() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "user.do" ,//url
            data: $('#f1').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.toString()=="1") {
                    console.log("进入if了呀");
                    //  $('#f2').location.reload();
                    $("#d1").load(location.href + " #d1")
                    console.log("执行刷新任务");
                }
                else {
                    alert("查询失败！");
                }
            },
            error : function() {
                alert("异常！");
            }
        });
    }
</script>
<script>
    layui.use('table', function() {
        var table = layui.table;

//转换静态表格
        table.init('demo', {
            height: 315 //设置高度
            , limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
//支持所有基础参数
        });
    });
</script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
            ,format: 'yyyyMMdd'
            ,min: '20180615'
            ,max: '20180815'
        });
        laydate.render({
            elem: '#date1'
            ,format: 'yyyyMMdd'
            ,type:'date'
            ,min: 0
            ,max: 60
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });




    });
</script>
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<body>

</body>
</html>
