window.App ||= {}

App.init = ->
  new Steps().init()
  new SetCallbackPageChangeChannel(new ChangeTaskChannel())
