var addSelection = function(){
  var clone = $('.template').clone();
  clone.removeClass('template');
  clone.find('.add-stock').click(addSelection);
  $('.selection').append(clone);
}
jQuery(function($){
  addSelection();
})