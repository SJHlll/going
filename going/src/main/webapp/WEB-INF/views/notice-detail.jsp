<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>notice-detail</title>


    <!-- <link rel="stylesheet" href="/assets/css/main.css"> -->
    <!-- <link rel="stylesheet" href="/assets/css/in-notice2.css"> -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/89a0fea006.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>

<body>

    <!-- header -------------------------------- -->
    <%@ include file="include/header.jsp" %>

    <!-- notice-detail ---------------------------------->
    <section>

        <div class="title">
            <h1>NOTICE / <span>공지사항</span></h1>
        </div>

        <div id="wrap" class="form-container">
            <p>${n.noticeNo}번 공지사항 <span style="font-size: 0.7em;">${n.noticeDate}</span></p>

            <div id="title">${n.noticeTitle}</div>


            <div id="content">${n.noticeContent}</div>


            <div class="buttons">
                <button class="list-btn" type="button" onclick="location.href='/main/notice'">
                    목록
                </button>
                <button class="modify-btn" type="button" onclick="location.href='/main/notice-modify/${n.noticeNo}'">
                    수정
                </button>
                <form id="deleteForm" action="/main/notice-delete" method="get">
                    <input type="hidden" name="nno" value="${n.noticeNo}">
                    <button type="button" onclick="confirmDelete()">삭제</button>
                </form>
            </div>

<<<<<<< HEAD
=======
                        <button class="list-btn" type="button" onclick="location.href='/main/notice'">목록</button>
                        <button type="submit" class="submit-button">수정</button>
                    </div>
