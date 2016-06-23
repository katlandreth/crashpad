var ready;
ready = function() {
  console.log('document ready');
  $("body").on('change', '.file', function(event){
    console.log('input change');
    var preview = $(".upload-preview img");
    console.log('assigned preview variable');
    var input = $(event.currentTarget);
    var file = input[0].files[0];
    var reader = new FileReader();
    reader.onload = function(e){
    preview.show();
    image_base64 = e.target.result;
    preview.attr("src", image_base64);
    $(".uploaded-image").html("");
  };
    reader.readAsDataURL(file);
  });

  $(document).on("click", "#cancel-upload", function(){
    var preview = $(".upload-preview img");
    preview.hide();
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
