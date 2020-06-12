<%--
  Created by IntelliJ IDEA.
  User: 鸣
  Date: 2020/6/11
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通讯录管理</title>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="/css/addressbook.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/keyboard.css" type="text/css">
    <link rel="shortcut icon" href="#" />


</head>
<body>
<div class="container-sm" style="width: 75%;text-align: center">
    <nav>
        <div class="btn-group">
            <a href="/dial">
                <button type="button" class="btn btn-secondary" style="width: 100px">通话</button>
            </a>
            <a href="/addressbook">
                <button type="button" class="btn btn-primary" style="width: 150px">联系人</button>
            </a>
        </div>
    </nav>
    <div id="toolbar" class="btn-group">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addpeople">新建联系人</button>
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#changeclass">切换分组</button>
        <button type="button" class="btn btn-danger"  data-toggle="modal" id="btn_delete">删除联系人</button>

    </div>

    <table id="table1" class="table table-hover" data-click-to-select="true"
           data-virtual-scroll="true">
    </table>
</div>
<!-- 新增联系人Modal -->
<div class="modal fade" id="addpeople" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新增联系人</h5>
            </div>
            <div class="modal-body">
               <form id="addForm" action="/address/addPerson" method="post" accept-charset="UTF-8">
                   <div class="row">
                       <div class="col">
                           <label for="name">联系人姓名</label>
                           <input type="text" class="form-control" id="name" placeholder="姓名"name="name"  >
                       </div>
                   </div>
                   <div class="row">
                       <div class="col">
                           <label for="phonenumber">联系电话</label>
                           <input type="text" class="form-control" id="phonenumber" placeholder="联系电话"name="phonenumber">
                       </div>
                   </div>
                   <div class="row">
                       <div class="col">
                           <label for="email">电子邮箱</label>
                           <input type="text" class="form-control" id="email" placeholder="联系邮箱"name="email">
                       </div>
                   </div>
                   <div class="row">
                       <div class="col">
                           <label for="classification">分组</label>
                           <select class="form-control" id="classification"name="classification">
                               <option>办公</option>
                               <option>个人</option>
                               <option>商务</option>
                           </select>
                       </div>
                   </div>
                   <div style="margin-top:20px ">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       <button type="submit" class="btn btn-primary">保存</button>
                   </div>

               </form>
            </div>

        </div>
    </div>
</div>
<!-- 修改联系人Modal -->
<div class="modal fade" id="updatePerson" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateinfo">修改联系人</h5>
            </div>
            <div class="modal-body">
                <form id="updateForm" action="/address/updatePerson" method="post" accept-charset="UTF-8">
                    <div class="row">

                        <div class="col">
                            <label for="name">联系人姓名</label>
                            <input type="text" class="form-control" id="updatename" placeholder="姓名"name="name"  >
                        </div>
                        <div class="col" hidden>
                            <input type="text" class="form-control" id="updateID" placeholder="id"name="id">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="phonenumber">联系电话</label>
                            <input type="text" class="form-control" id="updatephonenumber" placeholder="联系电话"name="phonenumber">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="email">电子邮箱</label>
                            <input type="text" class="form-control" id="updateemail" placeholder="联系邮箱"name="email">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="classification">分组</label>
                            <select class="form-control" id="updateclassification"name="classification">
                                <option>个人</option>
                                <option>办公</option>
                                <option>商务</option>
                            </select>
                        </div>
                    </div>
                    <div style="margin-top:20px ">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>
<!-- 切换分组 -->
<div class="modal fade" id="changeclass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="example">切换分组</h5>
            </div>
            <div class="modal-body">
                <form id="selectClass" name="changeClass"  >
                            <select class="form-control" id="classSelect"name="class">
                                <option>个人</option>
                                <option>办公</option>
                                <option>商务</option>
                            </select>
                    <div style="margin-top:20px ">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" onclick="changeClasses()" class="btn btn-success" >确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="/js/bootstrap.js"type="text/javascript"></script>
<script src="/js/bootstrap-table.js"type="text/javascript"></script>
<script src="/js/keyboard.js"></script>


<script>
    $("#table1").bootstrapTable('destroy');
    $('#table1').bootstrapTable({
        url: '/findInitAddress',
        method: 'get',
        contentType: "application/x-www-form-urlencoded",
        dataType:'json',
        //【其它设置】
        pagination: true,//是否开启分页（*）
        pageNumber:1,//初始化加载第一页，默认第一页
        pageSize: 5,//每页的记录行数（*）
        toolbar : "#toolbar",
        locale:'zh-CN',//中文支持
        search:'true',
        sortable: true, //是否启用排序
        singleSelect: true,//单选行
        sortOrder: "asc", //排序方式
        sortName:'id',
        columns: [{
            checkbox:true  //第一列显示复选框
        },{
                field: 'id',
                title: '序号'
            },{
            field: 'name',
            title: '联系人'
        }, {
            field: 'phonenumber',
            title: '手机号'
        }, {
            field: 'email',
            title: 'E-mail',
            },{
            field: 'classification',
            title: '分组'

        },{
                field: 'operate',
                title: '操作',
                width: 120,
                align: 'center',
                valign: 'middle',
                formatter:actionFormatter,
            }],
    });
    function actionFormatter(value, row, index) {
        var id = index;
        var data = JSON.stringify(row);
        var result = "";
        result = "<a href='javascript:;' class='btn btn-xs btn-primary' onclick=\"EditViewById('" + row + "','" + id + "')\" title='编辑'>编辑</a>";
        return result;

    };
    function EditViewById(row, index){
        var data = JSON.stringify($("#table1").bootstrapTable('getData')); //获取全部数据
        var data_json = JSON.parse(data); //data_json和data_json2一样都是json对象
        $('#updatename').val(data_json[index].name);
        $('#updateID').val(data_json[index].id);
        $("#updateemail").val(data_json[index].email);
        $("#updateclassification").val(data_json[index].classification);
        $('#updatephonenumber').val(data_json[index].phonenumber);

        //弹出修改模态框，非新增模态框
        $('#updatePerson').modal('show')
    };

    if('${insertResult}'!=""){
        if('${insertResult}'==1){
        alert("新增成功");
         }
        if('${insertResult}'==-1){
        alert("超出该分组最大人数限制");
        }
        if('${insertResult}'==-2){
            alert("联系人已存在");
        }
        if('${insertResult}'==0){
        alert("新增出现错误，请重试");
        }
    }
    if('${updateResult}'!=""){
        debugger
        if('${updateResult}'==1){
            alert("修改成功");
        }
        if('${updateResult}'==-1){
            alert("修改失败");
        }
    }


</script>
</body>
</html>
