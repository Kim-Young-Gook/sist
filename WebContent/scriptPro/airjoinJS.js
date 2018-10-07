/**
 * 
 */

function idCheckFrm(){
   var obj = document.join;
   //alert(obj.id.value);
   if(!obj.id.value){
	   alert('id를 입력해주세요.');
   }else{
	 //document.location.href="idcheck.jsp?id="+obj.id.value;
	     // window.open('idcheck.jsp','id','left=300,top=250,width=400,height=400');
    var url = "idcheck.jsp?id="+obj.id.value;
	//   document.location.href="idcheck.jsp?id="+obj.id.value;
  window.open(url,obj.id.value,'left=300,top=200,width=400,height=350');
   }
}
function passCheck(){
//
     var obj = document.join;
      if(!(obj.pass1.value && obj.pass1.value==obj.pass2.value)){
         alert("passCheck");
         obj.pass1.value='';
         obj.pass2.value='';
         obj.pass1.focus();
      }else{
         obj.pass.value=obj.pass2.value;
      }
}
function birthCheck(){
    var obj = document.join;
      //isNaN 숫자 판별 isnotnumber
      if(isNaN(obj.year.value) || isNaN(obj.month.value) || isNaN(obj.day.value)){
         alert('숫자만 가능합니다.');
         obj.year.value='';
         obj.month.value='';
         obj.day.value='';
         obj.year.focus();
         return false;
      }else{
         //eval 문자를숫자로 수식변환
         if(!(eval(obj.year.value)>=1970 && eval(obj.year.value)<=1999)){
            alert('1970~1999년도 만 가입 가능');
            obj.year.value='';
            obj.year.focus();
            return false;
         }
         else if(!(eval(obj.month.value)>=1 && eval(obj.month.value)<=12)){
            alert('Month 1~12');
            obj.month.value='';
            obj.month.focus();
            return false;
         }
         else if(!(eval(obj.day.value)>=1 && eval(obj.day.value)<=31)){
            alert('day 1~31');
            obj.day.value='';
            return false;
            }
         else{
            obj.birthday.value = obj.year.value+'-'+obj.month.value+'-'+obj.day.value;
         }
      }
}

function postCheck(){
	   window.open('address.jsp','','left=400,top=100,width=300,height=280');
	}

function emailCheck(){
	   var obj = document.join;
	   if(obj.email3.value!='empty' && obj.email3.value=='direct'){
	      obj.email2.value='';
	      obj.email2.disabled=false;
	   
	   }else if(obj.email3.value!='empty' && obj.email3.value!='direct'){
	      obj.email2.value=obj.email3.value;
	      obj.email2.disabled=true;

	   }
	}

function SendJoin(){
	   var obj = document.join;
	   obj.admin.value='일반회원';
	   if(!(obj.year.value)||!(obj.month.value)||!(obj.day.value)){
		  obj.year.value='';
         obj.month.value='';
         obj.day.value='';
         obj.year.focus();
	   }else{
		   obj.birth.value=obj.year.value+obj.month.value+obj.day.value;
	   }
	   if(!(obj.post1.value)||!(obj.post2.value)||!(obj.post3.value)||!(obj.post4.value)){
	      alert('addressCheck');
	      obj.post1.value='';
	      obj.post2.value='';
	      obj.post3.value='';
	      obj.post4.value='';
	      return false;
	   }else{
		   obj.naddress.value=obj.post1.value+'-'+obj.post2.value;
		   obj.textaddress.value=obj.post3.value+' '+obj.post4.value;
	   }
	   if(!(obj.email1.value) || !(obj.email2.value)){
	      alert('emailCheck!');
	      obj.email1.value='';
	      obj.email2.value='';
	      obj.email3.selectedIndex=0;
	      return false;
	   }else{
	      alert(obj.email.value);
	      obj.email.value=obj.email1.value+'@'+obj.email2.value;
	      //alert(obj.email.value);
	   }
	   if(!(obj.tel1.value) || !(obj.tel2.value) || !(obj.tel3.value)){
	      alert('전화번호 Check!');
	      obj.tel1.value='';
	      obj.tel2.value='';
	      obj.tel3.value='';
	      return false;
	   }else{//다 들어온 경우
	      obj.tel.value=obj.tel1.value+"-"+obj.tel2.value+"-"+obj.tel3.value;
	   }
	   if(!(obj.cp1.value) || !(obj.cp2.value) || !(obj.cp3.value)){
	      alert('휴대폰번호 Check!');
	      obj.cp1.value='';
	      obj.cp2.value='';
	      obj.cp3.value='';
	      return false;
	   }else{//다 들어온 경우
	      obj.cp.value=obj.cp1.value+"-"+obj.cp2.value+"-"+obj.cp3.value;
	   }
	   alert("가입 성공!")
	   obj.submit();

	}