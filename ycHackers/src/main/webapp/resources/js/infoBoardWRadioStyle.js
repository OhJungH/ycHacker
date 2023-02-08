//게시판 분류 비동기 style
const infoType1=document.querySelector("#infoType1");
const infoType1Span=document.querySelector("#infoType1Span");
const infoType2=document.querySelector("#infoType2");
const infoType2Span=document.querySelector("#infoType2Span");
const infoType3=document.querySelector("#infoType3");
const infoType4Span=document.querySelector("#infoType3Span");
function infoTypeControl(){
    const hasChecked1=infoType1.checked;
    const hasChecked2=infoType2.checked;
    const hasChecked3=infoType3.checked;
    if(hasChecked1){
        console.log("infoType1: "+document.querySelector("input[id='infoType1']:checked").value);
        infoType1Span.classList.add("badge");
        infoType1Span.classList.add("badge-info");
    }
    else if(!hasChecked1){
        infoType1Span.classList.remove("badge");
        infoType1Span.classList.remove("badge-info");
    }
    if(hasChecked2){
        console.log("infoType2: "+document.querySelector("input[id='infoType2']:checked").value);
        infoType2Span.classList.add("badge");
        infoType2Span.classList.add("badge-danger");
    }
    else if(!hasChecked2){
        infoType2Span.classList.remove("badge");
        infoType2Span.classList.remove("badge-danger");
    }
    if(hasChecked3){
        console.log("infoType3: "+document.querySelector("input[id='infoType3']:checked").value);
        infoType3Span.classList.add("badge");
        infoType3Span.classList.add("badge-success");
    }
    else if(!hasChecked3){
        infoType3Span.classList.remove("badge");
        infoType3Span.classList.remove("badge-success");
    }
}
infoType1.addEventListener('change',infoTypeControl);
infoType2.addEventListener('change',infoTypeControl);
infoType3.addEventListener('change',infoTypeControl);

				//게시여부체크 비동기 style
				const infoCon1=document.querySelector("#infoCondition1");
				const infoCon1Box=document.querySelector("#infoCon1");
				const infoCon2=document.querySelector("#infoCondition2");
				const infoCon2Box=document.querySelector("#infoCon2");
				function infoConditionControl(){
					const hasChecked1=infoCon1.checked;
					const hasChecked2=infoCon2.checked;
					if(hasChecked1){
						console.log("inputCondition: "+document.querySelector("input[id='infoCondition1']:checked").value);
						infoCon1Box.classList.add("bg-info");
						infoCon1Box.classList.add("text-light");
						infoCon1Box.style.fontWeight=700;
						document.querySelector("#editBtn").innerHTML="게시하기";
					}
					else if(!hasChecked1){
						infoCon1Box.classList.remove("bg-info");
						infoCon1Box.classList.remove("text-light");
						infoCon1Box.style.fontWeight="normal";
					}
					if(hasChecked2){
						console.log("inputConditon: "+document.querySelector("input[id='infoCondition2']:checked").value);
						infoCon2Box.classList.add("bg-danger");
						infoCon2Box.classList.add("text-light");
						infoCon2Box.style.fontWeight=700;
						document.querySelector("#editBtn").innerHTML="저장하기";
					}
					else if(!hasChecked2){
						infoCon2Box.classList.remove("bg-danger");
						infoCon2Box.classList.remove("text-light");
						infoCon2Box.style.fontWeight="normal";
					}
				}
				infoCon1.addEventListener('change',infoConditionControl);
				infoCon2.addEventListener('change',infoConditionControl);