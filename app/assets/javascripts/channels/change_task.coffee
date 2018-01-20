class @ChangeTaskChannel
  #singleton methods
  instance = null

  @get_instance: ->
    instance ?= new ChangeTaskChannel()

  @CALLBACK = ''

  constructor: ->
    @room_id = $("[data-channel='rooms']") 
    @change_task = App.cable.subscriptions.create "ChangeTaskChannel",
      received: (data) ->
        ChangeTaskChannel.CALLBACK.call(null, data) if ChangeTaskChannel.CALLBACK

  followCurrentRoom: ->
    if room_id = @room_id.data('roomId')
      @change_task.perform 'follow', room_id: room_id
    else
      @change_task.perform 'unfollow'

