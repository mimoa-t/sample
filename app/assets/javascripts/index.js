$(function(){
  let tabs = $(".top__content__tabs");

  function tabSwitch() {
    $(".top__active").removeClass("top__active");
    $(this).addClass("top__active");

    const index = tabs.index(this);
    $(".top__content__lists").removeClass("show").eq(index).addClass("show");
  };

  tabs.click(tabSwitch); 
});

$(function(){
  let tabs = $(".bottom__content__tabs");

  function tabSwitch() {
    $(".bottom__active").removeClass("bottom__active");
    $(this).addClass("bottom__active");

    const index = tabs.index(this);
    $(".bottom__content__lists").removeClass("show").eq(index).addClass("show");
  };

  tabs.click(tabSwitch); 
});


// slick
$(function(){
  $(".toppage-slider").slick({
    autoplay: true,
    dots: true,
  });
});

