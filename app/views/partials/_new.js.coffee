$('#modal-notifications').html "<%= j render 'partials/notifications' %>"
$('#modal-content').html "<%= j render 'form', action: 'Create' %>"
$('#myModal').modal 'show'