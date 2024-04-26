package com.camp.going.util;

import com.camp.going.dto.response.LoginUserResponseDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.util.WebUtils;

@Slf4j
// 회원 인증, 인가와 관련된 상수와 메서드를 가진 객체
public class LoginUtils {

    // 로그인 세션 키
    public static final String LOGIN_KEY = "login";

    // 자동 로그인 쿠키 이름
    public static final String AUTO_LOGIN_COOKIE = "auto";

    // 로그인 여부 확인
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_KEY) != null;
    }


    // 로그인 중인 사용자의 id(int) 뽑기
    public static long getCurrentLoginMemberId(HttpSession session) {

        LoginUserResponseDTO loginUser = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        return loginUser.getId();
    }

    // 로그인 한 사람의 계정명을 반환해 주는 메서드
    public static String getCurrentLoginMemberAccount(HttpSession session) {
        // session.getAttribute의 리턴타입은 Object이기 때문에
        // 자식의 고유 기능과 속성을 사용하기 위해 자식 타입으로 형 변환.



        LoginUserResponseDTO loginUser = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        return loginUser.getEmail();
    }

    // 내가 쓴 게시물인지 확인해 주는 메서드
   public static boolean isMine(HttpSession session, String targetAccount) {
        return targetAccount.equals(getCurrentLoginMemberAccount(session));
    }

    // 관리자인지 확인해주는 메서드
    public static boolean isAdmin(HttpSession session) {
        LoginUserResponseDTO loginUser = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        return loginUser.getAuth().equals("ADMIN");
    }

    // 자동 로그인 여부 확인
    public static boolean isAutoLogin(HttpServletRequest request) {
        // auto 라는 이름의 쿠키가 존재한다면 true, 없다면 false
        return WebUtils.getCookie(request, AUTO_LOGIN_COOKIE) != null;
    }

}
