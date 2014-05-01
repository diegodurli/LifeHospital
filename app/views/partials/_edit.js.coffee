$('#modal-notifications').html "<%= j render 'partials/notifications' %>"
$('#modal-content').html "<%= j render 'form', action: 'Update' %>"
$('#myModal').modal 'show'