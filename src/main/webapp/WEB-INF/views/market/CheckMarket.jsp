
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="airbnb, booking, city guide, directory, events, hotel booking, listings, marketing, places, restaurant, restaurant">
    <meta name="description" content="Guido - Directory & Listing HTML Template">
    <meta name="CreativeLayers" content="ATFN">
    <!-- css file -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <!-- Responsive stylesheet -->
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <!-- Title -->
    <title>사업자등록증 확인</title>
    <!-- Favicon -->
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" type="image/x-icon" />
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--sweet alert -->
    <script src="/assets/js/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">

        function marketCheck() {
            let b_no = document.getElementById("b_no").value;
            let start_dt = document.getElementById("start_dt").value;
            let p_nm = document.getElementById("p_nm").value;

            let data = {
                "businesses": [
                    {
                        "b_no": b_no,
                        "start_dt": start_dt,
                        "p_nm": p_nm,
                    }
                ]
            };
            $.ajax({
                url: "http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=i6xokwKsdvlwERvOibTsIL6z%2Fx7Y1f3bZZSapli7HQFff1hKKi0qpR1Avr9aof8KZRK4TA%2FqzJT37gpPvxCt7Q%3D%3D",  // serviceKey 값을 xxxxxx에 입력
                type: "POST",
                data: JSON.stringify(data), // json 을 string으로 변환하여 전송
                dataType: "JSON",
                contentType: "application/json",
                accept: "application/json",
                success: function (result) {
                    console.log(result.data[0].valid);
                    if(result.data[0].valid =='01') {
                        swal('정상적인 사업자입니다.', "확인눌러 회원가입을 진행해주세요.", 'success')
                            .then(function(){
                                location.href="/market/MarketRegForm";
                            });
                    }else {
                        swal('사업자를 다시 확인해주세요', "확인눌러 다시 진행해주세요", 'error')

                    }},



                error: function (result) {
                    console.log(result.responseText); //responseText의 에러메세지 확인
                    if(result.data[0].valid =='02'){
                        swal('사업자를 다시 확인해주세요', "확인눌러 다시 진행해주세요", 'error')

                    }else{
                        swal('정상적인 사업자입니다.', "확인눌러 회원가입을 진행해주세요.", 'success')
                            .then(function(){
                                location.href="/market/MarketRegForm";
                            });
                    }}
            });
        }

    </script>

</head>
<body>
<div class="wrapper">
    <div class="preloader"></div>

    <!-- Main Header Nav -->
    <header class="header-nav menu_style_home_one style2 navbar-scrolltofixed stricky main-menu">
        <div class="container-fluid p0">
            <!-- Ace Responsive Menu -->
            <nav>
                <!-- Menu Toggle btn-->

                <a href="index.html" class="navbar_brand float-left dn-smd">

                    <strong><h1 style="font-size: 60px; color:#125d2e; font-weight: bold;">aga</h1></strong>
                </a>
                <!-- Responsive Menu Structure-->
                <!--Note: declare the Menu style in the data-menu-style="horizontal" (options: horizontal, vertical, accordion) -->
                <div class="ht_left_widget style2 float-left">
                    <ul>
                        <li class="list-inline-item">
                            <div class="ht_search_widget">
                                <div class="header_search_widget inner_page">
                                    <form class="form-inline mailchimp_form">
                                        <input type="text" class="custom_search_with_menu_trigger form-control" placeholder="공방 찾아보기" data-toggle="modal" data-target="#staticBackdrop">
                                        <button type="submit" class="btn"><span class="flaticon-loupe"></span></button>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div style="padding-right: 5%;">
                    <ul id="respMenu" class="ace-responsive-menu text-right" data-menu-style="horizontal">
                        <li>
                            <a href="#"><span class="title">공방 리스트</span></a>
                            <!-- Level Two-->

                        </li>
                        &nbsp;&nbsp;&nbsp;

                        <li>
                            <a href="#"><span class="title">환경트렌드</span></a>
                            <!-- Level Two-->
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>
                            <a href="#"><span class="title">마이페이지</span></a>
                            <!-- Level Two-->
                            <ul>
                                <li><a href="index.html">찜한 공방</a></li>
                                <li><a href="index.html">마이 정보 수정</a></li>

                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>
                            <a href="#"><span class="title">고객센터</span></a>
                            <!-- Level Two-->
                            <ul>
                                <li><a href="index.html">자주 묻는 질문</a></li>
                                <li><a href="index.html">1:1 문의하기</a></li>
                                <li><a href="index.html">내가 쓴 글</a></li>

                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>

                        <li class="list-inline-item list_s">
                            <a href="a_signup.html" class="btn flaticon-avatar">
                                <span class="dn-1200">login</span></a></li>

                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- Modal -->
    <div class="sign_up_modal modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-md mt100" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body container pb20 pl0 pr0 pt0">
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="sign_up_tab nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Sign in</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Register</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content container" id="myTabContent">
                        <div class="row mt40 tab-pane fade show active pl20 pr20" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="col-lg-12">
                                <div class="login_form">
                                    <form action="#">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Username / Email">
                                        </div>
                                        <div class="input-group form-group mb5">
                                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="form-group custom-control custom-checkbox">

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row mt40 tab-pane fade pl20 pr20" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="col-lg-12">
                                <div class="sign_up_form">
                                    <ul class="nav nav-pills mb-4" id="pills-tab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Customer</a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Business Owner</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                            <form action="#">
                                                <div class="form-group input-group">
                                                    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email">
                                                </div>
                                                <div class="form-group input-group">
                                                    <input type="text" class="form-control" id="exampleInputName" placeholder="Username">
                                                </div>
                                                <div class="form-group input-group mb20">
                                                    <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                                                </div>
                                                <button type="submit" class="btn btn-log btn-block btn-thm">Sign Up</button>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-fb"><i class="fa fa-facebook float-left mt5"></i> Log In via Facebook</button>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-googl"><i class="fa fa-google float-left mt5"></i> Log In via Google+</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                            <form action="#">
                                                <div class="form-group input-group">
                                                    <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
                                                </div>
                                                <div class="form-group input-group">
                                                    <input type="text" class="form-control" id="exampleInputName2" placeholder="Username">
                                                </div>
                                                <div class="form-group input-group mb20">
                                                    <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password">
                                                </div>
                                                <button type="submit" class="btn btn-log btn-block btn-thm">Sign Up</button>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-fb"><i class="fa fa-facebook float-left mt5"></i> Log In via Facebook</button>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-googl"><i class="fa fa-google float-left mt5"></i> Log In via Google+</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Header Nav For Mobile -->

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</section>

