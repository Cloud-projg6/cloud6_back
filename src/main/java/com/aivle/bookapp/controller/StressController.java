package com.aivle.bookapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StressController {

    @GetMapping("/stress")
    public String cpuStressTest() {
        System.out.println("🔥 CPU 스트레스 테스트가 시작되었습니다! 약 60초간 CPU 사용량이 100%로 치솟습니다.");
        
        long startTime = System.currentTimeMillis();
        // 60초(60000ms) 동안 무한 루프를 돌며 CPU에 과부하를 줍니다.
        while (System.currentTimeMillis() - startTime < 60000) {
            // 수학 연산으로 CPU를 고문(?)합니다.
            Math.sqrt(Math.random() * Math.random());
        }
        
        return "✅ CPU 스트레스 테스트(60초)가 성공적으로 완료되었습니다! AWS CloudWatch에서 CPU 그래프를 확인해보세요.";
    }
}
