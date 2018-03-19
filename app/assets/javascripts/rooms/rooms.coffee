$(document).on 'turbolinks:load', ->
  fv = new FinishVotation(FinishVotationChannel.get_instance())
  fv.handler_events()

  ct = new ChangeTask(ChangeTaskChannel.get_instance())
  ct.init()
  ct.handler_events()
