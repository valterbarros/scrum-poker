App.participant_users = App.cable.subscriptions.create "ParticipantUsersChannel",
  collection: -> $("[data-channel='rooms']")

  connected: ->
    @followCurrentChannel()
    @installPageChangeCallback()

  received: (data) -> 
    App.management_room.new_user(data['user']) if App.management_room.currentUserIsOwnerFromRoom()

  followCurrentChannel: ->
    if room_id = @collection().data('roomId')
      @perform 'follow', room_id: room_id 
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', -> App.participant_users.followCurrentChannel()
