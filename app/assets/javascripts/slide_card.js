$(document).ready(function(){
  $('body').on('click', '.edit-card-button', function(){
    $(this).closest('.card').find('.edit-card').toggleClass('slide-in');
    $(this).toggleClass('round-button-clicked');
  });
});
