/**
 * 
 */
function searchDong(){
   var obj = document.searchFrm;
   if(!obj.dong.value){
      alert("동을 입력하세요");
      obj.dong.focus();
      return false;
   }else{
     // alert(obj.dong.value);
      obj.submit();
   }
}


function SendAddPost(zipcode,addr){
	  // alert(zipcode.split("-")[0]);
	 //  var obj = document.join;
	  opener.join.post1.value=zipcode.split("-")[0];
	  opener.join.post2.value=zipcode.split("-")[1];
	  opener.join.post3.value=addr;
	  self.close();
}