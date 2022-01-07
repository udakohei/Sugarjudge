$(document).on('turbolinks:load', function(){
  $("#js-abstract-checkbox").hide();
  
  $("#js-abstract-button").on('click', function(){
    $("#js-abstract-checkbox").show(),
    $("#js-concrete-checkbox, #js-abstract-button").hide();
  });
});