App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    $('.notification-items').prepend(data['partial'])
    count = $('.notification-count').html()
    $('.notification-count').html(parseInt(count) + 1)
