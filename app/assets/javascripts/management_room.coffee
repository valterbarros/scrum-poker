App.management_room = 
  participant_users: {}

  collection: -> $("[data-channel='rooms']")

  currentUserIsOwnerFromRoom: () ->
    @collection().data('ownerRoomId') is parseInt($('meta[name=current-user]').attr('id'))

  new_user: (user) ->
    @participant_users[user.id] = false
    @render_participant_users(user)

  mark_card_as_voted: (data) ->
    card = $(@build_card_selector(data))
    card.html(data['score']) 
    card.get(0).voted = 1
    console.log "all voted" if @all_users_voted()

  render_participant_users: (user) ->
    for num in [0..1]
      $(".step-0#{num}").append(
        """
          <div class="col-lg-2 col-md-3 col-xs-4">
            <div class="card-container">
              <h4>#{user.name}</h4>
              <div class="card selectable">
                <div class="inner">
                  <a id="user-card-id-#{user.id}" class="card-label">?</a>
                </div>
              </div>
            </div>
          </div>
        """
      )

  flip_cards: ->

  all_users_voted: ->
    all_voted = []
    $('.card-label').each (el) ->
      all_voted.push(@.voted is 1)
    all_voted.every (currentValue) ->
      currentValue == true

  build_card_selector: (data) ->
    ".step-0#{data['step_position']} #user-card-id-#{data['user_id']}"

	remove_user: (user) ->
		delete @participant_users[user.id]
		@render_participant_users()
