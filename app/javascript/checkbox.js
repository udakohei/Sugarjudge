$(function(){
  $(".js-checkbox-others").hide();
  
  function changeDisplay() {
    if ($(".chk:checked").length > 0) {
      $(".js-checkbox-others").show();
    } else {
      $(".js-checkbox-others").hide();
    };
  };

  changeDisplay();

  $("input[type='checkbox']").on('change', changeDisplay);
});