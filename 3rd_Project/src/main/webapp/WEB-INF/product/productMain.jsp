<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	body{
		padding-top: 140px;  
	}
</style>

<%@ include file="productHeader.jsp" %> 
	 
	<!-- 캐러샐 이미지 부분 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
		</div> 
		<div class="carousel-inner"> 
			<div class="carousel-item active">
				<img src="resources/image/ca_ex1.jpg" class="d-block w-100"> 
			</div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex2.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex3.jpg" class="d-block w-100"> 
		    </div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex4.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex5.jpg" class="d-block w-100">
		    </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    	<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    	<span class="visually-hidden">Next</span>
	  	</button>
	</div>
	
	<div id="center" style="text-align: center;"> 
		<div style="font-family: 'TheJamsil5Bold'; font-size: 25pt; padding: 100px 0px 100px 0px;"><small>【</small> BEST <small>】</small></div>
		<div class="row">
			<c:forEach var="pb" items="${product_BLists}">
				<div class="col-lg-3">
					<div class="card shadow-sm" style="border: 1px solid #F6F6F6; margin-bottom: 23px;">
						<a href="prodView.p?p_num=${pb.p_num}&pageNumber=${pageInfo.pageNumber}">
							<div style="height: 300px; width: 100%; overflow: hidden;">
								<img src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_ttlimg}" style="height: 300px; margin: auto;">
							</div>
						</a>
						<div class="card-body">
							<p style="font-family: 'RIDIBatang'; font-size: 10pt; color: #A6A6A6; width: 100%; text-align: left; top: 15px; position: relative;">${pb.p_brand}</p> 
							<p style="width: 100%; font-family: 'RIDIBatang'; font-size: 12pt; text-align: left; overflow: hidden; white-space: nowrap;">${pb.p_name}</p>
							<p style="width: 100%; font-family: 'TheJamsil5Bold'; font-size: 12pt; text-align: left; padding: 0px;">
								<fmt:formatNumber value="${pb.p_price}" pattern="#,###" />원
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<a href="#">
		<img src="resources/image/banner.jpg" width="100%">
	</a> 
	  
	<div id="center" style="text-align: center;"> 
		<div style="font-family: 'TheJamsil5Bold'; font-size: 25pt; padding: 100px 0px 100px 0px;"><small>【</small> NEW <small>】</small></div>
		<div class="row">
			<c:forEach var="pb" items="${product_NLists}">
				<div class="col-lg-3">
					<div class="card shadow-sm" style="border: 1px solid #F6F6F6; margin-bottom: 23px;">
						<a href="prodView.p?p_num=${pb.p_num}&pageNumber=${pageInfo.pageNumber}">
							<div style="height: 300px; width: 100%; overflow: hidden;">
									<img src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_ttlimg}" style="height: 300px; margin: auto;">
							</div>
						</a>
						<div class="card-body">
							<p style="font-family: 'RIDIBatang'; font-size: 10pt; color: #A6A6A6; width: 100%; text-align: left; top: 15px; position: relative;">${pb.p_brand}</p> 
							<p style="width: 100%; font-family: 'RIDIBatang'; font-size: 12pt; text-align: left; overflow: hidden; white-space: nowrap;">${pb.p_name}</p>
							<p style="width: 100%; font-family: 'TheJamsil5Bold'; font-size: 12pt; text-align: left; padding: 0px;">
								<fmt:formatNumber value="${pb.p_price}" pattern="#,###" />원
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

<%@ include file="../views/footer.jsp" %>
