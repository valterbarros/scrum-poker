class @FinishVotationChannel
  room_id: -> $("[data-channel='rooms']").data('roomId')

  @CALLBACK = ''

  constructor: ->
    @finish_votation = App.cable.subscriptions.create "FinishVotationChannel",
      channel: () -> FinishVotationChannel.get_instance()
      received: () ->
        FinishVotationChannel.CALLBACK.call(null) if FinishVotationChannel.CALLBACK
      connected: ->
        @channel().followCurrentRoom()
        @channel().installPageChangeCallback()

  followCurrentRoom: ->
    if room_id = @room_id()
      @finish_votation.perform 'follow', room_id: room_id
    else
      @finish_votation.perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', (-> @followCurrentRoom()).bind(@)

  finish: ->
    @finish_votation.perform 'finish', { room_id: @room_id() } 

  #singleton methods
  instance = null

  @get_instance: ->
    instance ?= new FinishVotationChannel()
