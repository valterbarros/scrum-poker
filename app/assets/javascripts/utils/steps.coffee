@Steps = ->

  @init = ->
    $('.next-step').on 'click', (e)->
      step = $(this).attr('step')
      toggleActiveClass($(this))
      changeStepTo(parseInt(step))

  changeStepTo = (step) ->
    $(".step-00").css 'display', 'none'
    $(".step-01").css 'display', 'none'

    if step == 0
      $(".step-00").css 'display', 'block'

    else if step == 1
      $(".step-01").css 'display', 'block'

  toggleActiveClass = (el) ->
    active_class = el.attr('active')
    $('.step-session').removeClass(active_class) if active_class == 'active'
    li = el.parent('.step-session')
    li.addClass(active_class)
  return
