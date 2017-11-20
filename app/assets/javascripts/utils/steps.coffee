@Steps = ->

  @init = ->
    $('.bs-wizard-dot').on 'click', (e)->
      e.preventDefault()
      step = $(this).attr('step')
      changeStepTo(parseInt(step))

  changeStepTo = (step) ->
    $(".step-00").css 'display', 'none'
    $(".step-01").css 'display', 'none'

    if step == 0
      $(".step-00").css 'display', 'block'

    else if step == 1
      $(".step-01").css 'display', 'block'

  return
