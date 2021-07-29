package com.cos.how_about;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Test1 {

    // 상세보기 페이지
    @GetMapping("/detail")
    public String test() {
        return "detail";
    }

    // 후기 페이지
    @GetMapping("/afterlist")
    public String test2() {
        return "afterlist";
    }

    // 메인 페이지
    @GetMapping("/index")
    public String test3() {
        return "index";
    }

    // 이너 페이지
    @GetMapping("/inner-Page")
    public String test4() {
        return "inner-Page";
    }

    // 모텔 리스트 페이지
    @GetMapping("/motelList")
    public String test5() {
        return "motelList";
    }

    // 일단 남겨놓은 페이지
    @GetMapping("/portfolio-details")
    public String test6() {
        return "portfolio-details";
    }

    // 후기 작성 페이지
    @GetMapping("/saveForm")
    public String test7() {
        return "saveForm";
    }

    // 내정보 수정 페이지
    @GetMapping("/userUpdate")
    public String test8() {
        return "userUpdate";
    }

    @GetMapping("/login")
    public String test9() {
        return "login/login";
    }

    @GetMapping("/join")
    public String test10() {
        return "/join/join";
    }

    @GetMapping("/test11")
    public String test11() {
        return "layout/header";
    }

    @GetMapping("/test12")
    public String test12() {
        return "userUpdate";
    }

}
