$(function () {

  var preVideo = null;

  var swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  const progressCircle = document.querySelector(".autoplay-progress svg");
  const progressContent = document.querySelector(".autoplay-progress span");

  var swiper = new Swiper(".mySwiper", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    on: {
      autoplayTimeLeft(s, time, progress) {
        progressCircle.style.setProperty("--progress", 1 - progress);
        progressContent.textContent = `${Math.ceil(time / 1000)}s`;
      },
    },
  });

  // play_btn 아이콘이 클릭되었을 때 실행되는 함수
  document.querySelectorAll(".play_btn").forEach(function (playBtn) {
    playBtn.addEventListener("click", function () {
      var iframe = this.closest(".main-swiper-div").querySelector(".pc_video");

      var videoId = iframe.src.split("/")[4].split("?")[0];

      // autoplay=1 파라미터 추가
      iframe.src =
        "https://www.youtube.com/embed/" +
        videoId +
        "?autoplay=1&mute=1&enablejsapi=1&showinfo=0&rel=0&modestbranding=1&controls=0&loop=0";
      console.log("플레이 버튼 클릭");

      // iframe을 보이도록 변경
      iframe.style.display = "block";

      // video_img 요소 숨기기
      this.closest(".video_img").style.display = "none";

      // 슬라이드 일시 중지
      swiper.autoplay.stop();
    });
  });

  // 비디오가 재생될 때 자동슬라이드 일시 중지
  document.querySelector(".pc_video").addEventListener("playing", function () {
    swiper.autoplay.stop();
  });

  // 비디오가 중지 될 때 지동슬라이드 시작
  document.querySelector(".pc_video").addEventListener("pause", function () {
    swiper.autoplay.start();
  });

  // // 비디오가 종료 될 때 자동슬라이드 시작
  document.querySelector(".pc_video").addEventListener("ended", function () {
    swiper.autoplay.start();
  });

  // // 슬라이드 버튼을 클릭하면 자동슬라이드 다시 시작
  document.querySelectorAll(".swiper-button-next").forEach(function (button) {
    button.addEventListener("click", function () {
      swiper.autoplay.start();
    });
  });

});
