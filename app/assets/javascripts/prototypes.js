$(function(){
  add_main_image();
  add_new_form();
  add_sub_image();
});

function add_main_image(){
  $("#prototype_images_attributes_0_image").change(function(){
    if(!this.files.length){
      return;
    }
    var file = $(this).prop('files')[0];
    var fr = new FileReader();
    fr.onload = function(){
      $("#main_preview").attr('src', fr.result );
      $("#main_preview").css('display', 'block')
    }
    fr.readAsDataURL(file);
  });
}

function add_sub_image(){
  for(var i = 1; i <= 3; i++){
    $("#prototype_images_attributes_" + i + "_image").change(function(){
      if(!this.files.length){
        return;
      }
      var num = $(this).attr("id").charAt($(this).attr("id").search(/[0-9]/));
      var file = $(this).prop('files')[0];
      var fr = new FileReader();
      fr.onload = function(){
        $("#sub_" + num).attr('src', fr.result);
        $("#sub_" + num).css('display', 'block');
      }
      fr.readAsDataURL(file);

    });
  }
}

function add_new_form(){
  $("#add_new_form").on("click", function(){
    $(".hide_form:first").removeClass("hide_form").addClass("appear_form");
    var appear_forms = $(".hide_form").size();
    if(appear_forms == 0){
      $("#add_new_form").attr('style', 'display: none;');
    }
  });
}