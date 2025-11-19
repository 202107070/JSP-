package com.mygame.board;

public class Post {
    private int id;
    private String title;
    private String date;

    // 생성자
    public Post(int id, String title, String date) {
        this.id = id;
        this.title = title;
        this.date = date;
    }

    // Getter 메서드
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getDate() { return date; }
    // Setter는 필요 없음
}