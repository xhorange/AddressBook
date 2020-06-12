

function keyboardclick(obj) {
    let id = obj.id;
    let currenttext = document.getElementById("dialtext").value;
    //sound=new Audio("/audio/"+id+".wav");
    var sound=document.getElementById(id);
    sound.loop=false;
    if(id=="delete"){
        sound.play();
        const str = currenttext.substring(0, currenttext.length - 1);
        document.getElementById("dialtext").value=str;
        return;
    }
    if(id=="ok"){
        sound.play();
        debugger
        if(currenttext.length==13||currenttext.length==11||currenttext.length==8){
            document.getElementById("dialtext").value=""
            alert("开始拨号...");


        }
        else {
            document.getElementById("dialtext").value=""
            alert("请输入正确的号码");

            console.log(currenttext.length);
            return;
        }

    }

    sound.play();
    document.getElementById("dialtext").value=currenttext+obj.id;
}
function keyboard() {
    document.write("    <div style=\"width: 100%;height: 400px;text-align: center\">\n" +
        "        <div class=\"row-cols-6\" style=\"text-align: center\">\n" +
        "            <button id=\"1\" class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\" onclick=\"keyboardclick(this)\">1</button>\n" +
        "            <button id=\"2\"class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">2</button>\n" +
        "            <button  id=\"3\"class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">3</button>\n" +
        "        </div>\n" +
        "        <div class=\"row-cols-6\" style=\"text-align: center\">\n" +
        "            <button  id=\"4\" class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">4</button>\n" +
        "            <button  id=\"5\" class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">5</button>\n" +
        "            <button  id=\"6\"class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">6</button>\n" +
        "        </div>\n" +
        "        <div class=\"row-cols-6\" style=\"text-align: center\">\n" +
        "            <button  id=\"7\"class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">7</button>\n" +
        "            <button  id=\"8\"class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">8</button>\n" +
        "            <button  id=\"9\"class=\"btn btn-lg btn-outline-success\" style=\"margin: 2%\"onclick=\"keyboardclick(this)\">9</button>\n" +
        "        </div>\n" +
        "        <div class=\"row-cols-6\" style=\"text-align: center\">\n" +
        "            <button  id=\"delete\" class=\"btn btn-lg btn-success\" style=\"margin: 1%\"onclick=\"keyboardclick(this)\">删除</button>\n" +
        "            <button  id=\"0\"class=\"btn btn-lg btn-outline-success\" style=\"margin: 1%\"onclick=\"keyboardclick(this)\">0</button>\n" +
        "            <button  id=\"ok\"class=\"btn btn-lg btn-success\" style=\"margin: 1%\"onclick=\"keyboardclick(this)\">拨号</button>\n" +
        "        </div>\n" +
        "\n" +
        "    </div>")
};
function changeClasses() {
    var x=document.getElementById("classSelect").value;
    if(x=="个人"){
        $('#table1').bootstrapTable('refresh',{
            url:"/changePerson"
        });
    }
    if(x=="办公"){
        $('#table1').bootstrapTable('refresh',{
            url:"/changeOffice"
        });
    }
    if(x=="商务"){
        $('#table1').bootstrapTable('refresh',{
            url:"/changeBusiness"
        });
    }
    $('#changeclass').modal('hide');
};
// 删除按钮事件
$("#btn_delete").on("click", function() {
    if (!confirm("是否确认删除？"))
        return;
    var rows = $("#table1").bootstrapTable('getSelections');// 获得要删除的数据
    if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
        alert("请先选择要删除的记录!");
        return;
    } else {
        var ids = new Array();// 声明一个数组
        $(rows).each(function() {// 通过获得别选中的来进行遍历
            ids.push(this.id);// cid为获得到的整条数据中的一列
        });
        deleteMs(ids);
    }
})
function deleteMs(ids) {
    $.ajax({
        url : "/delete",
        data : "ids=" + ids,
        type : "post",
        dataType : "json",
        success : function(data) {
            alert("ok");
            $('#table1').bootstrapTable('refresh', {
                url :"/findInitAddress"
            });
        }
    });
}






