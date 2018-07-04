<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <title>手动安排人员</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="layui/layui.js"></script>
    <script src="jquery-3.3.1.min.js"></script>
    <script type ="text/javascript" src="jquery.form.js"></script>
</head>
<body>
<div class="layui-row layui-col-space10 ">
    <div class="layui-col-md4">
    </div>
    <div class="layui-col-md8">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>手动安排</legend>
        </fieldset>
        
        <form class="layui-form layui-form-pane" action="submitOperation.action" method="post">
        
            <div class="layui-form-item">
                <label class="layui-form-label">手术编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="operation_id" value="${operation_id}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">医生工号</label>
                <div class="layui-input-inline">
                    <input type="text" name="doctor_id" value="${sessionScope.doctor_id}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">病号</label>
                <div class="layui-input-inline">
                    <input type="text" name="patient_id" value="${patient.id}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">请选择日期</label>
                <div class="layui-input-inline">
                <input type="text" class="layui-input" name="day" id="day" placeholder="请选择日期">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">请选择手术开始时间</label>
                <div class="layui-input-inline">
                <input type="text" class="layui-input" name="start_time" id="start_time" placeholder="请选择手术开始时间">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                <label class="layui-form-label">请选择手术结束时间</label>
                <div class="layui-input-inline">
                <input type="text" class="layui-input" name="end_time" id="end_time" placeholder="请选择手术结束时间">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选择手术室</label>
                <div class="layui-input-inline">
                    <select name="room_id" id="room_id">
                        <option value="0">请选择</option>
                        <option value="001" selected="">一号门珍大厅301</option>
                        <option value="002" >一号门珍大厅302</option> 
                        <option value="003" >一号门珍大厅501</option>
                        <option value="004" >一号门珍大厅502</option>
                        <option value="005" >二号门珍大厅101</option>
                        <option value="006" >二号门珍大厅201</option>
                        <option value="007" >三号门珍大厅606</option>
                        <option value="008" >三号门珍大厅808</option>
                        <option value="009" >五号门珍大厅1101</option>
                        <option value="010" >五号门珍大厅1117</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <button type="button" class="layui-btn layui-btn-danger" onclick="这里我会写js的异步函数check_a()">检查空闲</button>
                </div>
                </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">护士数量</label>
                <div class="layui-input-inline">
                    <select name="nursenum" id="nursenum">
                        <option value="0">请选择</option>
                        <option value="1" selected="">1</option>
                        <option value="2" >2</option> 
                        <option value="3" >3</option>
                    </select>
                </div>
            </div>

            <hr class="layui-bg-gray">
            <div class="layui-form-item">
                <button class="layui-btn" type="submit" name="action" value="payment" lay-submit="" lay-filter="demo2">提交</button>
            </div>
        </form>
    </div>
</div>
<script src="layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
        laydate.render({
            elem: '#day'
            ,format: 'yyyy-MM-dd'
          });
        laydate.render({
            elem: '#start_time'
            ,type: 'time'
          });
        laydate.render({
            elem: '#end_time'
            ,type: 'time'
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

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>
</body>
</html>