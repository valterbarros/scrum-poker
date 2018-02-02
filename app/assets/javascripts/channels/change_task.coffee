class @ChangeTaskChannel
  room_id: -> $("[data-channel='rooms']").data('roomId')

  @CALLBACK = ''

  constructor: ->
    @change_task = App.cable.subscriptions.create "ChangeTaskChannel",
      channel: () -> ChangeTaskChannel.get_instance()
      received: (data) ->
        ChangeTaskChannel.CALLBACK.call(null, data) if ChangeTaskChannel.CALLBACK
      connected: ->
        @channel().followCurrentRoom()
        @channel().installPageChangeCallback()

  followCurrentRoom: ->
    if room_id = @room_id()
      @change_task.perform 'follow', room_id: room_id
    else
      @change_task.perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', (-> @followCurrentRoom()).bind(@)

  changeTask: (data) ->
    data['room_id'] = @room_id()
    @change_task.perform 'change_task', data: data

  #singleton methods
  instance = null

  @get_instance: ->
    instance ?= new ChangeTaskChannel()
