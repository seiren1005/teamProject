<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <!-- ============================================-->
      <!-- <section> begin ============================-->
      <section class="bg-secondary">

        <div class="container">
          <div class="row">
            <div class="col-12 col-sm-12 col-lg-6 mb-4 order-0 order-sm-0"><a class="text-decoration-none" href="/mainpage"><img src="/resources/img/Logo.png" height="70" alt="" /></a>
              <p class="text-light my-4"> <i class="fas fa-map-marker-alt me-3"></i><span class="text-light">서울시 영등포구 영중로 56 신한빌딩 4,  &nbsp;</span><a class="text-light" href="tel:+000-000-0000">+000-000-0000</a><br />5층 주식회사 글로벌인</p>
              <p class="text-light"> <i class="fas fa-envelope me-3"> </i><a class="text-light" href="mailto:Itproject5@samplmail.com">Itproject5@samplmail.com </a></p>
              <p class="text-light"> <i class="fas fa-phone-alt me-3"></i><a class="text-light" href="tel:1-000-000-0000">1-000-000-0000 (Support)</a></p>
            </div>
            
            <div class="col-6 col-sm-4 col-lg-2 mb-3 order-2 order-sm-1">
              <h5 class="lh-lg fw-bold mb-4 text-light font-sans-serif"><a href="/bulletin/bulletinList">게시판</a></h5>
     
            </div>
            <div class="col-6 col-sm-4 col-lg-2 mb-3 order-3 order-sm-2">
              <h5 class="lh-lg fw-bold text-light mb-4 font-sans-serif"><a href="/infopage">사이트 소개</a></h5>
            
            </div>
            <div class="col-6 col-sm-4 col-lg-2 mb-3 order-3 order-sm-2">
              <h5 class="lh-lg fw-bold text-light mb-4 font-sans-serif">코딩 사이트 소개</a></h5>
              <ul class="list-unstyled mb-md-4 mb-lg-0">
                <li class="lh-lg"><a class="text-200" href="/detail/detail-TCP">TCPSchool</a></li>
                <li class="lh-lg"><a class="text-200" href="/detail/detail-Tohoho">Tohoho</a></li>
                <li class="lh-lg"><a class="text-200" href="/detail/detail-LifeCoding">생활코딩</a></li>
              </ul>
            </div>
          </div>
        </div>
        <!-- end of .container-->

      </section>
      <!-- <section> close ============================-->
      <!-- ============================================-->


      <section class="py-0" style="margin-top: -5.8rem;">
        <div class="container bg-primary">
          <div class="row justify-content-md-between justify-content-evenly py-4">
            <div class="col-12 col-sm-8 col-md-6 col-lg-auto text-center text-md-start">
              <p class="fs--1 my-2 fw-bold">박민석, 박우준, 엄혜원, 이다빈 &copy; ITproject, 2022</p>
            </div>
            <div class="col-12 col-sm-8 col-md-6">
              <p class="fs--1 my-2 text-center text-md-end"> Made with&nbsp;
                <svg class="bi bi-suit-heart-fill" xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#EB6453" viewBox="0 0 16 16">
                  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"></path>
                </svg>&nbsp;by&nbsp;<a class="fw-bold text-900" href="https://themewagon.com/" target="_blank">ThemeWagon </a>
              </p>
            </div>
          </div>
        </div>
      </section>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->

		<!-- 상단으로 이동하기 버튼 -->
		<a href="#" class="btn_gotop"> Top
		  <span class="glyphicon glyphicon-chevron-up">
		  </span>
		</a>
		
		
		<style>
		.btn_gotop {
			display:none;
			position:fixed;
			bottom:30px;
			right:30px;
			z-index:999;
			border:1px solid #ccc;
			outline:none;
			background-color:white;
			color:#333;
			cursor:pointer;
			padding:15px 20px;
			border-radius:100%;
		}
		</style>
		
		
		<script>
		$(window).scroll(function(){
			if ($(this).scrollTop() > 300){
				$('.btn_gotop').show();
			} else{
				$('.btn_gotop').hide();
			}
		});
		$('.btn_gotop').click(function(){
			$('html, body').animate({scrollTop:0},400);
			return false;
		});
		</script>


    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="/resources/public/vendors/@popperjs/popper.min.js"></script>
    <script src="/resources/public/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="/resources/public/vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="/resources/public/vendors/fontawesome/all.min.js"></script>
    <script src="/resources/public/assets/js/theme.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&amp;family=Rubik:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet">
  </body>

</html>