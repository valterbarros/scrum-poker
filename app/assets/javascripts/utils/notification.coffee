class @AppNotification
  constructor: (@text, @time) ->

  show_error_with_timeout: ()->
    new Noty({
      type: 'error',
      text: @text,
      timeout: @time 
    }).show()

  show_success_with_timeout: () ->
    new Noty({
      type: 'success',
      text: @text,
      timeout: @time 
    }).show()
