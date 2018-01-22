class @Tasks
  @handler_events: ->
    handle_add_task_on_click()

  handle_add_task_on_click = ->
    $('#add_new_task').on 'click', ->
      form = $(@).data('target')
      $(form).append(task_section_html())

  task_section_html = ->
    html =  
    """
      <div class='form-group task-inputs'>
        <label for='room_tasks_attributes_title'>Title</label>
        <input type='text' name='room[tasks_attributes][][title]' id='room_tasks_attributes_title' class='form-control'>
      </div>
    """

$(document).on 'turbolinks:load', ->
  Tasks.handler_events()
