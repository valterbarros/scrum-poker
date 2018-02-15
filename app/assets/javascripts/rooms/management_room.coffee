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
    card.get(0).voted = data['score']
    card.removeClass('label-default')
    card.addClass('label-success')

  render_participant_users: (user) ->
    self = @
    $(".tasks-votation").append(
      """
        <tr>
          <td>#{user.name}</td>
          <td>#{@build_steps(user.id)}</td>    
        </tr>

      """)

  flip_cards: (data) ->
    card = $('span.steps')
    card.each ->
      vote_value = @.voted
      $(@).html(vote_value)
    card.removeClass('label-success')
    card.addClass('label-default')

  all_users_voted: ->
    all_voted = []
    $('span.steps').each ->
      all_voted.push(@.voted != undefined)
    all_voted.every (currentValue) ->
      currentValue == true

  build_card_selector: (data) ->
    ".step-result-0#{data['step_position']}#user-card-id-#{data['user_id']}"

  build_steps: (user_id) ->
    html = ''
    for num in [0..1]
      html += """ 
        <span class='steps label label-default step-result-0#{num}' id='user-card-id-#{user_id}'>? </span>
      """
    return html

