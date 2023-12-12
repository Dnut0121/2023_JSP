package dao;

import java.sql.Timestamp;

public class CommentObj {
    private int commentId;
    private int feedNo;
    private String userId;
    private String content;
    private Timestamp ts;

    public CommentObj(int commentId, int feedNo, String userId, String content, Timestamp ts) {
        this.commentId = commentId;
        this.feedNo = feedNo;
        this.userId = userId;
        this.content = content;
        this.ts = ts;
    }

    public int getCommentId() {
        return commentId;
    }

    public int getFeedNo() {
        return feedNo;
    }

    public String getUserId() {
        return userId;
    }

    public String getContent() {
        return content;
    }

    public Timestamp getTs() {
        return ts;
    }
}