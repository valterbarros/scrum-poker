class @FinishVotation
  constructor: (finish_votation_channel)->
    @finish_votation_channel = finish_votation_channel 
    FinishVotationChannel.CALLBACK = FinishVotation.finish_votation_callback

  @finish_votation_callback: ->
    block_all_cards_from_users()

  block_all_cards_from_users = ->
    $('.finish-label').show()
    $('.page-header').data('room-status', 'closed')
    $('.card.selectable').not('.confirmed').find('.inner').css('background', 'gray')
    $('.card.selectable').css('border-color', 'gray')

  handler_events: ->
    handle_on_finish_click.call(@)

  handle_on_finish_click = ->
    fv = @finish_votation_channel
    $('#finish_votation').on 'click', ->
      fv.finish()
      $('span.steps').each ->
        @.voted = '?' if @.voted == undefined
      App.management_room.flip_cards()

  reset_card_votation = ->
    $('span.steps').each ->
      @.voted = undefined

$(document).on 'turbolinks:load', ->
  fv = new FinishVotation(FinishVotationChannel.get_instance())
  fv.handler_events()
