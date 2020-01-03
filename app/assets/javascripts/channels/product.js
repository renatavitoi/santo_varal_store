$(document).on('turbolinks:load', function() {

  App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
  App.product.listen_to_comments()
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      $(".alert.alert-info").show();
      //console.log(data);
      $('#new_comment').prepend(data.comment);
      $("#average-rating").attr('data-score', "<%= @product.average_rating %>");
      refreshRating();
    },
    listen_to_comments: function() {
      return this.perform('listen', {
        product_id: $("[data-product-id]").data("product-id")
      });
    }
  });

});
