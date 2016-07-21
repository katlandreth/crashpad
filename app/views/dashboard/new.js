$('.content-container').html("<%= escape_javascript(render partial: 'show') %>");
$('nav.navbar').html("<%= escape_javascript( render partial: 'shared/navbar') %>");
$('#rails-flash-message').html("<%= escape_javascript(render partial: 'shared/flash_messages', locals: {flash: flash}) %>");