>>>>>>> jhjhjh3

        </div>



        <div class="notice-list">
            <div class="notice-box">
                <!-- 페이지 사이즈 체크 -->
                <div class="page-size-background">
                    <span class="page-size">8개씩</span>
                    <input type="checkbox" class="page-size-click-button" onclick="handlePageSizeClick(this)">
                </div>
                <table border="1">
                    <thead>
                        <tr class="column">
                            <th class="noticeCategory">공지등급</th>
                            <th class="NoticeNo">글번호</th>
                            <th class="NoticeTitle">제목</th>
                            <th class="NoticeDate">작성일</th>
                            <th class="NoticeCount">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="b" items="${nList}">
                            <tr class="notice-click">
                                <td class="noticeCategory">
                                    <c:set var="categoryName" value="" />
                                    <c:choose>
                                        <c:when test="${b.noticeCategory == 'ESSENTIAL'}">
                                            <c:set var="categoryName" value="필독" />
                                        </c:when>
                                        <c:when test="${b.noticeCategory == 'NOTICE'}">
                                            <c:set var="categoryName" value="공지" />
                                        </c:when>
                                        <c:when test="${b.noticeCategory == 'COMMON'}">
                                            <c:set var="categoryName" value="기본" />
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${b.noticeNo == currentNoticeNo}">
                                            <strong style="color: #FF0000;">${categoryName}</strong>
                                        </c:when>
                                        <c:otherwise>${categoryName}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="NoticeNo">
                                    <c:choose>
                                        <c:when test="${b.noticeNo == currentNoticeNo}">
                                            <strong style="color: #FF0000;">${b.noticeNo}</strong>
                                        </c:when>
                                        <c:otherwise>${b.noticeNo}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="NoticeTitle">
                                    <c:choose>
                                        <c:when test="${b.noticeNo == currentNoticeNo}">
                                            <strong style="color: #FF0000;">${b.noticeTitle}</strong>
                                        </c:when>
                                        <c:otherwise>${b.noticeTitle}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="NoticeDate">
                                    <c:choose>
                                        <c:when test="${b.noticeNo == currentNoticeNo}">
                                            <strong style="color: #FF0000;">${b.noticeDate}</strong>
                                        </c:when>
                                        <c:otherwise>${b.noticeDate}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="NoticeCount">
                                    <c:choose>
                                        <c:when test="${b.noticeNo == currentNoticeNo}">
                                            <strong style="color: #FF0000;">${b.noticeCount}</strong>
                                        </c:when>
                                        <c:otherwise>${b.noticeCount}</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

                <!-- 게시글 목록 하단 영역 -->
                <div class="bottom-section">

                    <!-- 페이지 버튼 영역 -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-lg pagination-custom">
                            <!-- 이전 페이지 버튼 -->
                            <c:if test="${maker.page.pageNo != 1}">
                                <li class="page-item"><a class="page-link"
                                        href="/main/notice-detail/${n.noticeNo}?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                                </li>
                            </c:if>

                            <!-- 이전 그룹 페이지 버튼 -->
                            <c:if test="${maker.prev}">
                                <li class="page-item"><a class="page-link"
                                        href="/main/notice-detail/${n.noticeNo}?pageNo=${maker.begin-1}&type=${s.type}&keyword=${s.keyword}">prev</a>
                                </li>
                            </c:if>

                            <!-- 페이지 번호 버튼들 -->
                            <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                                <li data-page-num="${i}" class="page-item">
                                    <a class="page-link"
                                        href="/main/notice-detail/${n.noticeNo}?pageNo=${i}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                                </li>
                            </c:forEach>

                            <!-- 다음 그룹 페이지 버튼 -->
                            <c:if test="${maker.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/main/notice-detail/${n.noticeNo}?pageNo=${maker.end+1}&type=${s.type}&keyword=${s.keyword}">next</a>
                                </li>
                            </c:if>

                            <!-- 다음 페이지 버튼 -->
                            <c:if test="${maker.page.pageNo != maker.finalPage}">
                                <li class="page-item"><a class="page-link"
                                        href="/main/notice-detail/${n.noticeNo}?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>


                </div>

                <!-- 전체기간 조회 -->

                <div class="total-date-background">
                    <input type="checkbox" class="total-date-click-button" onclick="handleTotalDateClick(this)">
                    <span class="total-date">전체기간</span>
                </div>

                <!-- 제목 조회 -->

                <div class="only-title-background">
                    <input type="checkbox" class="only-title-click-button" onclick="handleOnlyTitleClick(this)">
                    <span class="only-title">제목만</span>
                </div>



                <!-- 검색어 조회 -->

                <div class="search-content-background">
                    <input type="text" class="search-content" placeholder="검색어를 입력해 주세요">
                    <button class="search-click-button" onclick="handleSearchClick()">검색</button>
                </div>




    </section>


    <!-- footer --------------------->
    <%@ include file="include/footer.jsp" %>


    <script>
        // 모든 tr 요소를 선택합니다.
        const rows = document.querySelectorAll('tr.notice-click');

        // 각각의 tr 요소에 대해 반복합니다.
        rows.forEach(row => {
            // 클릭 이벤트를 추가합니다.
            row.addEventListener('click', function () {
                // 클릭된 tr 요소에 대한 처리를 여기에 추가합니다.
                const noticeNoElement = row.querySelector('.NoticeNo');
                if (noticeNoElement) {
                    const noticeNo = noticeNoElement.innerText;
                    const pageNo = '${maker.page.pageNo}';
                    const type = '${s.type}';
                    const keyword = '${s.keyword}';
                    const detailUrl = '/main/notice-detail/' + noticeNo + '?pageNo=' + pageNo +
                        '&type=' + type + '&keyword=' + keyword;

                    // detailUrl이 정의되었는지 확인 후 이동합니다.
                    if (detailUrl) {
                        window.location.href = detailUrl;
                    } else {
                        console.error('Detail URL이 정의되지 않았습니다.');
                    }
                } else {
                    console.error('NoticeNo X');
                }
                // alert('클릭 이벤트 발생: ' + row.innerText); // 예시로 경고창을 띄웁니다.
            });
        });

        function confirmDelete() {
            if (confirm("정말로 삭제하시겠습니까?")) {
                document.getElementById("deleteForm").submit();
                alert("삭제가 완료되었습니다.");
            }
        }


        // 사용자가 현재 머물고 있는 페이지 버튼에 active 스타일 부여
        function appendPageActive() {

            // 현재 서버에서 넘겨준 페이지 번호
            const currPage = '${maker.page.pageNo}';

            // li 태그들을 전부 확인해서
            // 현재 페이지 번호와 일치하는 li를 찾은 후 active 클래스 이름 붙이기
            const $ul = document.querySelector('.pagination');
            const $liList = [...$ul.children];

            $liList.forEach($li => {
                if (currPage === $li.dataset.pageNum) {
                    $li.classList.add('active');
                }
            });
        }

        // 검색조건 셀렉트박스 옵션타입 고정하기
        function fixSearchOption() {
            const $select = document.getElementById('search-type');
            // 셀렉트 박스 내에 있는 option 태그들 전부 가져오기
            const $options = [...$select.children];

            $options.forEach($opt => {
                if ($opt.value === '${s.type}') {
                    // option 태그에 selected를 주면 그 option이 고정됨.
                    $opt.setAttribute('selected', 'selected');
                }
            });

        }

        appendPageActive();
        fixSearchOption();
    </script>


</body>

</html>



