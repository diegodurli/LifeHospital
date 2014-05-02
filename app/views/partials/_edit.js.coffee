$('#modal-notifications').html "<%= j render 'partials/notifications' %>"
$('#modal-content').html "<%= j render 'form', action: 'Update' %>"
$('#myModal').modal 'show'

$('#myModal').on 'shown.bs.modal', (e) ->
	$('#special_care_desactivation_date .input-group.date').datepicker(format: "yyyy-mm-dd", todayBtn: "linked")