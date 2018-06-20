<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"  %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <title>手术室使用情况</title>
</head>
<body>


<div class="layui-row layui-col-space10 ">
    <div class="layui-col-md8">
        <fieldset class="layui-elem-field">
            <legend>手术台使用情况</legend>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>占用情况</th>
                </tr>
                </thead>
                <c:forEach items="${results}" var = "o">
                <tbody>
                <tr>
                    <td>${o.time_start}</td>
                    <td>${o.time_finish}</td>
                    <td>占用</td>
                </tr>
                </tbody>
                </c:forEach>
            </table>
        </fieldset>
        <a href="queryRoom.action" style="position:absolute;right: 300px;"><button class="layui-btn layui-btn-lg" value="查看其他手术台">查看其他手术台</button></a>
    </div>
</div>
<script src="layui/layui.js" charset="utf-8"></script>
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