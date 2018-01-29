class @SetCallbackPageChangeChannel
  constructor: (channel) ->
    @installedPageChangeCallback = false
    @channel = channel
    installPageChangeCallback.call(@)

  installPageChangeCallback = ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      @channel.followCurrentRoom()
