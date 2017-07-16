var person_num = 1;
function AddPerson()
{
    if(person_num < 5) {
        person_num++;
        var newPerson =
            '<div class="top-content" style="margin: 0 auto; ">'+
                '<div class="container" >'+
                    '<div class="panel panel-default" style="width:500px; margin: 0 auto;margin-bottom: 20px;margin-top: 20px;">'+
                        '<div class="form-bottom">'+
                            '<h4 style="margin: 30px">第'+person_num+'位乘客信息</h4>'+
                            '<div class="form-group">'+
                                '<input type="text" name="personName" placeholder="姓名" class="form-username form-control" id="form-username" equired=required>'+
                        '</div>'+
                            '<div class="form-group">'+
                                '<input type="text" name="personID" placeholder="身份证号" class="form-username form-control" id="form-username" required="required">'+
                            '</div>'+
                            '<div class="row">'+
                                '<div class="col-xs-4">'+
                                '<div class="checkbox">'+
                                    '<label>'+
                                        '<input type="checkbox" name="isStu" value="'+person_num+'">'+
                                        '是否为学生'+
                                    '</label>'+
                                '</div>'+
                                '</div>'+
                                '<div class="col-xs-4">'+
                                '<div class="checkbox">'+
                                    '<label>'+
                                        '<input type="checkbox" name="isLevel1" value="'+person_num+'">'+
                                        '是否一等座'+
                                    '</label>'+
                                '</div>'+
                                '</div>'+
                                '<div  class="col-xs-4">'+
                                    '<button class="btn btn-default" href="#" style="background-color: #CDCDCD;" onclick="AddPerson()">'+
                                        '添加乘客'+
                                    '</button>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'
        '</div>';
        $('#person').append(newPerson);
    }
    else
        alert("一个用户最多只能购买5张票");
}