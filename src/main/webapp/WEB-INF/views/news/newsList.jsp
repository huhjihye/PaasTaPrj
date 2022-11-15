<%@ page import="kopo.poly.dto.NlpDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.dto.NewsDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<NlpDTO> nlpDTOList = (List<NlpDTO>) request.getAttribute("nlpDTOList");%>
<% List<NewsDTO> newsDTOList =(List<NewsDTO>) request.getAttribute("newsDTOList");%>
<% List<NewsDTO> enewsDTOList =(List<NewsDTO>) request.getAttribute("enewsDTOList");%>


<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="airbnb, booking, city guide, directory, events, hotel booking, listings, marketing, places, restaurant, restaurant">
    <meta name="description" content="Guido - Directory & Listing HTML Template">
    <meta name="CreativeLayers" content="ATFN">
    <!--jqcloud-->
    <link rel="stylesheet" type="text/css" href="/assets/jqcloud/jqcloud.css"/>
    <script src="/assets/js/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="/assets/jqcloud/jqcloud.js"></script>
    <script type="text/javascript">

    let words = [
    <% for(int i =0; i<30; i++){%>
    {text: '<%=nlpDTOList.get(i).getWord()%>', weight:<%=30 - i%>},
    <%}%>

    ];

    console.log(words);

    $(function () {
    $("#go").jQCloud(words);
    });

    </script>

    <!-- css file -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <!-- Responsive stylesheet -->
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <!-- Title -->
    <title>환경 트렌드</title>
    <!-- Favicon -->
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" type="image/x-icon" />
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body{
            font-family: 'The110';
        }


        @font-face {
            font-family: 'The110';
            src: url('/assets/font/The110.ttf');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'The120';
            src: url('/assets/font/The120.ttf');
            font-weight: normal;
            font-style: normal;
        }

        .h1{
            color: #125d2e;
        }

        .table {

            display: table;

        }



        .title {

            display: table-caption;

            text-align: center;

            font-weight: bold;

            font-size: larger;

        }



        .heading {

            display: table-row;

            font-weight: bold;

            text-align: center;

        }



        .row {

            display: table-row;

        }



        .cell {

            display: table-cell;

            border: solid;

            border-width: thin;

            padding-left: 5px;

            padding-right: 5px;

            padding: 10px;
        }


    </style>
</head>
<body>


<!-- Our Error Page -->
<section class="our-invoice bgc-f4 pb200">
    <div class="container">
        <div class="row mb50">
            <h1 style="font-size: 60px; color:#fff; padding-left: 35%; padding-top: 3%">환경 트렌드</h1>
            <div class="col-lg-12">
                <div class="invoice_down_print float-right">

                </div>
            </div>
        </div>
        <div class="row mt20">
            <div class="col-lg-12">
                <div class="invoice_table">
                    <div class="row mb25">

                        <h2 style="color: #125d2e; font-weight: bold"> 실시간 트렌드 </h2>
                            <div id="go" style="width: 800px; height: 400px;"></div>

                    </div>
                    <br><br>

                    <div class="row mt50" style="">
                        <div class="col-lg-12">
                            <div class="table-responsive invoice_table_list">
                                <table class="table">
                                    <thead class="thead-light">



                                    <div class="heading" style="background-color: #e9ebed">

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid1=102&sid2=252');">

                                            <p>네이버 환경뉴스</p>

                                        </div>

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('https://www.me.go.kr/home/web/board/list.do?menuId=286&boardMasterId=1&boardCategoryId=39');">

                                            <p>환경부 보도</p>

                                        </div>

                                    </div>




                                    <div class="heading">

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=newsDTOList.get(0).getUrl()%>');">

                                            <p>
                                                <%=newsDTOList.get(0).getTitle()
                                                %>
                                            </p>

                                        </div>

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=enewsDTOList.get(0).getUrl()%>');">

                                            <p><%=enewsDTOList.get(0).getTitle()
                                            %></p>

                                        </div>

                                    </div>

                                    <div class="heading">

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=newsDTOList.get(1).getUrl()%>');">

                                            <p>
                                                <%=newsDTOList.get(1).getTitle()
                                                %>
                                            </p>

                                        </div>

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=enewsDTOList.get(1).getUrl()%>');">

                                            <p><%=enewsDTOList.get(1).getTitle()
                                            %></p>

                                        </div>

                                    </div>

                                    <div class="heading">

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=newsDTOList.get(2).getUrl()%>');">

                                            <p>
                                                <%=newsDTOList.get(2).getTitle()
                                                %>
                                            </p>

                                        </div>

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=enewsDTOList.get(2).getUrl()%>');">

                                            <p><%=enewsDTOList.get(2).getTitle()
                                            %></p>

                                        </div>

                                    </div>
                                    <div class="heading">

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=newsDTOList.get(3).getUrl()%>');">

                                            <p>
                                                <%=newsDTOList.get(3).getTitle()
                                                %>
                                            </p>

                                        </div>

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=enewsDTOList.get(3).getUrl()%>');">

                                            <p><%=enewsDTOList.get(3).getTitle()
                                            %></p>

                                        </div>

                                    </div>

                                    <div class="heading">

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=newsDTOList.get(4).getUrl()%>');">

                                            <p>
                                                <%=newsDTOList.get(4).getTitle()
                                                %>
                                            </p>

                                        </div>

                                        <div class="cell" style="cursor: pointer;" onclick="window.open('<%=enewsDTOList.get(4).getUrl()%>');">

                                            <p><%=enewsDTOList.get(4).getTitle()
                                            %></p>

                                        </div>


                                    </div>



                                    <br>

                                    <div class="invoice_footer bgc-thm">

                                        <div class="invoice_footer_content">
                                            <ul>
                                                <li class="list-inline-item"><a href="https://www.me.go.kr/home/web/board/list.do?menuId=286&boardMasterId=1&boardCategoryId=39" target="_blank">환경부 보도 바로가기</a></li>
                                                <li class="list-inline-item"><a href="/views/index">aga</a></li>
                                                <li class="list-inline-item"><a href="https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid1=102&sid2=252" target="_blank">네이버 환경뉴스 바로가기</a></li>
                                            </ul>
                                        </div>
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