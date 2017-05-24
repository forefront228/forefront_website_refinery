$(document).on('turbolinks:load',function(){
  $('.news-item').click(function(e){
    $(this).addClass('expanded');
  });

  $('.see-less').click(function(e){
    e.preventDefault();
    e.stopPropagation();
    $(this).parents('.news-item').removeClass('expanded');
  });
});
