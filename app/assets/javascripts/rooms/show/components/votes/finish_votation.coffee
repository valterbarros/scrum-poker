class @FinishVotation
  handler_events: ->
    handle_on_finish_click()

  handle_on_finish_click = ->
    $('#finish_votation').on 'click', ->
      $('.card-label').each ->
        @.voted = '?' if @.voted == undefined
      App.management_room.flip_cards()
      $('.card-label').each ->
        @.voted = undefined
      remove_confimation_vote()

  remove_confimation_vote = ->
    $('.card.selectable').removeClass('confirmed')

$(document).on 'turbolinks:load', ->
  new FinishVotation().handler_events()
