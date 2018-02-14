class @InitRoom
  handler_events: ->
    block_cards_from_users()

  block_cards_from_users = ->
    FinishVotation.finish_votation_callback() if $('.page-header').data('room-status') == 'finish'

$(document).on 'turbolinks:load', ->
  new InitRoom().handler_events()
