App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    console.log(data)
    new Notification data['title'], body: data['content']
