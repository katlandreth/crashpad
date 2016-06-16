$('.content-container').html("<%= escape_javascript(render partial: 'show') %>");
$('button.signed-in').click()
