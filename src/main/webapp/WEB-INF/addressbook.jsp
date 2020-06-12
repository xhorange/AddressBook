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

    <script src="/js/keyboard.js"></script>
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
        <button type="button" class="btn btn-primary" style="width: 125px"data-toggle="modal" data-target="#addpeople">新建联系人</button>
        <button type="button" class="btn btn-warning" style="width: 125px"data-toggle="modal" data-target="#changeclass">切换分组</button>

    </div>

    <table id="table1" class="table table-hover" data-click-to-select="true" data-height="200"
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
               <form id="addform" action="/addpeople" method="post" accept-charset="UTF-8">
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
                           <label for="class">分组</label>
                           <select class="form-control" id="class"name="class">
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
<div class="modal fade" id="changeclass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="example">切换分组</h5>
            </div>
            <div class="modal-body">
                <form id="selectClass" name="changeClass"  >
                            <select class="form-control" id="classSelect"name="class">
                                <option>办公</option>
                                <option>个人</option>
                                <option>商务</option>
                            </select>
                    <div style="margin-top:20px ">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" onclick="changeClasses()" class="btn btn-success">确定</button>
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



<script>
    $("#table1").bootstrapTable('destroy');
    $('#table1').bootstrapTable({
        url: '/findInitAddress',
        method: 'get',
        contentType: "application/x-www-form-urlencoded",
        dataType:'json',
        //【其它设置】
        toolbar : "#toolbar",
        locale:'zh-CN',//中文支持
        search:'true',
        columns: [{
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

        }],
    });
</script>
</body>
</html>
