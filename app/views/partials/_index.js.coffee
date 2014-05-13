$('#notifications').html "<%= j render 'partials/notifications' %>"

<% case @using_modal %>
<% when true %>
$('#formModal').modal 'hide'
$('#formModal').on 'hidden.bs.modal', (e) ->
	$('#container').html "<%= j render partial: 'partials/list_resource', locals: {records: records} %>"
<% else %>
$('#container').html "<%= j render partial: 'partials/list_resource', locals: {records: records} %>"
<% end %>