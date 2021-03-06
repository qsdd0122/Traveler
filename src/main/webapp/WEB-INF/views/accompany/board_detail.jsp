<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/accompany/css/chat.css" rel="stylesheet">
<%@ include file="../includes/sidebar_setting.jsp"%>
<script src="/resources/accompany/js/board.js"></script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.24.0/firebase-app.js"></script>

<!-- include firebase database -->
<script
   src="https://www.gstatic.com/firebasejs/7.24.0/firebase-database.js"></script>


<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script
   src="https://www.gstatic.com/firebasejs/7.24.0/firebase-analytics.js"></script>
<style>
/* Base Styles */
body {
   margin: 0;
   padding: 0;
   font-size: 16px;
   line-height: 1.4em;
   color: #222;
   background-color: rgba(247, 247, 247, 0.8);
}

img {
   max-width: 100%;
   height: auto;
   border-radius: 3px;
}

a {
   text-decoration: none;
   color: inherit;
}

/* Grid */
.section {
   clear: both;
   padding: 0;
   margin: 0;
}

.col {
   display: block;
   float: left;
   margin: 1% 0 1% 1.6%;
}

.col:first-child {
   margin-left: 0;
}

.span_3_of_3 {
   width: 100%;
}

.span_2_of_3 {
   width: 66.1%;
}

.span_1_of_3 {
   width: 32.2%;
}

/* Header & Navigation */
header {
   max-width: 100%;
   background: #222; /*FallBack*/
   background: rgba(0, 0, 0, .6);
   padding: 20px;
}

.logo {
   text-align: center;
   color: #fff;
   font-size: 3em;
   font-weight: 400;
   font-family: 'Poiret One', cursive;
}

/* Blog Posts */
.container {
   max-width: 1020px;
   margin: 0 auto;
   padding: 20px;
}

.blog-post {
   background: #fff;
   margin: 0 auto 2em auto;
   padding: 35px 30px;
   box-shadow: 5px 5px 15px -1px rgba(0, 0, 0, 0.3);
}

.side-post {
   background: #fff;
   margin: 0 auto 1.5em auto;
   width: 21.3em;
   padding: 20px;
}
.side-post.chat {
   height : 600px;
}
.blog-content {
   font-size: 1em;
   border-left: 5px solid #8EE5EE;
   padding-left: 15px;
   width: 550px;
   overflow: hidden;
   word-wrap: break-word;
   margin-top: 5px;
   margin-bottom: 20px;
}

.side-content {
   font-size: .9em;
   margin-top: 8px;
   margin-bottom: 0;
}

.blog-title {
   font-size: 1.8em;
   margin-top: 5px;
   margin-bottom: 5px;
}

.date {
   font-size: 1em;
   font-weight: 400;
   color: #9C9C9C;
   margin-bottom: 10px;
   text-decoration: underline;
   text-decoration-color: currentColor;
}

.post-link {
   color: #009ACD;
   font-style: italic;
   transition: all 0.4s;
}

.post-link:hover {
   color: #005c7b;
   text-decoration: underline;
   text-decoration-color: currentColor;
   cursor: pointer;
}

/* Button */
.button {
   display: block;
   padding: 15px 20px;
   margin-top: .8em;
   background: #009ACD;
   text-align: center;
   color: #fff;
   font-size: 1.4em;
   border-radius: 3px;
   transition: all .4s ease-in;
}

.button:hover {
   background: #005c7b;
}

.btnmenu {
   background: #FFFFFF;
   border: 0;
   outline: 0;
   margin: -50px 0px -20px;
}

#main_img {
   margin-right: 10px;
   margin-bottom: 20px;
}

