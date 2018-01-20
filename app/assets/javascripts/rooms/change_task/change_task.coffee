class @ChangeTask
  constructor: (change_task_channel) ->
    @change_task_channel = change_task_channel
    ChangeTaskChannel.CALLBACK = change_task_title

  handler_events: ->
    handle_on_change_task_click.call(@)

  handle_on_change_task_click = ->
    ctc = @change_task_channel
    $('.change-task .item').on 'click', ->
      $('.change-task .item').removeClass('active')
      $(@).addClass('active')
      ctc.changeTask({title: @.innerHTML})

  change_task_title = (data) ->
    console.log data['title']
    $('.page-header .title').html(data['title'])

$(document).on 'turbolinks:load', ->
  ct = new ChangeTask(ChangeTaskChannel.get_instance())
  ct.handler_events()
