$('#searchModalLabel').html "<%= resource %>"
$('#searchModalContent').html "<%= j render 'partials/search_list', resource: resource %>"
$('#searchModal').modal 'show'

$('.table-responsive').on 'click','tr', ->
	$.gritter.add {image: '', title: 'Success', time: 1500, text: "You've selected a record.", class_name: 'success_notification' }
	<%= gflash js: true %>
	$('#modal_search_button').parent().parent().find('input').val(this.id)
	$('#searchModal').modal 'hide'