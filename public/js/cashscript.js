
$(document).ready(function(){

    //get base URL *********************
    var url = $('#url').val();


    //display modal form for creating new product *********************
    $('#btn_add').click(function(){
        $('#btn-save').val("add");
        $('#frmCash').trigger("reset");
        $('#myModal').modal('show');
    });



    //create new product / update existing product ***************************
    $("#btn-save").click(function (e) {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        })

        e.preventDefault();
        var formData = {

            name:    $('#name').val(),
            amount: $('#amount').val(),
            product_id :$('#product_id').val(),
               }

        //used to determine the http verb to use [add=POST], [update=PUT]
        var state = $('#btn-save').val();
        var type = "POST"; //for creating new resource
        var cash_id = $('#cash_id').val();;
        var my_url = url;
        if (state == "update"){
            type = "PUT"; //for updating existing resource
            my_url += '/' + cash_id;
        }
        console.log(formData);
        $.ajax({
            type: type,
            url: my_url,
            data: formData,
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var cash = '<tr id="cash' + data.id + '">' +
                    '<td>' + data.id + '</td>' +
                    '<td>' + data.name + '</td>' +
                    '<td>' + data.amount + '</td>' +
                    '<td>' + data.product_id + '</td>'

                if (state == "add"){ //if user added a new record
                    $('#cash-list').append(cash);
                }else{ //if user updated an existing record
                    $("#cash" + cash_id).replaceWith( cash );
                }
                $('#frmCash').trigger("reset");
                $('#myModal').modal('hide')
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
    });



});