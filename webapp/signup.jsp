<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>MoaMoa</title>
    <link rel="stylesheet" href="/CMoaMoa/css/signup-login.css">
</head>
<body>
   <jsp:include page="/navibar.jsp"></jsp:include>
   
   <div class="body-box">
      <div class="signup-logo-box">
         <img onclick="location.href='/CMoaMoa/main.jsp'" src="/CMoaMoa/image/logo.png"/>
      </div>
      
      <form id="signup-form" name="Signup_Form" method="POST" action="signupPro.jsp" onsubmit="return check(this);">
         
            <div>
            <input type="text" name="id" placeholder="학번을 입력해 주세요.">
         </div>
         <div>
               <input type="text" name="nickname" placeholder="Nickname">
            <input id='confirm_id_btn' type="button" value="중복확인" name="confirm_id" onclick="confirmID(this.form)"/>
            </div>
         <div>
            <input type="password" name="passwd" placeholder="Password">
         </div>
         <div>
            <input type="text" name="name" placeholder="Name">
         </div> 
         <div>
            <input type="email" name="email" placeholder="Email">
         </div>
         <div class="class_radio_box">
            <input type="radio" name="year" value="1" required>1학년&nbsp;
            <input type="radio" name="year" value="2" required>2학년&nbsp;
            <input type="radio" name="year" value="3" required>3학년&nbsp;
            <input type="radio" name="year" value="4" required>4학년
         </div>
         <div>
            <select id="selectbox" name="major">
               <option value="1">경영학부</option>
               <option value="2">글로벌경제통상학부</option>
               <option value="3">관광호텔경영학부</option>
               <option value="4">미디어콘텐츠학부</option>
               <option value="5">사회과학부</option>
               <option value="6">인문학부</option>
               <option value="7">에너지광기술융합학부</option>
               <option value="8">BT융합학부</option>
               <option value="9">소프트웨어융합학부</option>
               <option value="10">휴먼환경디자인학부</option>
               <option value="11">융합전자공학부</option>
               <option value="12">국어교육과</option>
               <option value="13">수학교육과</option>
               <option value="14">교직과</option>
               <option value="15">디자인조형학부</option>
               <option value="16">연극영화학부</option>
               <option value="17">간호학과</option>
               <option value="18">치위생학과</option>
               <option value="19">방사선학과</option>
               <option value="20">물리치료학과</option>
               <option value="21">작업치료학과</option>
               <option value="22">임상병리학과</option>
               <option value="23">보건행정헬스케어학부</option>
               <option value="24">교양학부</option>
               <option value="25">의사소통교육부</option>
               <option value="26">기초교육클리닉부</option>
               <option value="27">항공학부</option>
               <option value="28">군사학과</option>
            </select>
         </div>
         <div>
            <button id='submit-btn' type="submit">회원가입</button>
         </div>
      </form>
   </div>
<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

<!-- 유효성체크 : 데이터 빈공백체크(id와 성별) -->
<script language="JavaScript">
function check(obj){ 
   //아이디가 입력이 안되어있을 경우 아이디입력하라는 메세지 출력

   if(!obj.id.value){ 
      alert("아이디를 입력해주세요");
      obj.id.value="";      
      obj.id.focus();
      return false;
   }
   if(!obj.passwd.value){
      alert("비밀번호를 입력해주세요");
      obj.passwd.value="";      
      obj.passwd.focus();
      return false;
   }

   if(!obj.nickname.value){
      alert("닉네임을 입력해주세요");
      obj.nickname.value="";      
      obj.nickname.focus();
      return false;
   }
   if(!obj.name.value){
      alert("이름을 입력해주세요");
      obj.name.value="";      
      obj.name.focus();
      return false;
   }
   if(!obj.email.value){
      alert("이메일을 입력해주세요");
      obj.email.value="";      
      obj.email.focus();
      return false;
   }
   return true;
}
function confirmID(){
   if(document.Signup_Form.id.value==""){
      alter("ID를 입력하세요");
      return;
   }
   
   url = "signup_nickname.jsp?nickname="+document.Signup_Form.nickname.value;
   open(url, "confirm", 
         "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizeable=no, width=300, height=200");
}
</script>
   
      
   
   <jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>