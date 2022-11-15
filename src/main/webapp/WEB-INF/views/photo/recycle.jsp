<%--
  Created by IntelliJ IDEA.
  User: lowel
  Date: 2022-11-06
  Time: 오후 2:51
  To change this template use File | Settings | File Templates.
--%>
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

    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
    <script src="/assets/js/jquery-3.6.0.min.js"></script>
    <!--import 처럼 별도의 스크립트 파일을 가져올 시 함수 호출 가능 -->
    <script src="/assets/js/tensorflow.js"></script>
    <link rel="stylesheet" href="/assets/css/boardWrite.css">


    <!-- css file -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <!-- Responsive stylesheet -->
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <!-- Title -->
    <title>분리배출방법</title>
    <!-- Favicon -->
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" type="image/x-icon"/>
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]-->
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <script type="text/javascript">

        window.onload = function () {
            $(function () {

                //img-btn클릭시 input file 클릭
                $(document).on("click", ".photo_btn", function photo_event(e) {
                    e.preventDefault();
                    $('#files').click();
                });

                // 파일 객체에 변화가 일어났을때 발생하는 이벤트
                document.getElementById('files').addEventListener('change', readURL, true);

                function readURL(e) {
                    let files = document.getElementById("files").files[0];
                    console.log(files);
                    let reader = new FileReader();
                    reader.onloadend = function () {
                        //자동으로 생성된 아이디에 src 읽어온 파일 url로 교체 preview


                        //attr : 안에 있는 옵션 변경하게 해줌
                        $('#input-image').attr('src', reader.result);
                    }
                    if (files) {
                        reader.readAsDataURL(this.files[0]);
                    } else {
                    }
                }
            });
        }
    </script>
    <![endif]-->
    <style>
        * {
            font-family: 'The110';
        }

        @font-face {
            font-family: 'The110';
            src: url('/assets/font/The110.ttf');
            font-weight: normal;
            font-style: normal;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="preloader"></div>

    <!-- Main Header Nav -->
    <header class="header-nav menu_style_home_one style2 menu_boxshadow navbar-scrolltofixed stricky main-menu">
        <div class="container-fluid p0">
            <!-- Ace Responsive Menu -->
            <nav>
                <!-- Menu Toggle btn-->
                <div class="menu-toggle">

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
                                               placeholder="내 주변 공방 찾기" data-toggle="modal"
                                               data-target="#staticBackdrop">
                                        <button type="submit" class="btn"><span class="flaticon-loupe"></span></button>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <ul id="respMenu" class="ace-responsive-menu text-right" data-menu-style="horizontal">
                    <li>
                        <a href="#"><span class="title">커뮤니티</span></a>
                        <!-- Level Two-->
                        <ul>
                            <li><a href="index.html">가게 정보</a></li>
                            <li><a href="index2.html">가게 리뷰</a></li>
                            <li><a href="index3.html">가게 위치</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="title">환경트렌드</span></a>
                        <!-- Level Two-->
                    </li>
                    <li>
                        <a href="#"><span class="title">분리 배출 방법</span></a>

                    </li>
                    <li>
                        <a href="#"><span class="title">마이페이지</span></a>
                        <ul>
                            <li><a href="index.html">찜한 공방</a></li>
                            <li><a href="index.html">내 스크랩</a></li>
                            <li><a href="index.html">내 정보 수정</a></li>

                        </ul>
                    <li>
                        <a href="#"><span class="title">고객센터</span></a>
                        <ul>
                            <li><a href="index.html">자주 묻는 질문</a></li>
                            <li><a href="index.html">1:1 문의하기</a></li>
                            <li><a href="index.html">내가 쓴 글</a></li>

                        </ul>
                    </li>
                    <li class="list-inline-item list_s"><a href="#" class="btn flaticon-avatar" data-toggle="modal"
                                                           data-target=".bd-example-modal-lg"> <span class="dn-1200">Login/Sign Up</span></a>
                    </li>

                </ul>
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
                                            <input type="checkbox" class="custom-control-input" id="exampleCheck1">
                                            <label class="custom-control-label" for="exampleCheck1">Remember me</label>
                                            <a class="btn-fpswd float-right" href="#">Forgot password?</a>
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
                    <img class="nav_logo_img img-fluid mt15" src="images/header-logo2.svg" alt="header-logo2.svg">
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
                                        <div class="thumb"><img class="w100" src="images/property/pc18.jpg"
                                                                alt="pc18.jpg"></div>
                                        <div class="details">
                                            <h4>Miami</h4>
                                            <p>62 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="images/property/pc19.jpg"
                                                                alt="pc19.jpg"></div>
                                        <div class="details">
                                            <h4>Roma</h4>
                                            <p>92 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="images/property/pc20.jpg"
                                                                alt="pc20.jpg"></div>
                                        <div class="details">
                                            <h4>New Delhi</h4>
                                            <p>12 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="images/property/pc21.jpg"
                                                                alt="pc21.jpg"></div>
                                        <div class="details">
                                            <h4>London</h4>
                                            <p>74 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="images/property/pc22.jpg"
                                                                alt="pc22.jpg"></div>
                                        <div class="details">
                                            <h4>Amsterdam</h4>
                                            <p>62 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="images/property/pc23.jpg"
                                                                alt="pc23.jpg"></div>
                                        <div class="details">
                                            <h4>Berlin</h4>
                                            <p>92 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="images/property/pc24.jpg"
                                                                alt="pc24.jpg"></div>
                                        <div class="details">
                                            <h4>Paris</h4>
                                            <p>12 Listings</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                                    <div class="property_city_home6 tac-xsd">
                                        <div class="thumb"><img class="w100" src="images/property/pc25.jpg"
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

    <!-- Shop Single Content -->
    <section class="shop-single-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="breadcrumb_content style2">
                        <h2 class="breadcrumb_title">환경을 살리는 분리 배출 방법</h2>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-5">


                    <div class="single_product_grid"  style="width: 400px; height: 400px; padding-top: 0px;">
                        <div class="sps_content">

                            <button class="photo_btn" style="width: 400px; height: 400px">
                                <div class="thumb" id="uploadFile"style="width: 400px; height: 400px;">
                                    <img src="" alt="사진을 등록해주세요" style="width: 400px; height: 400px; object-fit: contain;"
                                         id="input-image">
                                </div>
                            </button>
                        </div>

                        <div>
                            <!--multiple : 다중파일 업로드할때 사용 -->
                            <input type="file" multiple="multiple" name="file" class="file_01" id="files"
                                   style="display: none;">
                        </div>
                    </div>


                </div>
                &nbsp &nbsp &nbsp &nbsp


                <div class="col-lg-6">
                    <div class="shop_single_product_details"><br>
                        <div id="label-container">
                            <h2 class="title" style="font-weight: bold">검사 방법 </h2><br><br>
                            1. 모델 시작하기 버튼을 먼저 눌러주세요(처음 한번만 눌러주시면 됩니다)
                            <br><br>
                            2. 검색할 사진을 업로드해주세요
                            <br><br>
                            3. 업로드 하기를 눌러주세요
                            <br><br>
                        </div>

                        <ul class="cart_btns ui_kit_button mb30">
                            <li class="list-inline-item">
                                <button type="button" onclick="init()" class="btn">모델 시작하기</button>
                            </li>
                            <li class="list-inline-item">
                                <button type="button" onclick="predict()" class="btn">업로드하기</button>
                            </li>
                        </ul>
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


                <div class="col-sm-7 col-md-6 col-lg-4 col-xl-4">
                    <div class="footer_social_widget">

                        <p class="text-white mb20"></p>
                        <form class="footer_mailchimp_form">
                            <div class="form-row align-items-center">
                                <div class="col-auto">

                                    <button type="submit" class="btn btn-primary">리뷰 등록하기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
                <div class="col-md-4 col-lg-4">
                    <div class="footer_social_widget text-right tac-smd mt10">
                        <ul class="mb0">
                            <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
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
<script src="/assets/js/isotop.js"></script>
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
<!-- Custom script for all pages -->
<script src="/assets/js/script.js"></script>
</body>
</html>