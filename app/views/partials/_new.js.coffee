$('#modal-notifications').html "<%= j render 'partials/notifications' %>"
$('#formModalContent').html "<%= j render 'form', action: 'Create' %>"
$('#formModal').modal 'show'

$('#modal_search_button').on 'click', (e) ->
	$.get '/get_records', {name: this.name}

$('#formModal').on 'shown.bs.modal', (e) ->
	$('#special_care_desactivation_date .input-group.date').datepicker(format: "yyyy-mm-dd", todayBtn: "linked")