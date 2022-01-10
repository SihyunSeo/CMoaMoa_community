package comment;

public class commentBean {
	private int comment_no;
	private String name;
	private String com_content;
	private String com_write_date;
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getCom_write_date() {
		return com_write_date;
	}
	public void setCom_write_date(String com_write_date) {
		this.com_write_date = com_write_date;
	}
}
