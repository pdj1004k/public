<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  
<script>
  /* 자동 슬라이스드*/
/* var slideIndex = 0;

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
} */
 var slideIndex = 0;

function plusSlides(n) {
  showSlides(slideIndex += n);
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
}

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
	  slides[i].style.display = "none";
  } 
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 3000); // Change image every 3 seconds
}
var dots = document.getElementsByClassName("dot");
function currentSlide(n) {
showSlides().stop;
for (i = 0; i < dots.length; i++) {
	dots[i].className = dots[i].className.replace(" active", "");
/* dots[i].style.display = "block"; */

	}
dots[slideIndex-1].className += " active";
 
 
 

</script>

 <!-- 캐러셀 부분 시작 -->
<div class="slideshow-container">

<div class="mySlides fade">
 <img src="images/spot1.jpg" style="width:100%"
  onClick="location.href='NonageServlet?command=catagory&kind=1'"> 
   <!-- <div class="text">Caption Text</div> -->
</div>

<div class="mySlides fade">
  <img src="images/spot2.jpg"style="width:100%"
   onClick="location.href='NonageServlet?command=catagory&kind=2'">
  <!-- <div class="text">Caption Two</div> -->
</div>

<div class="mySlides fade">
  <img src="images/spot3.jpg" style="width:100%"
   onClick="location.href='NonageServlet?command=catagory&kind=3'">
 <!--  <div class="text">Caption Three</div> -->
</div>
<div class="mySlides fade">
  <img src="images/spot4.jpg" style="width:100%"
   onClick="location.href='NonageServlet?command=catagory&kind=4'">
 <!--  <div class="text">Caption Three</div> -->
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span>
  <span class="dot" onclick="currentSlide(4)"></span> 
</div>



<!--// 캐러셀 부분 끝  -->
  <div class="clear"></div>   

  <div id="front">   
    <h2> New Item</h2>     
    <div id="bestProduct">         
      <c:forEach items="${newProductList }"  var="productVO">
        <div id="item">
          <a href=
"NonageServlet?command=product_detail&pseq=${productVO.pseq}">
            <img src="product_images/${productVO.image}" />
            <h3> ${productVO.name} </h3>    
            <p>${productVO.price2} </p>
          </a>    
        </div>
      </c:forEach>      
    </div>
   <div class="clear"></div>
     
    <h2> Best Item</h2>     
      <div id="bestProduct">         
        <c:forEach items="${bestProductList}"  var="productVO">
          <div id="item">
           <a href=
"NonageServlet?command=product_detail&pseq=${productVO.pseq}">
             <img src="product_images/${productVO.image}" />
           <h3> ${productVO.name} </h3>    
           <p>${productVO.price2} </p>
        </a>  
      </div>
    </c:forEach>      
  </div>
  <div class="clear"></div>
  </div>
    
<%@ include file="../footer.jsp" %>   

<script>
/* slideIndex = 1;
showSlides(slideIndex); */

var slideIndex =0;
showSlides();

</script> 