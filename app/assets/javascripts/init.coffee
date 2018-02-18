window.App ||= {}

App.init = ->
  new Steps().init()
  $('.task-select').selectpicker();
