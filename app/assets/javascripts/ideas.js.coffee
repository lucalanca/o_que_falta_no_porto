# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('.idea-thumbs-down').click( (ev) ->
		ev.preventDefault()
		id = $(ev.currentTarget).data('idea')
		console.log(id)
		$.post(
			'ideas/'+id+'/thumbs_down',
			dataType: 'json',
			success: (data) ->
				oldVal = parseInt($('[data-plusminus-id='+id+']').html())
				$('[data-plusminus-id='+id+']').html(oldVal-1)
  		)
	)


	$('.idea-thumbs-up').click( (ev) ->
		ev.preventDefault()
		id = $(ev.currentTarget).data('idea')
		console.log(id)
		$.post(
			'ideas/'+id+'/thumbs_up',
			dataType: 'json',
			success: (data) ->
				oldVal = parseInt($('[data-plusminus-id='+id+']').html())
				$('[data-plusminus-id='+id+']').html(oldVal+1)
  		)
	)