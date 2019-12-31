$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});


$(document).on('turbolinks:load', function() {

App.product = App.cable.subscriptions.create("ProductChannel", {
connected: function() {
App.product.listenToComments()
// Called when the subscription is ready for use on the server
},

disconnected: function() {
// Called when the subscription has been terminated by the server
},

received: function(data) {
$(".alert.alert-info").show();
$('#all-comments').prepend(data.comment);
$("#average-rating").attr('data-score', data.average_rating);
initRating();
initRated();
// Called when there's incoming data on the websocket for this channel
},

listenToComments: function() {
return this.perform('listen', {
product_id: $("[data-product-id]").data("product-id")
});
}
});

});
