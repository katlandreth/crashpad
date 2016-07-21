$(document).ready(function(){
  $('.edit-card-button').click(function(){
    $(this).closest('.card').find('.edit-card').toggleClass('slide-in');
    $(this).toggleClass('round-button-clicked');
  });
});
