class @ChangeTaskChannel
  room_id: -> $("[data-channel='rooms']").data('roomId')

  @CALLBACK = ''

  constructor: ->
    @change_task = App.cable.subscriptions.create "ChangeTaskChannel",
      received: (data) ->
        ChangeTaskChannel.CALLBACK.call(null, data) if ChangeTaskChannel.CALLBACK

  #singleton methods
  instance = null

  @get_instance: ->
    instance ?= new ChangeTaskChannel()

  followCurrentRoom: ->
    if room_id = @room_id()
      @change_task.perform 'follow', room_id: room_id
    else
      @change_task.perform 'unfollow'

  changeTask: (data) ->
    data['room_id'] = @room_id()
    @change_task.perform 'change_task', data: data
