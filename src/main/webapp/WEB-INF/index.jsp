<%--
  Created by IntelliJ IDEA.
  User: 鸣
  Date: 2020/6/10
  Time: 20:27
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


    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="/js/bootstrap.js" type="text/javascript"></script>
    <script src="/js/bootstrap-table.js" type="text/javascript"></script>
    <script src="/js/keyboard.js"></script>

</head>
<body>
<audio id="1" src="/audio/1.wav" volume="60"></audio>
<audio id="2" src="/audio/2.wav" volume="60"></audio>
<audio id="3" src="/audio/3.wav" volume="60"></audio>
<audio id="4" src="/audio/4.wav" volume="60"></audio>
<audio id="5" src="/audio/5.wav" volume="60"></audio>
<audio id="6" src="/audio/6.wav" volume="60"></audio>
<audio id="7" src="/audio/7.wav" volume="60"></audio>
<audio id="8" src="/audio/8.wav" volume="60"></audio>
<audio id="9" src="/audio/9.wav" volume="60"></audio>
<audio id="0" src="/audio/0.wav" volume="60"></audio>
<audio id="delete" src="/audio/delete.wav" volume="60"></audio>
<audio id="ok" src="/audio/ok.wav" volume="60"></audio>
<div class="container-sm" style="width: 75%;text-align: center">
    <nav>
    <div class="btn-group" >
        <a href="/dial">
            <button type="button" class="btn btn-success" style="width: 150px">通话</button>
        </a>
        <a href="/addressbook">
            <button type="button" class="btn btn-secondary" style="width: 100px">联系人</button>
        </a>
    </div>
    </nav>
<div id="toolbar" class="btn-group">
    <button type="button" class="btn btn-success" style="width: 125px"data-toggle="modal" data-target="#DoDial">拨号</button>
    <button type="button" class="btn btn-danger" style="width: 125px">删除记录</button>
</div>

    <table id="table" class="table table-hover" data-click-to-select="true" data-height="200"
        data-virtual-scroll="true">
    </table>
</div>
<!-- 新增联系人Modal -->
<div class="modal fade" id="DoDial" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">拨号</h5>
            </div>
            <div class="modal-body">
                  <textarea id="dialtext" class="form-control"></textarea>
                  <script>
                      keyboard();
                  </script>
            </div>

        </div>
    </div>
</div>
<script>
    $("#table").bootstrapTable('destroy');
    $('#table').bootstrapTable({
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
            field: 'phone',
            title: '手机号'
        }, {
            field: 'time',
            title: '通话时间',
            formatter: function (value, row, index) {
                return changeDateFormat(value)
            }

        }],
    });
</script>



</body>

</html>
