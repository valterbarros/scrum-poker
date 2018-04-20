class @RemoveUser
  handler_events: ->
    handle_on_remove_user_click()

  handle_on_remove_user_click = ->
    $('.remove_user').on 'ajax:success', (data) ->
      id = data.currentTarget.attributes['id'].nodeValue
      $('#row-' + id).remove();

$(document).on 'turbolinks:load', ->
  new RemoveUser().handler_events()