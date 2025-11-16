package com.mygame.board; // (예시 패키지 경로)

import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

// 이 클래스는 Tomcat이 실행되는 동안 메모리에 데이터를 유지합니다.
public class PostDAO {
    // static 키워드를 사용하여 모든 JSP 요청이 이 posts 리스트를 공유합니다.
    private static List<Post> posts = new ArrayList<>();
    private static int nextId = 1;
    private static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // 서버 시작 시 초기 데이터를 추가합니다.
    static {
        savePost("🎮 톰캣 환경 설정 질문합니다.");
        savePost("RPG 게임 밸런스에 대한 의견 공유해요!");
        savePost("⭐ 신규 게임 'DAVETHE DIVER' 후기");
    }

    // 새 게시글을 저장합니다.
    public static void savePost(String title) {
        String date = LocalDate.now().format(DATE_FORMAT);
        Post newPost = new Post(nextId++, title, date);
        // 최신 글이 위에 오도록 리스트의 맨 앞에 추가합니다.
        posts.add(0, newPost); 
    }

    // 전체 게시글 목록을 가져옵니다.
    public static List<Post> getAllPosts() {
        return posts;
    }
}