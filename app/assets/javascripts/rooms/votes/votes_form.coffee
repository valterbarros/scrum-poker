class @VotesForm
  handler_events: ->
    handle_on_vote_click()

  handle_on_vote_click = ->
    $('.inner .card-label').on 'click', ->
      target = $(@).data('target')
      $(target).submit()

$(document).on 'turbolinks:load', ->
  new VotesForm().handler_events()
