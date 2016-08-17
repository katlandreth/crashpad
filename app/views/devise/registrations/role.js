$('nav.navbar').html("<%= escape_javascript( render partial: 'shared/navbar') %>");
$('#rails-flash-message').html("<%= escape_javascript( render partial: 'shared/flash_messages') %>");
$('.modal-close').html("<%= escape_javascript(render partial: 'shared/modal_close') %>");
$('.registration_form').html("<%= escape_javascript(render partial: 'role') %>")
