$(document).on('turbolinks:load', function() {
});

App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    App.product.listenToComments()
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").fadeToggle(3000);
    $('.new-comment').prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
  },

  listenToComments: function() {
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});
