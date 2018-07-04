<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
 <script>

layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;	  
});	
function func() {
	layer.alert('发起手术成功!', {
        icon: 1,
        skin: 'layer-ext-moon' 
    });
}
</script>           


<form class="layui-form"  id="chooseForm" action="searchPatient.action" method="post">
 

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>医生</legend>
</fieldset>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">病人编号</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="id" name="id" placeholder="请输入病人编号">
      </div>
    </div>
</div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form> 

 <table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>账户</th>
      <th>姓名</th>
      <th>性别</th>
      <th>年龄</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
 <form action =startOperation.action method = "post">
<c:forEach var = "patientList" items = "${patientList}">

<tr>
    <td>${patientList.id}</td>
    <td>${patientList.name }</td>
    <td>${patientList.gender }</td>
    <td>${patientList.age }</td>
      <td>
      <button class="layui-btn layui-btn-warm" name="start"  type="submit"  value="${patientList.id}"><i class="layui-icon">&#xe654;</i> 发起手术</button> 
      </td>
</tr>
</c:forEach>
</form>
  </tbody>
</table>   

 

          



          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        var day = laydate.render({
            elem: '#day'
            ,format: 'yyyy/MM/dd'
            ,min: 0
        });
    });

</script>


<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
<% String flag = (String)session.getAttribute("flag");
    if(flag!=null&&flag.length()>0&&flag.equals("1"))
    	
    	{%>
     <script type="text/javascript">
                    window.onload=function(){
                    	func(); }
     </script>
<%  
    session.setAttribute("flag",null);
    	}
%>
</body>
</html>