package com.mygame.board; // 반드시 프로젝트의 패키지 경로와 일치해야 합니다.

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
    private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyy.MM.dd HH:mm");
    
    private int id;
    private String content;
    private String author; // 댓글 작성자 (여기서는 임시로 "익명 사용자")
    private String publishedAt;

    // 생성자
    public Comment(int id, String content, String author) {
        this.id = id;
        this.content = content;
        this.author = author;
        this.publishedAt = SDF.format(new Date());
    }

    // Getter 메서드
    public int getId() { return id; }
    public String getContent() { return content; }
    public String getAuthor() { return author; }
    public String getPublishedAt() { return publishedAt; }
}