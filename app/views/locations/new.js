$('.modal-form').html("<%= escape_javascript(render partial: 'locations/new') %>");
$('.modal-title').text('New Location');
