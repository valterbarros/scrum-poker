class @ChangeTask
  constructor: (change_task_channel) ->
    @change_task_channel = change_task_channel
    ChangeTaskChannel.CALLBACK = change_task_callback

  change_task_callback = (data) ->
    update_task_id_value(data)
    change_task_title(data)
    remove_confimation_vote()

  update_task_id_value = (data) ->
    if inputs = $("[name='vote[task_id]']")
      inputs.each -> 
        @.value = data['task_id']

  change_task_title = (data) ->
    $('.page-header .title').html(data['title'])

  remove_confimation_vote = ->
    $('.card.selectable').removeClass('confirmed')

  handler_events: ->
    handle_on_change_task_click.call(@)

  handle_on_change_task_click = ->
    ctc = @change_task_channel
    $('.change-task .item').on 'click', ->
      change_active_class_from_change_task.call(@)
      task_id = $(@).data('id')
      ctc.changeTask({ title: @.innerHTML, task_id: task_id })

  change_active_class_from_change_task = ->
    $('.change-task .item').removeClass('active')
    $(@).addClass('active')

$(document).on 'turbolinks:load', ->
  ct = new ChangeTask(ChangeTaskChannel.get_instance())
  ct.handler_events()
