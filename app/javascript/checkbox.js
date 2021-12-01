$(function(){
  $(".js-checkbox-others, #js-abstract-checkbox").hide();
  
  function changeDisplay() {
    if ($(".chk:checked").length > 0) {
      $(".js-checkbox-others").show();
    } else {
      $(".js-checkbox-others").hide();
    };
  };

  changeDisplay();

  $("input[type='checkbox']").on('change', changeDisplay);

  $("#js-abstract-button").on('click', function(){
    $("#js-abstract-checkbox").show(),
    $("#js-concrete-checkbox, #js-abstract-button").hide();
  });
});