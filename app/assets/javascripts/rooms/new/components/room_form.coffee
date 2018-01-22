class @RoomForm
  @handler_events: ->
    handle_submit_on_click()

  handle_submit_on_click = ->
    $('#submit_new_room').on 'click', ->
      merge_all_inputs_in_room_form()
      form = $(@).data('target')
      $(form).submit()

  merge_all_inputs_in_room_form = ->
    task_inputs = $('#new_task_form .task-inputs input')
    task_inputs_cloned = task_inputs.clone()
    tasks_inputs = pass_text_fields_to_hidden(task_inputs_cloned)
    $('#room_form #task_inputs').html(tasks_inputs)

    step_inputs = $('#new_step_form .step-inputs input')
    step_inputs_cloned = step_inputs.clone()
    steps_inputs = pass_text_fields_to_hidden(step_inputs_cloned)
    $('#room_form #step_inputs').html(steps_inputs)

  pass_text_fields_to_hidden = (inputs) ->
    inputs.each ->
      $(@).attr('type', 'hidden')

$(document).on 'turbolinks:load', ->
  RoomForm.handler_events()
