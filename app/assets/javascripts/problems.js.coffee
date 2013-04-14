# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('.problem-thumbs-down').click( (ev) ->
		ev.preventDefault()
		id = $(ev.currentTarget).data('problem')
		$.post(
			'problems/'+id+'/thumbs_down',
			dataType: 'json',
			success: (data) ->
				oldVal = parseInt($('[data-plusminus-id='+id+']').html())
				$('[data-plusminus-id='+id+']').html(oldVal-1)
  		)
	)


	$('.problem-thumbs-up').click( (ev) ->
		ev.preventDefault()
		id = $(ev.currentTarget).data('problem')
		$.post(
			'problems/'+id+'/thumbs_up',
			dataType: 'json',
			success: (data) ->
				oldVal = parseInt($('[data-plusminus-id='+id+']').html())
				$('[data-plusminus-id='+id+']').html(oldVal+1)
  		)
	)