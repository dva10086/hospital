package po;

public class Message {
    private String id;
    private String content;
    private String target_id;
    private String sender_id;
    private int status;
    private String operation_id;

    public Message(String id, String content, String target_id, String sender_id, int status, String operation_id) {
        this.id = id;
        this.content = content;
        this.target_id = target_id;
        this.sender_id = sender_id;
        this.status = status;
        this.operation_id = operation_id;
    }

    public Message() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTarget_id() {
        return target_id;
    }

    public void setTarget_id(String target_id) {
        this.target_id = target_id;
    }

    public String getSender_id() {
        return sender_id;
    }

    public void setSender_id(String sender_id) {
        this.sender_id = sender_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getOperation_id() {
        return operation_id;
    }

    public void setOperation_id(String operation_id) {
        this.operation_id = operation_id;
    }
}
