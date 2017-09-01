$(document).keydown(function(e) {
  if (e.keyCode == 37) {
    plusSlides(-1);
  }
});

$(document).keydown(function(e) {
  if (e.keyCode == 39) {
    plusSlides(1);
  }
});

$(document).keyup(function(e) {
  if (e.keyCode == 27) {
    closeModal();
  }
});


function openModal() {
  document.getElementById('myModal').style.display = "block";
}

function closeModal() {
  document.getElementById('myModal').style.display = "none";
}

var slideIndex = 1;
// showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("lightbox-thumbnail");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
};

// For filtering Adaptive on Project Index Page
$(document).on('turbolinks:load', function() {
  var animationSpeed = 100;
  var stubs = $('.project-stub');
  var nonAdaptiveStubs = $(".project-stub:not('.adaptive')");
  var adaptiveStubs = $('.adaptive');

  function toggleAdaptive() {
    $('#adaptive-toggle').text(function(i, text){
      return text === 'adaptive only' ? 'adaptive only √' : 'adaptive only';
    });
    $('#adaptive-toggle').toggleClass("active");

    if ($('#adaptive-toggle').attr('aria-pressed')=="false") {
      $('#adaptive-toggle').attr( 'aria-pressed', "true" );
      $(stubs).stop().animate({left:-2000},animationSpeed,function(){
        $(nonAdaptiveStubs).hide(0,function(){
          $(adaptiveStubs).stop().animate({left:0},animationSpeed);
        });
      });
    } else {
      $('#adaptive-toggle').attr( 'aria-pressed', "false" );
      $(adaptiveStubs).stop().animate({left:-2000},animationSpeed,function(){
        $(nonAdaptiveStubs).show(0,function(){
          $(stubs).stop().animate({left:0},animationSpeed);
        });
      });
    };
  };

  $('#adaptive-toggle').click(function(event){
    event.preventDefault();
    toggleAdaptive();
  })
});
