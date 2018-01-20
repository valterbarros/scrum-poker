window.App ||= {}

App.init = ->
  new Steps().init()
  new SetCallbackPageChangeChannel(ChangeTaskChannel.get_instance())
