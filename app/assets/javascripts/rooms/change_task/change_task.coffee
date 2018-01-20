class @ChangeTask
  @constructor: ->
    ChangeTaskChannel.CALLBACK = () -> console.log 'callback install'

new ChangeTask()
