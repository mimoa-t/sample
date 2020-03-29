$(function() {
  Payjp.setPublicKey('pk_test_1298cac61f9e75c5ceb5c863');
  $("#token_submit").on('click', function(e){
    e.preventDefault();
    var year = $('#expiration_year').val();
    var fullyear = '20' + year ;
    let card = {
        number: $('#card_number').val(),
        cvc:$('#security_code').val(),
        exp_month: $('#expiration_month').val(),
        exp_year: fullyear
    };

    Payjp.createToken(card, function(status, response) {
      if (response.error) {
        $("#token_submit").prop('disabled', false);
        alert("カード情報が正しくありません。");
      }
      else {
        $("#card_number").removeAttr("name");
        $("#security_code").removeAttr("name");
        $("#expiration_month").removeAttr("name");
        $("#expiration_year").removeAttr("name");
        let token = response.id;
        $("#card_token").append(
          $('<input type="hidden" name="payjpToken">').val(response.id)
        );
        $("#card_form").get(0).submit();
      }
    });
  });
});