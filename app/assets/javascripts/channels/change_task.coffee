class @ChangeTaskChannel
  @CALLBACK = ''

  constructor: ->
    @room_id = $("[data-channel='rooms']") 
    @change_task = App.cable.subscriptions.create "ChangeTaskChannel",
      received: (data) ->
        ChangeTaskChannel.CALLBACK.call(null, data) if ChangeTaskChannel.CALLBACK

  followCurrentRoom: ->
    if @room_id
      @change_task.perform 'folow', room_id: @room_id
    else
      @change_task.perform 'unfollow'
