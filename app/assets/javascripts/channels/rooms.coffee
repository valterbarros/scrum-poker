App.room = App.cable.subscriptions.create "RoomsChannel",
  collection: -> $("[data-channel='rooms']")

  connected: ->
    @followCurrentRoom()
    @installPageChangeCallback()

  received: (data) ->
    App.management_room.mark_card_as_voted(data) if App.management_room.currentUserIsOwnerFromRoom()

  followCurrentRoom: ->
    if room_id = @collection().data('roomId')
      @perform 'follow', room_id: room_id 
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', -> App.room.followCurrentRoom()
