isTokenValid = (allowedTokens, currentTokens, tokenCreated) ->
	tokenAlreadyExist = _.find currentTokens, (token) -> token.value == tokenCreated.attrs.value
	tokenAllowed 		  = _.find allowedTokens, (token) -> token.value == tokenCreated.attrs.value
	(tokenAlreadyExist == undefined) && (tokenAllowed != undefined)

getTokenfieldsFor = (action) ->
	url_edit = "/#{$('form').attr('resource')}"
	if $('form').attr('new_record') == 'false'
		url_edit += "/#{$('form').attr('resource_id')}/#{$('form').attr('linked_resource')}"

	$.ajaxSetup { async:false }
	$.getJSON "/#{$('form').attr('linked_resource')}", (json) ->
		locals = json
		engine = new Bloodhound {
		  local: locals,
			datumTokenizer: (d) ->
				Bloodhound.tokenizers.whitespace(d.value)
			,
			queryTokenizer: Bloodhound.tokenizers.whitespace
		}
		engine.initialize()

		$('#tokenfield-typeahead').tokenfield {
			typeahead: [null, { source: engine.ttAdapter() }],
			delimiter: "|",
			beautify: false
		}
		$('#tokenfield-typeahead').on('tokenfield:createtoken', (e) ->
			isTokenValid(locals, $('#tokenfield-typeahead').tokenfield('getTokens'), e)
		).on('tokenfield:createdtoken', (e) ->
		).on('tokenfield:edittoken', (e) ->
		).on('tokenfield:removedtoken', (e) ->
		).tokenfield()

		$('.tokenfield').attr 'required','required'

	$.getJSON url_edit, (json) ->
		$('#tokenfield-typeahead').tokenfield 'setTokens', json

$('#modal-notifications').html "<%= j render 'partials/notifications' %>"
$('#formModalContent').html "<%= j render 'form', action: 'Update' %>"
$('#formModal').modal 'show'

$('.modal_search_button, .modal_search_button2').on 'click', (e) ->
	$.get '/get_records', {name: this.name, class_to: $(this).attr('class_to')}

$('#formModal').on 'shown.bs.modal', (e) ->
	$('.input-group.date').datepicker {
		format: "yyyy-mm-dd",
		todayBtn: "linked",
		autoclose: true,
		todayHighlight: true
	}

	if $('form').attr('linked_resource') != undefined
		getTokenfieldsFor('edit')