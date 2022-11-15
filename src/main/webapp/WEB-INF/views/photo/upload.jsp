<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-10-26
  Time: 오후 6:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 업로드</title>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <!--import 처럼 별도의 스크립트 파일을 가져올 시 함수 호출 가능 -->
    <script src="/js/tensorflow.js"></script>
    <link rel="stylesheet" href="/assets/css/boardWrite.css">

    <script type="text/javascript">


    window.onload = function () {
    $(function () {

        //img-btn클릭시 input file 클릭
        $(document).on("click", ".photo_btn", function photo_event(e) {
            e.preventDefault();
            $('#file').click();
        });

        // 파일 객체에 변화가 일어났을때 발생하는 이벤트
        document.getElementById('file').addEventListener('change', readURL, true);

        function readURL(e) {
            let files = document.getElementById("file").files[0];
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
</head>

<body>

<h1>파일 업로드 </h1>

    <label>파일:</label>

    <div class="photo_001" style="width: 300px; height: 300px;">

        <button class="photo_btn">
            <div class="photo_002" id="uploadFile">
                <img src="" style="width: 100%; height: 100%; object-fit: cover;"
                     id="input-image">
            </div>
        </button>


    </div>

    <div>
        <!--multiple : 다중파일 업로드할때 사용 -->
        <input type="file" multiple="multiple" name="file" class="file_01" id="file"
               style="display: none;">
    </div>

    <br><br>
    <button type="button" onclick="init()"> 모델 시작하기 </button> <!--업로드하기-->
    <input type="button" onclick="predict()" value="upload">
</body>
<script>

</script>
</html>
