/*slide*/
var slides = document.querySelectorAll('.slide');
var currentSlide = 0;
var slideInterval = setInterval(nextSlide, 1000);

function nextSlide() {
    slides[currentSlide].className = 'slide';
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].className = 'slide active';
    console.log(currentSlide);
    console.log(slides.length);
}

var playing = true;
var pauseButton = document.getElementById('pause');
var pauseButton2 = document.getElementById('pause2');
var pauseButton3 = document.getElementById('pause3');

function pauseSlideshow() {
    document.getElementById("playpause").style.opacity="1";
    pauseButton.innerHTML = '<i class="fas fa-play" style="font-size:24px;"></i>';
    playing = false;
    clearInterval(slideInterval);
}

function playSlideshow() {
    document.getElementById("playpause").style.opacity="-1";
    pauseButton.innerHTML = '<i class="fas fa-pause" style="font-size:24px;"></i>'; 
    playing = true;
    slideInterval = setInterval(nextSlide, 1000);
}

pauseButton.onclick = function () {
    if (playing) {
        pauseSlideshow();
    } else {
        playSlideshow();
    }
};

function pauseOnclick() {
    if (playing) {
        pauseSlideshow();
    } else {
        playSlideshow();
    }
};

