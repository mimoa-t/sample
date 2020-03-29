// プレビュー画像作成
$(function(){
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  $('#img-file').change(function(){
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      if (num == 5){
        $('#image-box__container1').css('display', 'none')  
        $('#image-box__container2').css('display', 'block') 
      } else if (num >=5 && num <= 9){
        $('#image-box__container2').css('display', 'block') 
      } else {
        $('#image-box__container2').css('display', 'none')   
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="100" >
                      </div>
                    </div>
                    <div class='item-image__operation'>
                      <div class='item-image__operation--update'>編集</div>
                      <div class='item-image__operation--delete'>削除</div>
                    </div>
                  </div>`
        if (num <=5){          
          $('#image-box__container1').before(html);
        }
        else{  
          $('#image-box__container2').before(html);  
        }  
      }
      $('#image-box__container1').attr('class', `item-num-${num}`)
    });  
  });
  // 削除機能
  $(document).on("click", '.item-image__operation--delete', function(){
    var target_image = $(this).parent().parent()
    var target_name = $(target_image).data('image')
    if(file_field.files.length==1){
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
    }else{
      $.each(file_field.files, function(i,input){
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      file_field.files = dataBox.files
    }
    target_image.remove()
    var num = $('.item-image').length
    if (num <= 4){
      $('#image-box__container1').css('display', 'block')  
      $('#image-box__container2').css('display', 'none') 
    }
    if (num >=5 && num <= 9){
      $('#image-box__container2').css('display', 'block') 
    }  
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)
  })
})