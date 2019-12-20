<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<%-- <%@ include file="sub_img.html"%>   
<%@ include file="sub_menu.html" %> --%>     
  <article>
     <div id="itemdetail" >
      <form  method="post" name="formm">    
        <fieldset>
          <legend> </legend>  
          <a href="NonageServlet?command=product_detail&pseq=${productVO.pseq}">         
            <span style="float: left;">
              <img  src="product_images/${productVO.image}"  />
            </span>              
            <h2> ${productVO.name} </h2>  
          </a>    
          <label> 가 격 :  </label>  
          <p> ${productVO.price2}원</p>
          <label> 사이즈 :  </label> 
          <p>free(55~77)</p>  
          <label> 수 량 : </label>
          <input type="number">
          <a href="#a"></a>
          <!-- <a href="#a"></a> -->
          <!-- <input  type="number"      name="quantity"  size="2"      value="1"><br> -->
          <input  type="hidden"    name="pseq"       value="${productVO.pseq}"><br> 
        <div id="buttons">
		 <input type="button" value="v 바로 구매"       class="submit"   onclick="go_order()">  
          <input type="button" value="장바구니"   class="submit2"    onclick="go_cart()"> 
         </div>
         </fieldset>
      </form>  
    </div>
    <div id='detail'>
         <fieldset >
        <h1>상품 상세 정보</h1>
         <span style="float: left;">
              <img  src="product_images/${productVO.fImage}"  />
         </span> 
         <span style="float: left;">
              <img  src="product_images/${productVO.sImage}"  />
         </span> 
         <span style="float: left;">
              <img  src="product_images/${productVO.tImage}"  />
         </span> 
        </fieldset>
        </div>
  </article>
<%@ include file="../footer.jsp" %>    