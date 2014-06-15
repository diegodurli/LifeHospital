$('#listingModalLabel').html "Details for <%= patient.name %>"
$('#listingModalContent').html "<%= j render partial: 'partials/collapse_details', locals: {patient: patient} %>"
$('#listingModal').modal 'show'