<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<main id="main">
	<!-- ======= Portfolio Details Section ======= -->
	<section id="portfolio-details" class="portfolio-details" style="height: 660px; margin-left: 60px;">

		<div class="container">

			<div class="row" style="width: 800px; height: 800px;">
		

                    <div class="col-lg-8">
                        <div class="owl-carousel portfolio-details-carousel">
                        <c:forEach var="i" items="${restEntity.restImages}">
                      
                             <img src="/images/${i.imageUrl}"  class="img-fluid"  alt="" style="background-size: cover;"> 
                   
                                </c:forEach>
                            <!-- <img src="/upload/${i.imageUrl}" > -->

                        </div>
                    </div>
             
				
			
			 
				<div class="col-lg-4 portfolio-info">
					<h3>
						<strong>${restEntity.name}</strong>
					</h3>
					<ul>
						<li><strong>위치</strong>: ${restEntity.location}</li>
						<li><strong>성급</strong>: ${restEntity.level }</li>
					</ul>
					<br>
					<div class="text-box-detail"
						style="background-color: #fffff3; width: 500px; height: 200px;">
						<br>
						<p>
							<strong style="margin-left: 10%;">사장님의 한마디</strong>
						</p>
						<p style="margin-left: 10%; color: #808080;">${restEntity.comment}</p>
					</div>
					<div>
<button type="button" class="gra_left_right_red" style="margin-top: 20px;  border: 1px solid #f7323f; color: #fff; height: 40px; width: 500px;"><a href="/saveAfter">후기쓰기</a></button>
</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- End Portfolio Details Section -->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">



		
			
			<c:forEach var="rooms" items="${restEntity.roomsList}">
			<c:forEach var="a" items="${roomsEntity.roomsImages}">
						<div class="col mb-5">
							<a href="#" style="color: black;">
								<div class="card h-100" style="border: 1px solid #808080;">
									<!-- Product image-->
										
									<img class="card-img-top" src="/upload/${a.imageUrl}" alt="..."
										style="border: 1px solid #808080;" />
									
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center" style="color: black;">
											<!-- Product name-->
											<h5 class="fw-bolder">${rooms.name}</h5>
											<!-- Product price-->
											${rooms.price}원<br>
											<a href="/payMain/${rooms.id}">	
											<button style="background-color:#f3230f; color: white; margin-top: 10%;">예약하기</button>
										</a>
										</div>
									</div>
									<!-- Product actions-->
								</div>
							</a>
						</div>
						</c:forEach>
			</c:forEach>
			
			

			</div>
		</div>
		
		<div class="container">



		<div class="container" style="margin-top: 150px;">
        <p style="color: #52483a; font-size:30px; font-weight: bold; margin-left: 500px;">리뷰 게시판</p>

	<c:forEach var="after" items="${afterEntity}"> <!-- items = for each문으로 바뀐다고 생각 var = post는 페이지스코프에 담김-->
		<!-- var은 페이지스코프에들어감 -->

		<div class="card" style="margin-top: 40px;">
			<!-- Block : 넓이 끝가지 , inline : 넓이끝까지 안감. -->
			<div class="card-body">
				<h4 class="card-title">${after.title}</h4>
				<a href="/after/${after.id}" class="btn btn-primary" style="background-color: #f7323f; border-color: #f7323f; color: #fff;" >상세보기</a>
			</div>
		</div>
		<br/>
		<!-- End of Card -->
	</c:forEach>
					

</div>
	
</main>
<!-- End #main -->
<%@ include file="layout/footer.jsp"%>