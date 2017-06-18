$(document).on('turbolinks:load',function(){
  $('.news-item').click(function(e){
    $(this).addClass('expanded');
    $(this).find('div.news-main-img').show();
  });

  $('.see-less').click(function(e){
    e.preventDefault();
    e.stopPropagation();
    $(this).parent().siblings('div.news-main-img').hide();
    $(this).parents('.news-item').removeClass('expanded');
  });
});
