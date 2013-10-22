$(function() {
  $("#item_group_item_sell_price").change(function() {
    $('#item_group_item_buy_price').val(this.value/2);
  });
});
