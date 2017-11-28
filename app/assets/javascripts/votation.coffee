App.votation = 
  participant_users: {}

  new_user: (user) ->
    @participant_users[user.id] = user
    @render_participant_users()

  render_participant_users: ->
