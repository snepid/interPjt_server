<%--
  Class Name : EgovIncHeader.jsp
  Description : 화면상단 Header(include)
  Modification Information

       수정일              수정자         수정내용
    ----------  --------  ---------------------------
    2011.08.31  JJY       경량환경 버전 생성
    2021.08.12  신용호          신규 디자인 적용

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

<script type="text/javaScript" language="javascript">

function fn_egov_modal_create(){
	
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/EgovPageLink.do'/>?" + "link=main/sample_menu/Intro" +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1200,
        height: 940
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

</script>

<!-- Header -->
<div class="header">
    <div class="inner">
        <div class="left_col">
            <h1 class="logo"><a href="<c:url value='/'/>cmm/main/mainPage.do"><img src="<c:url value='/images/logo.png'/>" alt="표준프레임워크 포털 eGovFrame 샘플 포털"></a></h1>
            <a class="go" href="#LINK" onclick="fn_egov_modal_create(); return false;"><img src="<c:url value='/images/ico_question.png'/>" alt="메뉴구성 설명"></a>
        </div>

        <!-- 전체검색 -->
        <!-- <div id="TopSearch" class="total_search">
            <div class="search_box">
                <form method="post" action="#LINK" name="TopSearchForm" id="TopSearchForm">
                    <fieldset>
                        <legend>전체검색</legend>
                        <input type="text" name="search" id="search" placeholder="검색어를 입력하세요.">
                        <button type="submit">검색</button>
                    </fieldset>
                </form>
            </div>
            <ul class="list">
                <li><a href="#">표준프레임워크</a></li>
                <li><a href="#"><strong>경량환경</strong></a></li>
                <li><a href="#">내부업무</a></li>
                <li><a href="#">모바일</a></li>
            </ul>
        </div> -->
        <!--// 전체검색 -->
<%
    LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
    if(loginVO == null){
%>
		<c:set var="loginName" value=""/>
<% }else{ %>
		<c:set var="loginName" value="<%= loginVO.getName()%>"/>
	    <div class="top_menu">
            <span class="t"><span onclick="alert('개인정보 확인 등의 링크 제공'); return false;" style="cursor: pointer;">${loginName}님</span>, 로그인하셨습니다.</span>
            <!-- <span class="d">2021-06-30 12:45</span> -->
            <!-- 현재시각 jsp -->
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
			<jsp:useBean id="currTime" class="java.util.Date" />
			<fmt:formatDate value="${currTime}" pattern="yyyy-MM-dd HH:mm" />
        </div>
<% } %>



        <!-- gnb -->
		<div class="gnb">
			<ul>
		    	<c:forEach var="result" items="${list_headmenu}" varStatus="status">
		    	<li><a href="#LINK" onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')" class='<c:if test="${result.menuOrdr >= 6}">manager</c:if>'><c:out value="${result.menuNm}"/></a></li>
		        </c:forEach>
		    </ul>
		</div>
        <!-- gnb -->

        <!-- util menu -->
        <div class="util_menu">
            <ul>
				<c:if test="${loginName == ''}">
                <!-- case: 로그아웃했을경우 -->
	                <li><a href="<c:url value='/'/>uat/uia/egovLoginUsr.do" class="login" title="로그인">로그인</a></li>
				</c:if>
				<c:if test="${loginName != ''}">
                <!-- case: 로그인했을경우 -->
	                <li><a href="<c:url value='/'/>uat/uia/actionLogout.do" class="logout" title="로그아웃">로그아웃</a></li>
	                <li><a href="" class="mail" title="메일">메일<span>3</span>건</a></li>
	                <li><a href="" class="allmenu" title="전체메뉴">전체메뉴</a></li>
				</c:if>
            </ul>
        </div>
        
        <!-- all menu 210912 add -->
            <div class="all_menu">
                <div class="inner">
                    <div>
                        <h2>기준정보</h2>
                        <ul>
                            <li><a href="/EgovPageLink.do?link=main/sample_menu/EgovAboutSite">공통코드관리</a></li>
                            <li><a href="/EgovPageLink.do?link=main/sample_menu/EgovHistory">사용자관리</a></li>
                            <li><a href="/EgovPageLink.do?link=main/sample_menu/EgovOrganization">소요시간관리</a></li>
                            <li><a href="/EgovPageLink.do?link=main/sample_menu/EgovLocation">찾아오시는 길</a></li>
                        </ul>
                    </div>

                    <div>
                        <h2>접수관리</h2>
                        <ul>
                            <li><a href="/EgovPageLink.do?link=main/sample_menu/EgovServiceManage">일일접수관리</a></li>
                            <li><a href="/EgovPageLink.do?link=main/sample_menu/EgovServiceResult">접수/등록조회</a></li>
                        </ul>
                    </div>

                    <div>
                        <h2>키오스크</h2>
                        <ul>
                            <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA">일반접수관리</a></li>
                            <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB">보증접수관리</a></li>
                        </ul>
                    </div>

                    <div>
                        <h2>현장관리</h2>
                        <ul>
                            <li><a href="/uss/olh/faq/FaqListInqire.do">접수List조회</a></li>
                            <li><a href="/uss/olh//uss/olh/qna/QnaListInqire.do">접수작업분배</a></li>
                            <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000001">작업장별처리내역</a></li>
                        </ul>
                    </div>
                    <div>
                        <h2>고객관리</h2>
                        <ul>
                            <li><a href="/uss/olh/faq/FaqListInqire.do">고객정보관리</a></li>
                            <li><a href="/uss/olh/qna/QnaListInqire.do">차량정보관리</a></li>
                            <li><a href="/uss/olp/qnn/EgovQustnrRespondInfoManageList.do">차량수리이력조회</a></li>
                        </ul>
                    </div> 
                    <div>
                        <h2>모니터링</h2>
                        <ul>
                            <li><a href="/uss/olh/faq/FaqListInqire.do">현장접수모니터링</a></li>
                            <li><a href="/uss/olh/qna/QnaListInqire.do">고객대기실모니터링</a></li>
                            <!-- <li><a href="/uss/olp/qnn/EgovQustnrRespondInfoManageList.do">설문조사</a></li> -->
                        </ul>
                    </div>
                    <div class="admin">
                        <h2>포털서비스관리</h2>
                        <h3>설문관리</h3>
                        <ul>
                            <li><a href="/uss/olp/qmc/EgovQustnrManageList.do">설문지</a></li>
                            <li><a href="/uss/olp/qtm/EgovQustnrTmplatManageList.do">설문템플릿</a></li>
                            <li><a href="/uss/olp/qqm/EgovQustnrQestnManageList.do">설문문항</a></li>
                            <li><a href="/uss/olp/qim/EgovQustnrItemManageList.do">설문항목</a></li>
                            <li><a href="/uss/olp/qrm/EgovQustnrRespondManageList.do">설문응답결과</a></li>
                        </ul>
                        
                        <h3>서비스관리</h3>
                        <ul>
                            <li><a href="/uss/olh/faq/admin/FaqListInqire.do">FAQ관리</a></li>
                            <li><a href="/uss/olh/qna/admin/QnaListInqire.do">QnA관리</a></li>
                            <li><a href="/uss/olh/qnm/QnaAnswerListInqire.do">QnA답변관리</a></li>
<!--                             <li><a href="/cop/com/selectTemplateInfs.do">게시판템플릿관리</a></li> -->
                            <li><a href="/cop/bbs/SelectBBSMasterInfs.do">게시판생성관리</a></li>
                            <li><a href="/cop/com/selectBBSUseInfs.do">게시판사용관리</a></li>
                            <li><a href="/cop/bbs/admin/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA">공지사항관리</a></li>
                            <li><a href="/cop/bbs/admin/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB">자유게시판관리</a></li>
                            <li><a href="/uss/ion/bnr/selectBannerList.do">배너관리</a></li>
                        </ul>
                    </div>

                    <div class="admin">
                        <h2>포털시스템관리</h2>
                        <h3>사용자관리</h3>
                        <ul>
                            <li><a href="/uss/umt/mber/EgovMberManage.do">회원관리</a></li>
                            <li><a href="/uss/sam/stp/StplatListInqire.do">이용약관관리</a></li>
                            <li><a href="/uss/sam/ipm/listIndvdlInfoPolicy.do">개인정보보호관리</a></li>
                        </ul>

                        <h3>사용자권한관리</h3>
                        <ul>
                            <li><a href="/sec/ram/EgovAuthorList.do">권한관리</a></li>
                            <li><a href="/sec/gmt/EgovGroupList.do">사용자그룹관리</a></li>
                            <li><a href="/sec/rgm/EgovAuthorGroupListView.do">사용자별권한관리</a></li>
                            <li><a href="/sec/rmt/EgovRoleList.do">롤관리</a></li>
                        </ul>
                    </div>
                </div>

            </div>
            <!--// all menu -->
        
        <!--// util menu -->
    </div>
</div>
<!--// Header -->

<!-- topmenu start -->
<script type="text/javascript">
<!--
    function getLastLink(menuNo){
        var tNode = new Array;
        for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
            tNode[i] = document.menuListForm.tmp_menuNm[i].value;
            var nValue = tNode[i].split("|");
            //선택된 메뉴(menuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
            if (nValue[1]==menuNo) {
                if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
                    //링크정보가 있으면 링크정보를 리턴한다.
                    return nValue[5];
                }else{
                    //링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
                    return getLastLink(nValue[0]);
                }
            }
        }
    }
    function goMenuPage(menuNo){
        document.getElementById("menuNo").value=menuNo;
        //document.getElementById("link").value=getLastLink(menuNo);
        document.menuListForm.action = "<c:url value='/'/>"+getLastLink(menuNo).substring(1);
        document.menuListForm.submit();
    }
  //-->
</script>

<form name="menuListForm" action ="" method="post">
    <input type="hidden" id="menuNo" name="menuNo" value="<%=session.getAttribute("menuNo")%>" />
    <input type="hidden" id="link" name="link" value="" />
    <div style="width:0px; height:0px;">
    <c:forEach var="result" items="${list_menulist}" varStatus="status" >
        <input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${result.chkURL}|" />
    </c:forEach>
    </div>
</form>
