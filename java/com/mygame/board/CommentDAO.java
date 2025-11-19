package com.mygame.board; 

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 이 클래스는 서버가 실행되는 동안 메모리에 댓글을 유지합니다.
public class CommentDAO {
    // Map<게시글ID, List<댓글객체>> 형태로 저장하여 댓글을 게시글별로 분리합니다.
    private static Map<String, List<Comment>> commentsMap = new HashMap<>();
    private static int nextId = 100;

    // 서버 시작 시 초기 데이터를 추가합니다.
    static {
        // web1.jsp (스타듀밸리 기사) 초기 댓글
        saveComment("web1", "정말 재밌는 게임이에요!", "익명1");
        saveComment("web1", "농사게임 중 최고 👍", "익명2");
        
        // web2.jsp (할로우 나이트 기사) 초기 댓글
        saveComment("web2", "게임이 많이 어렵네요;;", "익명A");
        saveComment("web2", "다크소울 2인칭 느낌 👍", "익명B");
    }

    // 새 댓글을 저장합니다. (게시글 ID를 함께 받습니다.)
    public static void saveComment(String articleId, String content, String author) {
        // 맵에서 해당 게시글 ID의 리스트를 가져오거나, 없으면 새로 생성합니다.
        List<Comment> comments = commentsMap.computeIfAbsent(articleId, k -> new ArrayList<>());

        Comment newComment = new Comment(nextId++, content, author);
        comments.add(newComment); 
        commentsMap.put(articleId, comments); // 맵에 업데이트
    }

    // 특정 게시글의 댓글 목록을 가져옵니다.
    public static List<Comment> getCommentsByArticleId(String articleId) {
        // 해당 ID의 댓글 리스트를 반환하고, 없으면 빈 리스트를 반환합니다.
        return commentsMap.getOrDefault(articleId, new ArrayList<>());
    }
}