<!-- Inner Page Breadcrumb -->
<section class="inner_page_breadcrumb">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6">
                <div class="breadcrumb_content">
                    <h2 class="breadcrumb_title">사업자 등록증 확인</h2>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Our LogIn Register -->
<section class="our-log-reg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-6 offset-lg-3">
                <div class="sign_up_form inner_page">
                    <ul class="nav nav-pills mb-4" id="pills-tab2" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="pills-home-tab2" data-toggle="pill" href="#pills-home2" role="tab" aria-controls="pills-home2" aria-selected="true">사업자</a>
                        </li>

                    </ul>
                    <div class="tab-content" id="pills-tabContent2">
                        <div class="tab-pane fade show active" id="pills-home2" role="tabpanel" aria-labelledby="pills-home-tab2">
                            <form action="#">
                                <div class="form-group input-group">
                                    <input type="text" class="form-control" name="b_no" id="b_no" placeholder="사업자 등록번호">
                                </div>
                                <div class="form-group input-group">
                                    <input type="text" class="form-control" name="start_dt" id="start_dt" placeholder="개업 일자">
                                </div>
                                <div class="form-group input-group mb20">
                                    <input type="text" class="form-control" name="p_nm" id="p_nm" placeholder="대표자 성명">
                                </div>
                                <div>
                                    <input type="button"  class="btn btn-log btn-block btn-thm" value="인증하기" onclick=marketCheck(); >
                                </div>

                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Our Footer -->
<section class="footer_one home1">
    <div class="container pb70">
        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="footer_contact_widget">
                    <h4>Contact Us</h4>
                    <ul class="list-unstyled">
                        <li class="text-white df"><span class="flaticon-pin mr15"></span><a href="#">서울특별시 강서구 화곡동 우장산로10길 112</a></li>
                        <li class="text-white"><span class="flaticon-phone mr15"></span><a href="#">82+ 010-9962-6997</a></li>
                        <li class="text-white"><span class="flaticon-email mr15"></span><a href="#">lowell0322@naver.com</a></li>
                    </ul>
                </div>
            </div>

            <hr>
            <div class="container pt20 pb30">
                <div class="row">
                    <div class="col-md-4 col-lg-4">
                        <div class="copyright-widget mt10 mb15-767">
                            <p>© aga - All rights reserved.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-4">
                        <div class="footer_logo_widget text-center mb15-767">
                            <div class="wrapper">
                                <div class="logo text-center">

                                    <span class="logo_title text-white pl15">aga</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
</section>
<a class="scrollToHome" href="#"><i class="fa fa-angle-up"></i></a>
</div>
<!-- Wrapper End -->
<script src="/assets/js/jquery-migrate-3.0.0.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/jquery.mmenu.all.js"></script>
<script src="/assets/js/ace-responsive-menu.js"></script>
<script src="/assets/js/bootstrap-select.min.js"></script>
<script src="/assets/js/snackbar.min.js"></script>
<script src="/assets/js/simplebar.js"></script>
<script src="/assets/js/parallax.js"></script>
<script src="/assets/js/scrollto.js"></script>
<script src="/assets/js/jquery-scrolltofixed-min.js"></script>
<script src="/assets/js/jquery.counterup.js"></script>
<script src="/assets/js/wow.min.js"></script>
<script src="/assets/js/progressbar.js"></script>
<script src="/assets/js/slider.js"></script>
<script src="/assets/js/timepicker.js"></script>
<script src="/assets/js/wow.min.js"></script>
<!-- Custom script for all pages -->
<script src="/assets/js/script.js"></script>
</body>
</html>