<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"  %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>手术室</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="layui/layui.js"></script>
    <script src="jquery-3.3.1.min.js"></script>
    <script type ="text/javascript" src="jquery.form.js"></script>
</head>
<body>
<fieldset class="layui-elem-field">
    <legend>手术台使用情况</legend>
    <div id="d1">
    
    
        <form action="detailRoom.action" method="post">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">日期选择</label>
                    <div class="layui-input-block">
                        <input type="text" name="date" id="date1" autocomplete="off" lay-verify="required" readonly="readonly" class="layui-input">
                    </div>
                </div>
            </div>
        
        
        
        
            <table  class="layui-table">
                <thead>
                <tr>
                    <th>手术台id</th>
                    <th>位置location</th>
                    <th></th>
                </tr>
                </thead>
                    <tbody>
                    <c:forEach items="${roomList}" var = "o">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.location}</td>
                        <td><button type="submit" name="room_id" class="layui-btn layui-btn-xs" value="${o.id}" >查看</button></td>
                    </tr>
                    </c:forEach>
                    </tbody>
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
</body>
</html>