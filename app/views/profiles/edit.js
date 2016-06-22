console.log('modal button click');
$('.modal-content').html("<%= escape_javascript(render partial: 'avatar_modal') %>");
