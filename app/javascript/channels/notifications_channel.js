import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    console.log("Connected to notification channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("Received data:", data)

    let user_inputs = document.getElementById("user_inputs")

    let div = document.createElement('div');

    div.className = 'highlight';

    // console.log("message", data.message)

    div.innerHTML = data.message

    // div.appendChild(data);

    user_inputs.prepend(div)
  }
});
