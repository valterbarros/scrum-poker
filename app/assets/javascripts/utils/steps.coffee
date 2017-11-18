@Steps = ->

  @init = ->
    $('.bs-wizard-dot').on 'click', (e)->
      e.preventDefault()
      step = $(this).attr('step')
      changeStepTo(parseInt(step))

  changeStepTo = (step) ->
    console.log(step)
    $(".step-01").css 'display', 'none'
    $(".step-02").css 'display', 'none'

    if step == 1
      $(".step-01").css 'display', 'block'

    else if step == 2
      $(".step-02").css 'display', 'block'

  return
