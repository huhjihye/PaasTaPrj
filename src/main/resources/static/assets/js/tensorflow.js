const URL = "https://teachablemachine.withgoogle.com/models/nvXPJOfT7/";

let model, webcam, labelContainer, maxPredictions;

// Load the image model and setup the webcam
async function init() { //init으로 모델을 실행
    const modelURL = URL + "model.json";
    const metadataURL = URL + "metadata.json";



    // load the model and metadata
    // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
    // or files from your local hard drive
    // Note: the pose library adds "tmImage" object to your window (window.tmImage)
    model = await tmImage.load(modelURL, metadataURL);  //모델이 저장된 파일을 가져와서 load하고 model에 저장해줌
    maxPredictions = model.getTotalClasses();
    labelContainer = document.getElementById("label-container");
}

//지정된 정보에 대해 찾을 때 그 설명에 대해 찾을 수 있도록 나오게 하기
// run the webcam image through the image model
async function predict() {
    let image = document.getElementById("input-image") //id를 통해서 이미지를 가져오기
    console.log("들어온 파일은" + image)
    const prediction = await model.predict(image, false); //예측하기 위한 이미지를 넣음 두번째 인자는 flipped로 뒤집혔는지 안뒤집혔는지 확인

    if (prediction[0].className == "플라스틱" && prediction[0].probability.toFixed(2) == 1.00) {
        console.log("플라스틱!")
        swal.fire({
            icon: "info",
            title: "플라스틱입니다.",
            text: "플라스틱에 대한 분리배출 정보를 받아보세요.",
            // closeOnClickOutside: false,
            confirmButton: true,
            confirmButtonColor: '#3085d6', //confirm 버튼 색깔 지정
            confirmButtonText: '확인'
        })
        labelContainer.innerHTML = "<h1 class='title' style='font-weight: bold'> 플라스틱 용기류 </h1><br><br>" +
            "                            <h3>* PVC, PE, PP, PS, PSP, PET</h3>" +
            "                            <br><br>" +
            "                            1. 내용물을 비우로 물로 헹구는 등 이물질을 제거하여 배출합니다." +
            "                            <br><br>" +
            "                            2. 부착상표, 부속품 등 본체와 다른 재질은 제거한 후 배출합니다." +
            "                            <br><br><br>" +
            "                            <strong>해당품목 :</strong> 음료 용기, 세정 용기 등 " +
            "                            <br><br>"+
            "                            <strong>비해당품목 :</strong> 플라스틱 이외의 재질이 부착된 완구,문구류,옷걸이 등 "+
            "                            <br><br><br>" +
            "                            <img src='/assets/images/background/recycle.png'>        "

        ;





    } else if (prediction[1].className == "유리" && prediction[1].probability.toFixed(2) == 1.00) {
        swal.fire({
            icon: "info",
            title: "유리입니다.",
            text: "유리에 대한 분리배출 정보를 받아보세요.",
            // closeOnClickOutside: false,
            confirmButton: true,
            confirmButtonColor: '#3085d6', //confirm 버튼 색깔 지정
            confirmButtonText: '확인'
        })
        labelContainer.innerHTML = "<h1 class='title' style='font-weight: bold'> 유리병 </h1><br><br>" +
            "                            <h3>* 음료수병, 기타병류</h3>" +
            "                            <br><br>" +
            "                            1. 담배꽁초 등 이물질을 넣지 않고 배출합니다." +
            "                            <br><br>" +
            "                            2. 접착제로 부착되지 아니하여 상표제거가 가능한 경우 상표를 제거한 후 배출합니다. " +
            "                            <br><br>" +
            "                            3. 소주, 맥주 등 빈용기 보증금 대상 유리병은 소매점 등에 반납합니다. " +
            "                            <br><br><br>" +
            "                            <strong>해당품목 :</strong>  음료수병, 와인병, 양주병, 드링크병 등 " +
            "                            <br><br>"+
            "                            <strong>비해당품목 :</strong>깨진 유리제품은 신문지 등에 싸서 종량제봉투로 배출합니다.<br><br>" +
            "                                              코팅 및 다양한 색상이 들어간 유리제품,조명기구용 유리류, 도자기류 등 "+
            "                            <br><br><br>" +
            "                            <img src='/assets/images/background/recycle3.png'>        "

        ;

    } else if (prediction[2].className == "캔" && prediction[2].probability.toFixed(2) == 1.00) {
        swal.fire({
            icon: "info",
            title: "캔입니다.",
            text: "캔에 대한 분리배출 정보를 받아보세요.",
            // closeOnClickOutside: false,
            confirmButton: true,
            confirmButtonColor: '#3085d6', //confirm 버튼 색깔 지정
            confirmButtonText: '확인'
        })
        labelContainer.innerHTML = "<h1 class='title' style='font-weight: bold'> 금속캔 및 고철류 </h1><br><br>" +
            "                            <h3>* 음료, 주류캔, 식료품캔</h3>" +
            "                            <br><br>" +
            "                            1. 내용물을 비우고 물로 헹구는 등 이물질을 제거하여 배출합니다." +
            "                            <br><br>" +
            "                            2. 담배꽁초 등 이물질을 넣지 않고 배출합니다. " +
            "                            <br><br>" +
            "                            3. 플라스틱 뚜껑 등 금속캔과 다른 재질은 제거한 후 배출합니다. " +
            "                            <br><br><br>" +
            "                            <strong>해당품목 :</strong>  음료수캔, 맥주캔, 통조림캔 등" +
            "                            <br><br>"+
            "                            <strong>비해당품목 :</strong>알루미늄 호일 등 (종량제봉투에 담아 배출합니다)" +
            "                            <br><br><br>" +
            "                            <h3>*기타캔류(부탄가스, 살충제 용기 등)</h3>" +
            "                            <br><br>" +
            "                            1. 내용물을 제거한 후 배출" +
            "                            <br><br>" +
            "                            2. 가스 용기는 가급적 통풍이 잘되는 장소에서 송곳을 이용해 구멍을 내어 내용물을 제거한 후 배출 " +
            "                            <br><br><br>" +
            "                            <strong>해당품목 :</strong>  부탄가스 용기, 살충제 용기, 스프레이 용기 등" +
            "                            <br><br>"+
            "                            <strong>비해당품목 :</strong>내용물이 남아있는 캔류는 특수규격마대에 담아 배출"+
            "                            <br><br><br>" +
            "                            <h3>* 고철(공기구, 철사, 못 등), 비철금속(알루미늄, 스텐류 등) </h3>" +
            "                            <br><br>" +
            "                            1. 이물질이 섞이지 않도록 한 후 봉투에 넣거나 끈으로 묶어서 배출합니다."+
            "                            <br><br><br><br><br>"

        ;




    } else if (prediction[3].className == "종이" && prediction[3].probability.toFixed(2) == 1.00) {
        swal.fire({
            icon: "info",
            title: "종이류입니다.",
            text: "종이에 대한 분리배출 정보를 받아보세요.",
            // closeOnClickOutside: false,
            confirmButton: true,
            confirmButtonColor: '#3085d6', //confirm 버튼 색깔 지정
            confirmButtonText: '확인'
        })
        labelContainer.innerHTML = "<h1 class='title' style='font-weight: bold'> 종이류 </h1><br><br>" +
            "                            <h3 style='font-weight: bolder' >* 신문지</h3>" +
            "                            <br><br>" +
            "                            1. 물기에 젖지 않도록 하고 반듯하게 펴서 차곡차곡 쌓은 후 묶어서 배출합니다." +
            "                            <br><br>" +
            "                            2. 비닐 코팅된 광고지, 비닐류, 기타 오물이 섞이지 않도록 주의해야 합니다.  " +
            "                            <br><br><br>" +
            "                            <h3 style='font-weight: bolder'>* 책자, 노트 등 </h3>" +
            "                            <br><br>" +
            "                            1. 비닐 코팅된 표지, 공책의 스프링 등은 제거 후 배출합니다." +
            "                            <br><br><br>" +
            "                            <h3 style='font-weight: bolder'>* 종이컵</h3>" +
            "                            <br><br>" +
            "                            1. 내용물을 비우고 물로 헹군 후 포개어 봉투에 넣거나 한데 묶어서 배출합니다." +
            "                            <br><br>"+
            "                            2. 소량이거나 오염된 경우 일반쓰레기로 배출합니다.  " +
            "                            <br><br><br>" +
            "                            <h3 style='font-weight: bolder'>* 상자류(골판지 상자 등) </h3>   "+
            "                            <br><br>"+
            "                            1. 테이프, 운송장 스티커 등 종이류와 다른 재질을 제거해주세요. 접어서 배출해주세요  "+
            "                            <br><br><br>" +
            "                            <img src='/assets/images/background/recycle4.png'>        "
        ;
    } else if (prediction[4].className == "비닐" && prediction[4].probability.toFixed(2) == 1.00) {
        swal.fire({
            icon: "info",
            title: "비닐입니다.",
            text: "비닐에 대한 분리배출 정보를 받으시려면 확인을 눌러주세요.",
            // closeOnClickOutside: false,
            confirmButton: true,
            confirmButtonColor: '#3085d6', //confirm 버튼 색깔 지정
            confirmButtonText: '확인'
        })
        labelContainer.innerHTML = "<h1 class='title' style='font-weight: bold'> 유리병 </h1><br><br>" +
            "                            <h3 style='font-weight: bolder'>* 비닐 포장재, 1회용 비닐봉투</h3>" +
            "                            <br><br>" +
            "                            1. 내용물을 비우고 물로 헹구는 등 이물질을 제거하여 배출합니다." +
            "                            <br><br>" +
            "                            2. 흩날리지 않도록 봉투에 담아 배출합니다. " +
            "                            <br><br><br>" +
            "                            <strong>해당품목 :</strong> 1회용 봉투 등 각종 비닐류 " +
            "                            <br><br>"+
            "                            <strong>비해당품목 :</strong>깨끗하게 이물질 제거가 되지 않은 랩필름, 식탁보, 고무장갑,<br><br>" +
            "                                              장판, 돗자리, 섬유류 등(천막,현수막,의류,침구류 등)  "+
            "                            <br><br><br>" +
            "                            <img src='/assets/images/background/recycle5.png'>        "
        ;
    } else{
        labelContainer.innerHTML="사진을 다시 업로드 해주세요 ";
    }


}


document.write("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
document.write("<script src=\"/assets/js/jquery-3.6.0.min.js\"></script>");
document.write("<script src=\"/assets/js/sweetalert2.all.min.js\"></script>");