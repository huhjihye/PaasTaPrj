<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 화면</title>
    <link rel="stylesheet" href="/css/table.css"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        //TODO 회원가입 유효성 체크하기
        function doRegMarketCheck(f) {

            if (f.marketId.value === "") {
                alert("아이디를 입력하세요.");
                f.marketId.focus();
                return false;
            }

            if (f.marketName.value === "") {
                alert("이름을 입력하세요.");
                f.marketName.focus();
                return false;
            }

            if (f.password.value === "") {
                alert("비밀번를 입력하세요.");
                f.password.focus();
                return false;
            }

            if (f.password.value !== f.password2.value){
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                f.password.focus();
                return false;
            }

            if (f.CRNum.value === "") {
                alert("사업자등록번호를 입력하세요.");
                f.crnum.focus();
                return false
            }



            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                f.email.focus();
                return false;
            }

            if (f.addr1.value === "") {
                alert("주소를 입력하세요.");
                f.addr1.focus();
                return false;
            }

            if (f.addr2.value === "") {
                alert("상세주소를 입력하세요.");
                f.addr2.focus();
                return false;
            }
        }

        /*랜덤핀 전역 변수 설정*/
        let randomPin = "0";

        function doSendmail() {
            $.ajax({
                url: "/user_sendmail",
                type: "post",
                data: $("#email"),
                /*dataType이란 내가 반환받을 데이터의 형태를 명시해주는 것*/
                dataType: 'json',
                success(pMap) {
                    let data = pMap["res"];
                    randomPin = pMap["randomPin"];
                    if (data == 1) {
                        $("#sendmail_result").text("메일발송이 완료되었습니다.");
                    } else {
                        $("#sendmail_result").text("이메일을 다시 입력해주세요");

                    }
                }
            });
        }

        /*인증번호 실시간 확인*/
        $(document).ready(function () {
            $("#auth_email").on("change keyup paste", function () {
                console.log("인증번호 실시간 확인 코드 시작");
                if (randomPin === $("#auth_email").val()) { // //인증 키 값을 비교를 위해 텍스트인 풋과 벨류를 비교
                    $("#auth_res").text("인증번호가 일치 합니다");
                    $("#auth_res").css('color', 'blue');
                    $("#btn_reg").attr("type", "submit");
                } else {
                    $("#auth_res").text("인증번호를 다시 확인해 주세요");
                    $("#auth_res").css('color', 'red');
                    $("#btn_reg").attr("type", "button"); //attr. 해당 태그 속성을 바꿔줌
                }
            });
        });

        function kakaoPost(f) {
            new daum.Postcode({
                oncomplete: function (data) {

                    // Kakao에서 제공하는 data는 JSON구조로 주소 조회 결과값을 전달함
                    // 주요 결과값
                    // 주소 : data.address
                    // 우편번호 : data.zonecode
                    let address = data.address; // 주소
                    let zonecode = data.zonecode; // 우편번호
                    f.addr1.value = "(" + zonecode + ")" + address
                }
            }).open();
        }



    </script>


</head>
<body>
<h2>사업자 회원가입</h2>
<hr/>
<br/>
<form name="f" method="post" action="c" onsubmit="return doRegMarketCheck(this);">

    <div class="divTable minimalistBlack">
        <div class="divTableBody">

            <div class="divTableRow">
                <div class="divTableCell">* 아이디
                </div>
                <div class="divTableCell">
                    <input type="text" name="marketId" style="width:95%"/>
                </div>
            </div>

            <div class="divTableRow">
                <div class="divTableCell">* 이메일
                </div>
                <div class="divTableCell">
                    <input type="email" name="email" style="width:95%"/>
                </div>
            </div>

            <div class="divTableRow">
                <div class="divTableCell">* 비밀번호
                </div>
                <div class="divTableCell">
                    <input type="password" name="password" style="width:95%"/>
                </div>
            </div>

            <div class="divTableRow">
                <div class="divTableCell">* 비밀번호 확인
                </div>
                <div class="divTableCell">
                    <input type="password" name="password2" style="width:95%"/>
                </div>
            </div>

            <div class="divTableRow">
                <div class="divTableCell">* 이름
                </div>
                <div class="divTableCell">
                    <input type="text" name="marketName" style="width:95%"/>
                </div>
            </div>

            <div class="divTableRow">
                <div class="divTableCell">* 주소
                </div>
                <div class="divTableCell">
                    <input type="text" name="addr1" readonly style="width:85%"/>
                    <input type="button" value="우편번호" onclick="kakaoPost(this.form)"/>
                </div>
            </div>

            <div class="divTableRow">
                <div class="divTableCell">* 상세 주소
                </div>
                <div class="divTableCell">
                    <input type="text" name="addr2" style="width:95%"/>
                </div>
            </div>
        </div>
    </div>
    <div><input type="submit" value="회원가입"/></div>
</form>
</body>
</html>