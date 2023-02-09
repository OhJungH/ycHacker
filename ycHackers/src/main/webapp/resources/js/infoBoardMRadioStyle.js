//게시여부체크 비동기 style
var infoCon1=document.querySelector("#infoCondition1");
var infoCon1Box=document.querySelector("#infoCon1");
var infoCon2=document.querySelector("#infoCondition2");
var infoCon2Box=document.querySelector("#infoCon2");
var infoTempInput=document.querySelector("#infoTempCondition");
function infoConditionControl(){
	let hasChecked1=infoCon1.checked;
	let hasChecked2=infoCon2.checked;
	if(hasChecked1){
		console.log("inputCondition: "+document.querySelector("input[id='infoCondition1']:checked").value);
		infoCon1Box.classList.add("bg-info");
		infoCon1Box.classList.add("text-light");
		infoCon1Box.style.fontWeight=700;
		document.querySelector("#editBtn").innerHTML="게시하기";
		infoTempInput.value="display";
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
		infoTempInput.value="display-none";
	}
	else if(!hasChecked2){
		infoCon2Box.classList.remove("bg-danger");
		infoCon2Box.classList.remove("text-light");
		infoCon2Box.style.fontWeight="normal";
	}
}
infoCon1.addEventListener('change',infoConditionControl);
infoCon2.addEventListener('change',infoConditionControl);