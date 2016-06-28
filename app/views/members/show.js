$('.content-container').html("<%= escape_javascript(render partial: 'show') %>");
$('#rails-flash-message').html("<%= escape_javascript(render partial: 'shared/flash_messages', locals: {flash: flash}) %>");
