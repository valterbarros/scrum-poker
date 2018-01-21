class @RoomForm
  @handler_events: ->
    handle_submit_on_click()

  handle_submit_on_click = ->
    $('#submit_new_room').on 'click', ->
      merge_all_inputs_in_room_form()
      form = $(@).data('target')
      $(form).submit()

  merge_all_inputs_in_room_form = ->
    inputs = $('#new_task_form .task_inputs input')
    inputs_cloned = inputs.clone()
    tasks_inputs = pass_text_fields_to_hidden(inputs_cloned)

    $('#room_form #task_inputs').html(tasks_inputs)

  pass_text_fields_to_hidden = (inputs) ->
    inputs.each ->
      $(@).attr('type', 'hidden')

$(document).on 'turbolinks:load', ->
  RoomForm.handler_events()
