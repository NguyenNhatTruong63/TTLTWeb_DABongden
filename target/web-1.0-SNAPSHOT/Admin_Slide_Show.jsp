<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14/05/2024
  Time: 14:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .slideshow-container {
        position: relative;
        max-width: 1000px;
        margin: auto;
    }

    .slide {
        display: none;
    }

    .prev, .next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        padding: 16px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        z-index: 1;
        user-select: none;
    }

    .prev {
        left: 0;
    }

    .next {
        right: 0;
    }

</style>
<div class="slideshow-container">
    <div class="slide fade">
        <img src="https://lh5.googleusercontent.com/GBUP_-MmtFCRhZIgjgb0sB89g_lq8xlvX7AG4bfnfrZt7o39g5rE8wtKDyjnoWGMTAKzgLxY5qZ3zvqi4HECftAypzemNXDZoBz03c9rYhUWYdRrYzTGPiVY4UyN0eQDSnrmr9Djf_kWQhLTfOhz3woJfSc5c8ZyujAnFPdwUpRG7KqTNZqWbIeQzA" style="width:100%; height: 500px" alt="slide 1">
    </div>
    <div class="slide fade">
        <img src="https://diennuockhanhtrung.com/wp-content/uploads/2021/05/bong-den-tiet-kiem-dien-1-1.jpg" style="width:100%; height: 500px" alt="slide 2">
    </div>
    <div class="slide fade">
        <img src="https://lh5.googleusercontent.com/GBUP_-MmtFCRhZIgjgb0sB89g_lq8xlvX7AG4bfnfrZt7o39g5rE8wtKDyjnoWGMTAKzgLxY5qZ3zvqi4HECftAypzemNXDZoBz03c9rYhUWYdRrYzTGPiVY4UyN0eQDSnrmr9Djf_kWQhLTfOhz3woJfSc5c8ZyujAnFPdwUpRG7KqTNZqWbIeQzA" style="width:100%; height: 500px" alt="slide 3">
    </div>
    <!-- Add more slides as needed -->
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("slide");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        slides[slideIndex-1].style.display = "block";
        setTimeout(showSlides, 2000); // Change image every 2 seconds
    }

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }
</script>


