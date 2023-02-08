//유효성검사
const vMessageLine=document.querySelector("#validateM");
function validateData(){
    let validateMessage="";
    const infoTitleInput=document.querySelector("#infoTitle");
    if(infoTitleInput===""||infoTitleInput===null){
        validateMessage+="공지 글의 제목을 입력해주세요. <br/>";
        return false;	
    }else if(infoTitleInput.value.length<5){
        validateMessage+="제목의 길이는 5글자 이상이어야 합니다. <br/>";
        vMessageLine.innerHTML=validateMessage;
        return false;	
    }
    const infoContentInput=document.getElementById("infoContent");
    if(infoContentInput===""||infoContentInput===null){
        validateMessage+="공지 내용을 적지 않았습니다. <br/>";
        vMessageLine.innerHTML=validateMessage;
        return false;
    } else if(infoContentInput.value.length<10){
        const conf=confirm("글의 길이가 10글자 미만입니다. 입력하시겠습니까?");
        if(!conf){
            return conf;
        }
    }
    const infoConRadio=document.querySelector("input[name='infoCondition']:checked");
    if(infoConRadio===""||infoConRadio===null){
        validateMessage+="공지 글의 저장방식을 선택해주세요. <br/>";
        vMessageLine.innerHTML=validateMessage;
        return false;
    }
    return true;
}