package controllers.member;

import controllers.Controller;
import controllers.URLRouter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberURLRouter implements URLRouter {
    private Controller controller;

    @Override
    public void route(HttpServletRequest request, HttpServletResponse response, String location) {
        String mode = getMode(request.getRequestURI(), "member");

        if (mode == null || mode.isBlank()) {
            return;
        }

        String method = request.getMethod().toUpperCase(); //  요청 메서드

        if (mode.equals("join")) { // 회원가입
            controller = new JoinController();
        } else if (mode.equals("find_id")) { // 아이디 찾기
            controller = new LoginController();
        } else if (mode.equals("find_now")) { // 비밀번호 찾기
            controller = new InfoController();
        }

        if (controller != null) {
            if (method.equals("POST")) {
                controller.post(request, response);
            } else {
                controller.get(request, response);
            }
        }
    }

}
