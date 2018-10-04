
$(document).ready(function(){

    //get base URL *********************
    var url = $('#url').val();


    //display modal form for creating new product *********************
    $('#btn_add').click(function(){
        $('#btn-save').val("add");
        $('#frmProducts').trigger("reset");
        $('#myModal').modal('show');
    });



    //display modal form for product EDIT ***************************
    $(document).on('click','.open_modal',function(){
        var product_id = $(this).val();

        // Populate Data in Edit Modal Form
        $.ajax({
            type: "GET",
            url: url + '/' + product_id,
            success: function (data) {
                console.log(data);
                $('#product_id').val(data.id);
                $('#brand_name').val(data.brand_name);
                $('#generic_name').val(data.generic_name);
                $('#description').val(data.description);
                $('#date_arrival').val(data.date_arrival);
                $('#expiry_date').val(data.expiry_date);
                $('#selling_price').val(data.selling_price);
                $('#original_price').val(data.original_price);
                $('#quantity').val(data.quantity);
                $('#quantity_left').val(data.quantity_left);
                $('#profit').val(data.profit);
                $('#btn-save').val("update");
                $('#myModal').modal('show');
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
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

            brand_name:    $('#brand_name').val(),
            generic_name: $('#generic_name').val(),
            description: $('#description').val(),
            date_arrival: $('#date_arrival').val(),
            expiry_date: $('#expiry_date').val(),
            selling_price: $('#selling_price').val(),
            original_price:  $('#original_price').val(),
            quantity:  $('#quantity').val(),
            quantity_left: $('#quantity_left').val(),
            profit: $('#profit').val()
        }

        //used to determine the http verb to use [add=POST], [update=PUT]
        var state = $('#btn-save').val();
        var type = "POST"; //for creating new resource
        var product_id = $('#product_id').val();;
        var my_url = url;
        if (state == "update"){
            type = "PUT"; //for updating existing resource
            my_url += '/' + product_id;
        }
        console.log(formData);
        $.ajax({
            type: type,
            url: my_url,
            data: formData,
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var product = '<tr id="product' + data.id + '">' +
                    '<td>' + data.id + '</td>' +
                    '<td>' + data.brand_name + '</td>' +
                    '<td>' + data.generic_name + '</td>' +
                    '<td>' + data.description + '</td>' +
                    '<td>' + data.date_arrival + '</td>' +
                    '<td>' + data.expiry_date + '</td>' +
                    '<td>' + data.selling_price + '</td>' +
                    '<td>' + data.original_price + '</td>' +
                    '<td>' + data.quantity + '</td>' +
                    '<td>' + data.quantity_left + '</td>' +
                    '<td>' + data.profit + '</td>'


                product += '<td><button class="btn btn-warning btn-detail open_modal" value="' + data.id + '">Edit</button>';
                product += ' <button class="btn btn-danger btn-delete delete-product" value="' + data.id + '">Delete</button></td></tr>';
                if (state == "add"){ //if user added a new record
                    $('#products-list').append(product);
                }else{ //if user updated an existing record
                    $("#product" + product_id).replaceWith( product );
                }
                $('#frmProducts').trigger("reset");
                $('#myModal').modal('hide')
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
    });


    //delete product and remove it from TABLE list ***************************
    $(document).on('click','.delete-product',function(){
        var product_id = $(this).val();
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        })
        $.ajax({
            type: "DELETE",
            url: url + '/' + product_id,
            success: function (data) {
                console.log(data);
                $("#product" + product_id).remove();
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
    });

});