.blog-post textarea {
   border: 0;
   outline: 0;
   padding: 1em; @ include border-radius(8px);
   display: block;
   width: 100%;
   margin-top: 1em;
   font-family: 'Merriweather', sans-serif; @ include box-shadow(0 1px 1px
   rgba(black, 0.1));
   resize: none;
   &:
   focus
   {
   @include
   box-shadow(0
   0px
   2px
   rgba($red,
   1)!important);
}
</style>
</head>
<script>
$(document).ready(function() {

    $("#btnlist").click(function() {
       location.href = "/accompany/index";
    });

    $("#sendbtn").click(function() {
       var id = $('#leader').html();
       sendpop(id);
    });

 });

 var flag = true;

 function btnclick() {

    if (flag) {
       console.log("???????????????");
       $('.blog-post textarea').css("display", "block");
       flag = false;
    } else {
       console.log("???????????????");
       checkapply('${userInfo.userId}');
       $('.blog-post textarea').css("display", "none");
       flag = true;
    }
 }
 //???????????????
 function sendpop(rcver) {
    var url = "/mypage/popup_send?rcver=" + rcver;
    var name = "popup";
    window.open(url, name, "width=500, height=500, resizable=yes");
 }
 function checkapply(sender) {
    $.ajax({
       url : "/mypage/message/cntapply",
       type : "post",
       dataType : "text",
       data : {
          "sender_rcv" : sender,
          "bno_rcv" : $('#planno').html()
       },
       success : function(data) {
          if (data == "")
             apply(sender);
          else
             alert(data);
       },
       error : function(error) {
          alert("error.");
       }
    });
 }
 //????????????
 function apply(sender) {
    if (sender == $('#leader').html()) {
       alert("????????? ????????????.");
    } else {
       if ($('#cur').html() >= $('#limit').html()) {
          alert("?????? ????????? ???????????????.");
       } else {
          $.ajax({
             url : "/mypage/message/send",
             type : "post",
             dataType : "text",
             data : {
                "sender_rcv" : sender,
                "targetId_rcv" : $('#leader').html(),
                "mcontent_rcv" : '<' + $('#title').val()
                      + '> ??????&#10;&#10;'
                      + $('.blog-post textarea').val(),
                "bno_rcv" : $('#planno').html()+","+$('#contentId').html(),
                "sender_send" : sender,
                "targetId_send" : $('#leader').html(),
                "mcontent_send" : '<' + $('#title').val()
                      + '> ??????&#10;&#10;'
                      + $('.blog-post textarea').val(),
                "bno_send" : $('#planno').html()+","+$('#contentId').html(),
                "userId" : $('#leader').html()
             },
             success : function(data) {
                if (data == "right")
                   alert("??????????????????");
                else
                   alert(data);
             },
             error : function(error) {
                alert("error.");
             }
          });
       }
    }
 }

 //??? ??????
 function deleteacc() {
    $.ajax({
       url : "/accompany/delete",
       type : "post",
       dataType : "json",
       data : {
          "planNo" : '${planNo}',
          "title" : '${title}'
       },
       success : function(data) {
          alert("??????????????????.");
          location.href = "/accompany/index";
       },
       error : function(error) {
          alert("error.");
       }
    });
 }

//?????? ??????
 function deleteguest() {
    $.ajax({
          url : "/accompany/guest/delete",
          type : "post",
           dataType : "json",
           data : {
              "planNo" : '${planNo}',
              "title" : '${title}',
              "guestId" : '${userInfo.userId}'
           },
           success : function(data) {
              alert("??????????????????.");
              location.reload();
           },
           error : function(error) {
              alert("error.");
           }
       });
 }
</script>
<body>
   <%@include file="../includes/sidebar.jsp"%>
   <main>
      <header>
         <h1 class="logo">${acc.boardTitle }??????</h1>
      </header>

      <div class="container">
         <div class="section">
            <div class="col span_2_of_3" style="width: 66.1%;">
               <div class="blog-post">

                  <c:forEach items="${userplan}" var="list" varStatus="status">
                     <c:if test="${list.title eq title }">
                        <div style="float: left; width: 65%;">
                           <h1 class="blog-title">${list.title }</h1>
                           <h2 class="date">?????? ?????? : ${list.startDate } ~
                              ${list.endDate }</h2>
                           <div class="blog-content">${host.descript }</div>
                        </div>
                        <div style="float: left; width: 35%;">
                           <img src="${list.img_src}" alt="img" width="250" height="150"
                              id="main_img">
                        </div>
                        <div style="clear: both;">
                           <c:choose>
                          <c:when test="${isguest eq 'y' }"><a href="#" class="button" id="btnapply" onclick="deleteguest();">?????? ????????????</a> </c:when>
                       <c:when test="${userInfo.userId ne acc.hostId }"><a href="#" class="button" id="btnapply" onclick="btnclick();">?????? ????????????</a> </c:when>
                       </c:choose>
                           <textarea placeholder="?????? ????????? ?????? ?????? ????????? ?????? ????????????." tabindex="3"
                              id="applycontent" style="display: none;"></textarea>
                           <input type="hidden" id="title" value="${list.title }" />
                        </div>
                     </c:if>
                  </c:forEach>

               </div>
               <div class="blog-post" style="height: 400px;">

                  <h5>?????? ??????, ?????? ?????????</h5>
                  <br />
                  <div style="overflow: auto; height: 250px;">

                     <div>
                        <c:forEach items="${userplan}" var="list" varStatus="status">
                           <c:if test="${list.title ne title }">
                              <div class="blog-content">
                                 <img src="${list.img_src}" alt="img" width="100" height="50"
                                    style="float: left; margin-right: 5px;">
                                 <div style="float: left;">
                                    <p style="margin-top: 5px;">${list.title }</p>
                                    <h2 class="date">?????? ?????? : ${list.startDate } ~
                                       ${list.endDate }</h2>
                                 </div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>

                  </div>
               </div>
            </div>

            <aside class="col span_1_of_3" style="width: 32.2%;">
               <div class="side-post">
                  <p class="side-content">
                     <c:if test="${userInfo.userId eq acc.hostId }">
                        <button onclick="deleteacc();" class="btnmenu">
                           <i class="fas fa-trash"></i>
                           <p>??????</p>
                        </button>
                        <button id="btnmodify" class="btnmenu" data-toggle="modal"
                           data-target="#myModal">
                           <i class="fas fa-pencil-alt"></i>
                           <p>??????</p>
                        </button>
                     </c:if>
                     <button id="btnlist" class="btnmenu">
                        <i class="fas fa-list"></i>
                        <p>??????</p>
                     </button>
                     
                     <!-- if sessionid ???  guest??? ????????? ?????? ?????? ???????????? C?????? if??? ??????  ????????????????????? --> 
                     <c:if test="${isguest eq 'y' || userInfo.userId eq host.hostId}">
                     <button id="btnChat" class="btnmenu" value="${acc.accBno }">
                     <i class="fas fa-comments"></i>
                        <p>?????? ??????</p>
                     </button>
                     </c:if>
                     
                     <button id="btnChat-out" class="btnmenu" value="${acc.accBno}" style="display:none;">
                           <i class="fas fa-sign-out-alt"></i>
                        <p>?????? ?????????</p>
                     </button>
                  </p>
               </div>
               <div class="side-post chat" style="display:none">
                  <div class="chatter">
                     <div class="chatter_post_signup">
                        <div class="chatter_convo">
               
                        </div>
                        <form id="chat-form">
                           <textarea name="chatter_message"
                              placeholder="Type your message here..."
                              class="chatter_field chatter_message" id="ta-message"></textarea>
                        </form>
                     </div>

                  </div>

               </div>

               <%-- <img src="http://placehold.it/800x400&text=img" alt="img">
                  <p class="side-content">????????? ????????? ??????????????????.</p>
                  
                  <a href="#" class="post-link" id="sendbtn">?????? ?????????</a> --%>
         </aside>
         </div>

         <%-- <div class="side-post">
                  <p>?????? ???????????? (${host.curPerson} / ${host.limitPerson})</p>
                  <hr />
                  <div style="overflow: auto; height: 100px;">
                     <c:forEach items="${guestid }" var="id" varStatus="status">
                        <a href="#" onclick="sendpop('${id}')">${id }</a>
                     </c:forEach>
                  </div>
               </div> --%>
      </div>
      </div>

      <!-- acc ?????? ?????? -->
      <div class="modal fade" tabindex="-1" role="dialog"
         aria-labelledby="mySmallModalLabel" id="myModal" aria-hidden="true">
         <div class="modal-dialog"
            style="max-width: 100%; width: auto; display: table;">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">??? ??????</h4>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">??</span>
                  </button>
               </div>
               <form id="updateacc" method="post" action="/accompany/update">
                  <div class="modal-body">
                     <fieldset>
                        <input placeholder="?????? ????????? ???????????????" type="text" tabindex="1"
                           name="boardTitle" required>
                     </fieldset>
                     <br />
                     <fieldset>
                        <select id="limitPerson" name="limitPerson" tabindex="2"
                           required autofocus>
                           <option value="" disabled selected>?????? ?????? ????????? ??????????????????.</option>
                                 <c:forEach  var="i" begin="${host.curPerson }" end="10">
                                    <c:if test="${i ne 0 }">
                                    <option value="${i }">${i}</option>
                                    </c:if>
                                 </c:forEach>
                        </select>
                     </fieldset>
                     <br />

                     <fieldset>
                        <textarea placeholder="?????? ????????? ???????????????." tabindex="3"
                           name="descript" required></textarea>
                     </fieldset>
                     <fieldset>
                        <button name="submit" type="submit" id="contact-submit"
                           data-submit="...Sending">Submit</button>
                     </fieldset>
                     <input type="hidden" name="planNo" value="${planNo }"> <input
                        type="hidden" name="title" value="${title }"> <input
                        type="hidden" name="hostId" value="${host.hostId }">
                        <input type="hidden" name="accBno" value="${acc.accBno }"/>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <p id="contentId" style="display:    none;">${acc.accBno }</p>
      <p id="planno" style="display: none;">${acc.planNo }</p>
      <p id="cur" style="display: none;">${host.curPerson }</p>
      <p id="limit" style="display: none;">${host.limitPerson}</p>
      <p id="leader" style="display:none;">${host.hostId }</p>
   </main>
</body>
</html>