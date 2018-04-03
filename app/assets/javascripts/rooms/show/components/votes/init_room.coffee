class @InitRoom
  handler_events: ->
    block_cards_from_users()

  block_cards_from_users = ->
    FinishVotation.block_all_cards_from_users() if $('.page-header').data('room-status') == 'finish'
    $('.open-label').show() unless $('.page-header').data('room-status') == 'finish'

$(document).on 'turbolinks:load', ->
  new InitRoom().handler_events()
