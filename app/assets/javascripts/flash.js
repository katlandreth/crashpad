$(document).on('click', 'button.not-signed-in', function(){
  $('#js-flash-message').addClass('flash_open flash_error').html("Your Crashpad account was not created.");
});
//
// $(document).on('click', 'button.signed-in', function(){
//   $('#js-flash-message').addClass('flash_open flash_success').html("Your Crashpad account was created.");
// });

$(document).on('click', '.flash_button', function(){
  $('#rails-flash-message div').toggleClass('flash_show');
})
