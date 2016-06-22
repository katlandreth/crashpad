$(document).ready(function(){
  $("body").on('change', '.file', function(event){
    var preview = $(".upload-preview img");
    console.log('file input change');
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

});
