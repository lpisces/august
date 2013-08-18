//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery-fileupload/basic
//= require markitup
//= require markitup/sets/markdown/set


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

    $("textarea").markItUp(mySettings);
});



