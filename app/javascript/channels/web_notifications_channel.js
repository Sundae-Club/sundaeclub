// Client-side which assumes you've already requested
// the right to send web notifications.
import consumer from "./consumer"

consumer.subscriptions.create("WebNotificationsChannel", {
  received(data) {
    document.getElementById('test_count').textContent = data["unread_notifications"]
  }
})
