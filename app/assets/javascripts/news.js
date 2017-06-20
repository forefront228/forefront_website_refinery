$(document).on('turbolinks:load',function(){
  $('#articles-list').on('click', '.news-item', function(e){
    $(this).addClass('expanded');
    $(this).find('div.news-main-img').show();
  });

  $('#articles-list').on('click', '.see-less', function(e){
    e.preventDefault();
    e.stopPropagation();
    $(this).parent().siblings('div.news-main-img').hide();
    $(this).parents('.news-item').removeClass('expanded');
  });
});
