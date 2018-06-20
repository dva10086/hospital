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
        <form class="layui-form layui-form-pane" action="user.do" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">手术编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="operation_id" value="${requestScope.operation.operation_id}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">医生工号</label>
                <div class="layui-input-inline">
                    <input type="text" name="doctor_id" value="${requestScope.operation.doctor_id}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">病号</label>
                <div class="layui-input-inline">
                    <input type="text" name="patient_id" value="${requestScope.operation.patient_id}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="date" value="${requestScope.operation.date}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time_start" value="${requestScope.operation.time_start}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time_finish" value="${requestScope.operation.time_finish}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手术室</label>
                <div class="layui-input-inline">
                    <input type="text" name="operatingroom_id" value="${requestScope.operation.operatingroom_id}" readonly = "readonly"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选择麻醉师</label>
                <div class="layui-input-inline">
                    <select name="anesthetist_id" id="">
                        <option value="">请选择</option>
                        <option value="bank" selected="">张三</option>
                        <option value="不支持" disabled>麻小醉</option>
                        <option value="不支持" disabled>麻二醉</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <button type="button" class="layui-btn layui-btn-danger" onclick="这里我会写js的异步函数check_a()">检查空闲</button>
                </div>
                </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选择护士</label>
                <div class="layui-input-inline">
                    <select name="n_id" id="n1">
                        <option value="">请选择护士1</option>
                        <option value="bank" selected="">不选</option>
                        <option value="不支持" >护士2</option>
                        <option value="不支持" disabled>护士3</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="n_id" id="n2">
                        <option value="">请选择护士2</option>
                        <option value="bank" selected="">不选</option>
                        <option value="不支持" >护士2</option>
                        <option value="不支持" disabled>护士3</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="n_id" id="n3">
                        <option value="">请选择护士3</option>
                        <option value="bank" selected="">不选</option>
                        <option value="不支持" >护士2</option>
                        <option value="不支持" disabled>护士3</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="n_id" id="n4">
                        <option value="">护士4</option>
                        <option value="bank" selected="">不选</option>
                        <option value="不支持" >护士2</option>
                        <option value="不支持" disabled>护士3</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="n_id" id="n5">
                        <option value="">请选择护士5</option>
                        <option value="bank" selected="">不选</option>
                        <option value="不支持" >护士2</option>
                        <option value="不支持" disabled>护士3</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <button type="button" class="layui-btn layui-btn-danger" onclick="这里我会写js的异步函数check_a()">检查空闲</button>
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