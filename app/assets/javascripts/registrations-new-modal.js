$(function() {
  // registrations/newの画像がクリックされた時
  $("#registrations-new-img-1").on("click", function() {
    // カルーセルが自動で動いていることにより付与されている"active"クラスを削除
    $(".item" + ".active").removeClass("active");
    // モーダルで表示されるスライドに"active"クラスを追加
    $(".registrations-new-modal-slide-1" + ".item").addClass("active");
  });
  $("#registrations-new-img-2").on("click", function() {
    $(".item" + ".active").removeClass("active");
    $(".registrations-new-modal-slide-2" + ".item").addClass("active");
  });
  $("#registrations-new-img-3").on("click", function() {
    $(".item" + ".active").removeClass("active");
    $(".registrations-new-modal-slide-3" + ".item").addClass("active");
  });
  $("#registrations-new-img-4").on("click", function() {
    $(".item" + ".active").removeClass("active");
    $(".registrations-new-modal-slide-4" + ".item").addClass("active");
  });
});
