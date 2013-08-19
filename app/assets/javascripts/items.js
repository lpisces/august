$(function () {
    'use strict';
    // Change this to the location of your server-side upload handler:
    var url = "/cpanel/images.json";
    $('#fileupload').fileupload({
        url: url,
        type: 'post',
        dataType: 'json',
        formData: function(form) {
          return {'image["src"]':$("input[name='image[src]']").val()};
        },
        done: function (e, data) {
          //alert(data.result.src.src.url);
          $('<input type="hidden" name="item[images_id][]">').attr('id', 'img_'+data.result.id).val(data.result.id).appendTo('.upload_images');
          $('<img style="height:100px;margin:5px;border:5px solid #eee;"/>').attr('data-id', data.result.id).attr('src', data.result.src.src.url).appendTo("<div></div>").appendTo('.upload_images').click(function() {
            $(this).remove();
            $('#img_'+data.result.id).remove();
          });
        }
    });

    $('.upload_images img').click(function() {
      $(this).remove();
      $('#img_'+$(this).attr('data-id')).remove();
    });

    $('#get_info').click(function() {
      var num_iid = $('#item_num_iid').val();
      if (num_iid.match(/id=\d+/)) {
        num_iid = num_iid.match(/id=\d+/)[0].split('=')[1];
      }
      $('#item_num_iid').val(num_iid);
      $.get('/cpanel/items/get_info', {'num_iid':num_iid}, function(data) {
        if (typeof data.error_response != "undefined") alert(data.error_response.sub_msg || 'Something Wrong .');
        else {
          $('#item_title').val(data.item_get_response.item.title);
          $('#item_price').val(data.item_get_response.item.price);
          $('#item_pic_url').val(data.item_get_response.item.pic_url);
          $('#item_detail_url').val(data.item_get_response.item.detail_url);
          var item_imgs = [];
          var tmp_images = data.item_get_response.item.item_imgs.item_img;
          for (var i in tmp_images) {
            item_imgs.push(tmp_images[i].url);
          }
          $('#item_item_imgs').val(item_imgs.join(",\n"));
          $('#item_desc').html(data.item_get_response.item.desc);
        }
      }, 'json');
    });
});
