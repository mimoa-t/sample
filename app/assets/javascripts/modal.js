$(function() {
  // 「Open」ボタンをクリック時に、fadeInメソッドでHTML要素を表示する
  $('#modal-open-btn').on('click', function() {
    $('#overlay, #modalWindow').fadeIn();
  });
  
  // 「Close」ボタンをクリック時に、fadeOutメソッドでHTML要素を非表示にする
  $('#modal-close-btn').on('click', function() {
    $('#overlay, #modalWindow').fadeOut();
  });

  $('#delete-comformation-btn').on('click', function() {
    $('#item-delete-btn').click();
  });
});