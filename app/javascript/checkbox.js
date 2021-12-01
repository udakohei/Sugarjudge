$(function(){
  $(".js-checkbox-others, #js-abstract-checkbox").hide();
  
  function changeDisplay() {
    if ($("#js-concrete-checkbox .js-chk:checked").length > 0) {
      $("#js-concrete-checkbox .js-checkbox-others").show();
    } else {
      $("#js-concrete-checkbox .js-checkbox-others").hide();
    };

    if ($("#js-abstract-checkbox .js-chk:checked").length > 0) {
      $("#js-abstract-checkbox .js-checkbox-others").show();
    } else {
      $("#js-abstract-checkbox .js-checkbox-others").hide();
    };
  };

  changeDisplay();

  $("input[type='checkbox']").on('change', changeDisplay);

  $("#js-abstract-button").on('click', function(){
    $("#js-abstract-checkbox").show(),
    $("#js-concrete-checkbox, #js-abstract-button").hide();
  });
});