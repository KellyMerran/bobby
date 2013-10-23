$(function() {
  $('.item-form').on('change', '#item_group_item_sell_price', function() {
  	var id = $(this).attr('data');
    $("#item_group_item_buy_price[data='" + id + "']").val(this.value/2);
  });
});
