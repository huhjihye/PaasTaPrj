<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
          content="airbnb, booking, city guide, directory, events, hotel booking, listings, marketing, places, restaurant, restaurant">
    <meta name="description" content="Guido - Directory & Listing HTML Template">
    <meta name="CreativeLayers" content="ATFN">
    <!-- css file -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <!-- Responsive stylesheet -->
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <!-- Title -->
    <title>사업자 회원가입 페이지 test</title>
    <!-- Favicon -->
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" type="image/x-icon"/>
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type ="text/javascript">

        function kakaoPost(f) {
            new daum.Postcode({
                oncomplete: function (data) {
                    let address = data.address;
                    let zonecode = data.zonecode;
                    f.addr1.value = "(" + zonecode + ")" + address
                }
            }).open();
        }

    <!-- 사용자 입력 확인 -->
        function Checkfield(f) {
            if (f.marketId.value == "") {
                alert("아이디를 입력하세요");
                f.marketId.focus();
                return false;
            }
            if (f.marketName.value == "") {
                alert("마켓이름을 입력하세요");
                f.marketName.focus();
                return false;
            }
            if (f.password.value == "") {
                alert("비밀번호를 입력하세요");
                f.password.focus();
                return false;
            }
            if (f.password2.value == "") {
                alert("비밀번호 확인을 입력하세요");
                f.password2.focus();
                return false;
            }
            if (f.password.value != f.password2.value) {
                alert("비밀번호가 다릅니다 다시 입력하세요");
                f.password.focus();
                return false;
            }
            if (f.email.value == "") {
                alert("이메일을 입력하세요");
                f.email.focus();
                return false;
            }
            if (f.addr1.value == "") {
                alert("주소를 입력하세요");
                f.addr1.focus();
                return false;
            }
            if (f.addr2.value == "") {
                alert("상세주소를 입력하세요");
                f.addr2.focus();
                return false;
            }
        }

    </script>

    <!--이메일 인증 전송-->
    <script>
        //인증 메일 전송
        function doSendmail() {
            $.ajax({
                url: "/market/sendmail",
                type: "post",
                data: $("#email"),
                /*dataType이란 내가 반환받을 데이터의 형태를 명시해주는 것*/
                dataType: 'json',
                success(pMap) {
                    let data = pMap["res"];
                    randomPin = pMap["randomPin"];
                    if (data == 1) {
                        $("#sendemail_result").text("메일발송이 완료되었습니다.");
                        $("#sendemail_result").css("color", "blue");
                        $("#btn_reg").attr("type","submit");
                    } else {
                        $("#sendemail_result").text("이메일을 다시 입력해주세요");
                        $("#sendemail_result").css("color", "red");
                        $("#btn_reg").attr("type","button");
                    }
                    //인증번호 실시간 확인
                    $("#auth_email").on("propertychange change keyup paste input", function () {
                        console.log("인증번호 실시간 확인 코드 시작");
                        if (randomPin == $("#auth_email").val()) { // //인증 키 값을 비교를 위해 텍스트인 풋과 벨류를 비교
                            $("#auth_res").text("인증번호가 일치 합니다");
                            $("#auth_res").css('color', 'blue');
                            $("#btn_reg").attr("type", "submit");
                        } else {
                            $("#auth_res").text("인증번호를 다시 확인해 주세요");
                            $("#auth_res").css('color', 'red');
                            $("#btn_reg").attr("type", "button"); //attr. 해당 태그 속성을 바꿔줌
                        }
                    });
                }
            });
        }

    </script>

    <script type="text/javascript">

        /* 유저 유효성 검사 정규식 */
        //아이디 정규식
        let userIdT = /^[a-z0-9]{4,12}$/;
        // 이름 정규식
        let userNameT = /^[가-힣]{2,6}$/;
        // 비밀번호 검사 정규식//
        let userPwdT = /^[A-Za-z0-9]{4,12}$/;
        // 이메일 검사 정규식
        let userEmailT = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;


        $(document).ready(function () {

            $("#marketId").blur(function () {
                if (!userIdT.test($("#marketId").val())) {
                    console.log("false");
                    $("#id_check").text("영문자와 숫자 4~12자 이내로 입력하세요");
                    $("#id_check").css("color", "red");
                } else {
                    console.log("true");
                    $("#id_check").text("");
                }
            });
            $("#marketName").blur(function () {
                if (!userNameT.test($("#marketName").val())) {
                    console.log("false");
                    $("#name_check").text("한글 2~6자 이내로 입력하세요");
                    $("#name_check").css("color", "red");
                } else {
                    console.log("true");
                    $("#name_check").text("");
                }
            });
            $("#password").blur(function () {
                if (!userPwdT.test($("#password").val())) {
                    console.log("false");
                    $("#pwd_check").text("영문자+숫자 포함 8~20자 이내로 입력하세요");
                    $("#pwd_check").css("color", "red");
                } else {
                    console.log("true");
                    $("#pwd_check").text("");
                }
            });


        });
    </script>

    <script type="text/javascript">

        function pwdConfirm() {
            /* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
            /* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
            /* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
            var password = document.getElementById('password');					//비밀번호
            var password2 = document.getElementById('password2');	//비밀번호 확인 값
            var msg = document.getElementById('pwd2_check');				//확인 메세지
            var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
            var wrongColor = "#ff0000";	//틀렸을 때 출력되는 색깔

            if (password.value == password2.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
                msg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
                msg.innerHTML = "비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
            } else {
                msg.style.color = wrongColor;
                msg.innerHTML = "비밀번호 불일치";
            }
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
                <div class="menu-toggle">
                    <img class="nav_logo_img img-fluid" src="/assets/images/header-logo.svg" alt="header-logo.svg">
                    <button type="button" id="menu-btn">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
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
                                        <input type="text" class="custom_search_with_menu_trigger form-control"
                                               placeholder="공방 찾아보기" data-toggle="modal" data-target="#staticBackdrop">
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body container pb20 pl0 pr0 pt0">
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="sign_up_tab nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                       aria-controls="home" aria-selected="true">Sign in</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                       aria-controls="profile" aria-selected="false">Register</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content container" id="myTabContent">
                        <div class="row mt40 tab-pane fade show active pl20 pr20" id="home" role="tabpanel"
                             aria-labelledby="home-tab">
                            <div class="col-lg-12">
                                <div class="login_form">
                                    <form action="#">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <input type="text" class="form-control" id="inlineFormInputGroupUsername2"
                                                   placeholder="Username / Email">
                                        </div>
                                        <div class="input-group form-group mb5">
                                            <input type="password" class="form-control" id="exampleInputPassword1"
                                                   placeholder="Password">
                                        </div>
                                        <div class="form-group custom-control custom-checkbox">

                                        </div>
                                        <button type="submit" class="btn btn-log btn-block btn-thm">Sign in</button>
                                        <p class="text-center mb30 mt20">Don't have an account? <a class="text-thm"
                                                                                                   href="#">Sign up</a>
                                        </p>
                                        <hr>
                                        <div class="row mt30">
                                            <div class="col-lg-6">
                                                <button type="submit" class="btn btn-fb btn-block"><i
                                                        class="fa fa-facebook float-left mt5"></i> Log In via Facebook
                                                </button>
                                            </div>
                                            <div class="col-lg-6">
                                                <button type="submit" class="btn btn-googl btn-block"><i
                                                        class="fa fa-google float-left mt5"></i> Log In via Google+
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row mt40 tab-pane fade pl20 pr20" id="profile" role="tabpanel"
                             aria-labelledby="profile-tab">
                            <div class="col-lg-12">
                                <div class="sign_up_form">
                                    <ul class="nav nav-pills mb-4" id="pills-tab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill"
                                               href="#pills-home" role="tab" aria-controls="pills-home"
                                               aria-selected="true">Customer</a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill"
                                               href="#pills-profile" role="tab" aria-controls="pills-profile"
                                               aria-selected="false">Business Owner</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                                             aria-labelledby="pills-home-tab">
                                            <form action="#">
                                                <div class="form-group input-group">
                                                    <input type="email" class="form-control" id="exampleInputEmail2"
                                                           placeholder="Email">
                                                </div>
                                                <div class="form-group input-group">
                                                    <input type="text" class="form-control" id="exampleInputName"
                                                           placeholder="Username">
                                                </div>
                                                <div class="form-group input-group mb20">
                                                    <input type="password" class="form-control"
                                                           id="exampleInputPassword2" placeholder="Password">
                                                </div>
                                                <button type="submit" class="btn btn-log btn-block btn-thm">Sign Up
                                                </button>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-fb"><i
                                                                class="fa fa-facebook float-left mt5"></i> Log In via
                                                            Facebook
                                                        </button>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-googl"><i
                                                                class="fa fa-google float-left mt5"></i> Log In via
                                                            Google+
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                                             aria-labelledby="pills-profile-tab">
                                            <form action="#">
                                                <div class="form-group input-group">
                                                    <input type="email" class="form-control" id="exampleInputEmail3"
                                                           placeholder="Email">
                                                </div>
                                                <div class="form-group input-group">
                                                    <input type="text" class="form-control" id="exampleInputName2"
                                                           placeholder="Username">
                                                </div>
                                                <div class="form-group input-group mb20">
                                                    <input type="password" class="form-control"
                                                           id="exampleInputPassword3" placeholder="Password">
                                                </div>
                                                <button type="submit" class="btn btn-log btn-block btn-thm">Sign Up
                                                </button>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-fb"><i
                                                                class="fa fa-facebook float-left mt5"></i> Log In via
                                                            Facebook
                                                        </button>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <button type="submit" class="btn btn-block btn-googl"><i
                                                                class="fa fa-google float-left mt5"></i> Log In via
                                                            Google+
                                                        </button>
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
    <div id="page" class="stylehome1 h0">
        <div class="mobile-menu">
            <div class="header stylehome1">
                <div class="main_logo_home2 text-left">
                    <img class="nav_logo_img img-fluid mt15" src="/assets/images/header-logo2.svg"
                         alt="header-logo2.svg">
                    <span class="mt15">Guido</span>
                </div>
                <ul class="menu_bar_home2">
                    <li class="list-inline-item"><a class="custom_search_with_menu_trigger msearch_icon" href="#"
                                                    data-toggle="modal" data-target="#staticBackdrop"><span
                            class="flaticon-loupe"></span></a></li>
                    <li class="list-inline-item"><a class="muser_icon" href="page-register.html"><span
                            class="flaticon-avatar"></span></a></li>
                    <li class="list-inline-item"><a class="menubar" href="#menu"><span></span></a></li>
                </ul>
            </div>
        </div><!-- /.mobile-menu -->
        <nav id="menu" class="stylehome1">
            <ul>
                <li><span>Home</span>
                    <ul>
                        <li><a href="index.html">Home V1</a></li>
                        <li><a href="index2.html">Home V2</a></li>
                        <li><a href="index3.html">Home V3</a></li>
                    </ul>
                </li>
                <li><span>Explore</span>
                    <ul>
                        <li><a href="page-author-single.html">Author Single</a></li>
                        <li><a href="page-city-single.html">City Single</a></li>
                        <li><a href="page-add-new-listing.html">New Listing</a></li>
                    </ul>
                </li>
                <li><span>Listing</span>
                    <ul>
                        <li><span>Listing Styles</span>
                            <ul>
                                <li><a href="page-listing-v1.html">Listing v1</a></li>
                                <li><a href="page-listing-v2.html">Listing v2</a></li>
                                <li><a href="page-listing-v3.html">Listing v3</a></li>
                                <li><a href="page-listing-v4.html">Listing v4</a></li>
                                <li><a href="page-listing-v5.html">Listing v5</a></li>
                            </ul>
                        </li>
                        <li><span>Listing Map</span>
                            <ul>
                                <li><a href="page-listing-v6.html">Map v1</a></li>
                                <li><a href="page-listing-v7.html">Map v2</a></li>
                                <li><a href="page-listing-v8.html">Map v3</a></li>
                                <li><a href="page-listing-v9.html">Map v4</a></li>
                            </ul>
                        </li>
                        <li><span>Listing Single</span>
                            <ul>
                                <li><a href="page-listing-single-v1.html">Single V1</a></li>
                                <li><a href="page-listing-single-v2.html">Single V2</a></li>
                                <li><a href="page-listing-single-v3.html">Single V3</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><span>Blog</span>
                    <ul>
                        <li><a href="page-blog-grid.html">Blog Grid</a></li>
                        <li><a href="page-blog-grid-sidebar.html">Blog Grid Sidebar</a></li>
                        <li><a href="page-blog-details.html">Blog Details</a></li>
                        <li><a href="page-blog-list.html">Blog List</a></li>
                        <li><a href="page-blog-single.html">Blog Single</a></li>
                    </ul>
                </li>
                <li><span>Pages</span>
                    <ul>
                        <li><span>Shop</span>
                            <ul>
                                <li><a href="page-shop.html">Shop Pages</a></li>
                                <li><a href="page-shop-single.html">Shop Single</a></li>
                                <li><a href="page-shop-cart.html">Cart</a></li>
                                <li><a href="page-shop-checkout.html">Checkout</a></li>
                                <li><a href="page-shop-order.html">Order</a></li>
                            </ul>
                        </li>
                        <li><a href="page-about.html">About Us</a></li>
                        <li><a href="page-contact.html">Contact</a></li>
                        <li><a href="page-coming-soon.html">Coming Soon</a></li>
                        <li><span>User Detils</span>
                            <ul>
                                <li><a href="page-my-dashboard.html">Dashboard</a></li>
                                <li><a href="page-profile.html">My Profile</a></li>
                                <li><a href="page-my-listing.html">My Listings</a></li>
                                <li><a href="page-my-bookmark.html">Bookmarks</a></li>
                                <li><a href="page-message.html">Messages</a></li>
                                <li><a href="page-my-review.html">Reviews</a></li>
                                <li><a href="page-add-new-listing.html">Add New Property</a></li>
                            </ul>
                        </li>
                        <li><a href="page-gallery.html">Gallery</a></li>
                        <li><a href="page-faq.html">Faq</a></li>
                        <li><a href="page-invoice.html">Invoice</a></li>
                        <li><a href="page-login.html">LogIn</a></li>
                        <li><a href="page-pricing.html">Pricing V1</a></li>
                        <li><a href="page-pricing2.html">Pricing V2</a></li>
                        <li><a href="page-register.html">Register</a></li>
                        <li><a href="page-error.html">404 Page</a></li>
                        <li><a href="page-terms.html">Terms and Conditions</a></li>
                        <li><a href="page-ui-element.html">UI Elements</a></li>
                    </ul>
                </li>
                <li><a href="page-contact.html">Contact</a></li>
                <li><a href="page-login.html"><span class="flaticon-avatar"></span> Login</a></li>
                <li><a href="page-register.html"><span class="flaticon-edit"></span> Register</a></li>
                <li class="cl_btn"><a class="btn btn-block btn-lg btn-thm rounded" href="#"><span class="icon">+</span>
                    Create Listing</a></li>
            </ul>
        </nav>
    </div>

    <!-- Search Field Modal -->
    <section class="modal fade search_dropdown" id="staticBackdrop" data-backdrop="static" data-keyboard="false"
             tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="popup_modal_wrapper">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <a class="close closer" data-dismiss="modal" aria-label="Close" href="#"><span><img
                                            src="images/icons/close.svg" alt=""></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 mb30">
                                    <h3>Filter by Category</h3>
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-2">
                                    <div class="icon-box text-center">
                                        <div class="icon"><span class="flaticon-cutlery"></span></div>
                                        <div class="content-details">
                                            <div class="title">Restaurant</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-2">
                                    <div class="icon-box text-center">
                                        <div class="icon"><span class="flaticon-shopping-bag"></span></div>
                                        <div class="content-details">
                                            <div class="title">Shopping</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-2">
                                    <div class="icon-box text-center">
                                        <div class="icon"><span class="flaticon-tent"></span></div>
                                        <div class="content-details">
                                            <div class="title">Outdoor Activities</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-2">
                                    <div class="icon-box text-center">
                                        <div class="icon"><span class="flaticon-desk-bell"></span></div>
                                        <div class="content-details">
                                            <div class="title">Hotels</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-2">
                                    <div class="icon-box text-center">
                                        <div class="icon"><span class="flaticon-mirror"></span></div>
                                        <div class="content-details">
                                            <div class="title">Beautu & Spa</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-2">
                                    <div class="icon-box text-center">
                                        <div class="icon"><span class="flaticon-brake"></span></div>
                                        <div class="content-details">
                                            <div class="title">Automotive</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 mb15 mt20">
                                    <h3>Explore Hot Location</h3>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc18.jpg"
                                                                alt="pc18.jpg"></div>
                                        <div class="details">
                                            <h4>Miami</h4>
                                            <p>62 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc19.jpg"
                                                                alt="pc19.jpg"></div>
                                        <div class="details">
                                            <h4>Roma</h4>
                                            <p>92 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc20.jpg"
                                                                alt="pc20.jpg"></div>
                                        <div class="details">
                                            <h4>New Delhi</h4>
                                            <p>12 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc21.jpg"
                                                                alt="pc21.jpg"></div>
                                        <div class="details">
                                            <h4>London</h4>
                                            <p>74 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc22.jpg"
                                                                alt="pc22.jpg"></div>
                                        <div class="details">
                                            <h4>Amsterdam</h4>
                                            <p>62 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc23.jpg"
                                                                alt="pc23.jpg"></div>
                                        <div class="details">
                                            <h4>Berlin</h4>
                                            <p>92 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc24.jpg"
                                                                alt="pc24.jpg"></div>
                                        <div class="details">
                                            <h4>Paris</h4>
                                            <p>12 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="/assets/images/property/pc25.jpg"
                                                                alt="pc25.jpg"></div>
                                        <div class="details">
                                            <h4>New Zealand</h4>
                                            <p>74 Listings</p>
                                        </div>
                                    </div>
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
                        <h2 class="breadcrumb_title">사업자 회원가입</h2>
                        <ol class="breadcrumb">

                        </ol>
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
                                <a class="nav-link" id="pills-profile-tab2" data-toggle="pill" href="#pills-profile"
                                   role="tab" aria-controls="pills-profile" aria-selected="false">Business Owner</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent2">
                            <div class="tab-pane fade show active" id="pills-ome2" role="tabpanel"
                                 aria-labelledby="pills-home-tab2">
                                <form  name="f" action="/market/insertMarketInfo" onsubmit="return Checkfield(this);" method="post">
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control" name="marketId" id="marketId"
                                               placeholder="아이디">
                                        <div id="id_check"></div>
                                        <div id="id_result"></div>
                                    </div>
                                    <div class="form-group input-group mb20">
                                        <input type="password" class="form-control" name="password" id="password"
                                               placeholder="비밀번호">
                                        <div id="pwd_check"></div>
                                    </div>
                                    <div class="form-group input-group">
                                        <input type="password" class="form-control" name="password2" id="password2"
                                               onkeyup="pwdConfirm()" placeholder="비밀번호 확인">
                                    </div>
                                    <div id="pwd2_check"></div>
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control" name="marketName" id="marketName"
                                               placeholder="이름">
                                        <div id="name_check"></div>
                                    </div>
                                    <div class="form-group input-group">
                                        <input type="email" class="form-control" name="email" id="email"
                                               placeholder="이메일">
                                        <div id="email_check"></div>
                                        <div id="email_result"></div>
                                    </div>
                                    <button type="button" onclick="doSendmail();" class="btn btn-log btn-block btn-thm">
                                        인증번호 발송
                                    </button>
                                    <div id="sendemail_result"></div>
                                    <br/>
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control" id="auth_email" placeholder="인증번호">
                                        <div id="auth_res" name="auth_res"></div>
                                    </div>
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control" name="addr1" id="addr1"
                                               placeholder="우편번호" readonly>
                                        <input type="button" value="우편번호 찾기" style="display:inline-block"
                                               onclick="kakaoPost(this.form)"/>
                                    </div>
                                    <div class="form-group input-group" id="adrr1_check"></div>
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control" name="addr2" id="addr2"
                                               placeholder="상세주소">
                                    </div>
                                    <div><input type="submit" value="회원가입" class="btn btn-log btn-block btn-thm"/></div>
                                </form>
                            </div>
<%--                            <div class="tab-pane fade" id="pills-profile2" role="tabpanel"--%>
<%--                                 aria-labelledby="pills-profile-tab2">--%>
<%--                                <form action="#">--%>
<%--                                    <div class="form-group input-group">--%>
<%--                                        <input type="email" class="form-control" id="exampleInputEmail5"--%>
<%--                                               placeholder="Email">--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group input-group">--%>
<%--                                        <input type="text" class="form-control" id="exampleInputName3"--%>
<%--                                               placeholder="Username">--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group input-group mb20">--%>
<%--                                        <input type="password" class="form-control" id="exampleInputPassword5"--%>
<%--                                               placeholder="Password">--%>
<%--                                    </div>--%>
<%--                                    <button type="submit" id=btn_reg class="btn btn-log btn-block btn-thm"--%>
<%--                                            onclick="Checkfield(this.form)">회원가입--%>
<%--                                    </button>--%>
<%--                                    <hr>--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-lg-6">--%>
<%--                                            <button type="submit" class="btn btn-block btn-fb"><i--%>
<%--                                                    class="fa fa-facebook float-left mt5"></i> Log In via Facebook--%>
<%--                                            </button>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-lg-6">--%>
<%--                                            <button type="submit" class="btn btn-block btn-googl"><i--%>
<%--                                                    class="fa fa-google float-left mt5"></i> Log In via Google+--%>
<%--                                            </button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
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
                            <li class="text-white df"><span class="flaticon-pin mr15"></span><a href="#">서울특별시 강서구 화곡동
                                우장산로10길 112</a></li>
                            <li class="text-white"><span class="flaticon-phone mr15"></span><a href="#">82+
                                010-9962-6997</a></li>
                            <li class="text-white"><span class="flaticon-email mr15"></span><a href="#">lowell0322@naver.com</a>
                            </li>
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
<script src="/assets/js/jquery-3.6.0.js"></script>
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
<!--카카오 우편번호 찾기 api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!— Custom script for all pages —>
<script src="/assets/js/script.js"></script>
</body>
</html>
