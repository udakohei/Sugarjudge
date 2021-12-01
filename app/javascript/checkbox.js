$(function(){
  // 初期状態のボタンは無効
  $("#btn1").prop("disabled", true);
    // チェックボックスの状態が変わったら（クリックされたら）
    
        // チェックされているチェックボックスの数
        if ($(".chk:checked").length > 0) {
          // ボタン有効
          $("#btn1").prop("disabled", false);
        } else {
          // ボタン無効
          $("#btn1").prop("disabled", true);
        };


    $("input[type='checkbox']").on('change', function () {
      // チェックされているチェックボックスの数
      if ($(".chk:checked").length > 0) {
        // ボタン有効
        $("#btn1").prop("disabled", false);
      } else {
        // ボタン無効
        $("#btn1").prop("disabled", true);
      }
  });
});