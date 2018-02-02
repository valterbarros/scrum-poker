class @VotesForm
  handler_events: ->
    handle_on_vote_click()

  handle_on_vote_click = ->
    $('.inner .card-label').on 'click', ->
      target = $(@).data('target')
      $(target).submit()
      setTimeToRemoveConfirmedClass.call(@)

  setTimeToRemoveConfirmedClass = ->
    setTimeout ( -> 
      $(@).parents('.card.selectable').removeClass('confirmed')
    ).bind(@), 2000

$(document).on 'turbolinks:load', ->
  new VotesForm().handler_events()
