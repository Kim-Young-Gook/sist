package sist.com.bean;

public class Board {
	private int    rm;
	private int    no;
	private String title;
	private String writer;
	private String password;
	private String contents;
	private String regdate;
	private int    hit;          //조회수
	private String fileName;
	private int    ref;   //그룹번호
	private int    step;  // 순서   
	private int    lev; // 레벨
	private int    pnum;
	private int    reply;
	private String job;    //new   , reply
	private String category;
	
	public Board() {
		super();
	}
	
	public Board(int rm, int no, String title, String writer, String password, String contents, String regdate, int hit,
			String fileName, int ref, int step, int lev, int pnum, int reply, String job, String category) {
		super();
		this.rm = rm;
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.password = password;
		this.contents = contents;
		this.regdate = regdate;
		this.hit = hit;
		this.fileName = fileName;
		this.ref = ref;
		this.step = step;
		this.lev = lev;
		this.pnum = pnum;
		this.reply = reply;
		this.job = job;
		this.category = category;
	}
	
	
	public int getRm() {
		return rm;
	}
	public void setRm(int rm) {
		this.rm = rm;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	

	@Override
	public String toString() {
		return "Board [rm=" + rm + ", no=" + no + ", title=" + title + ", writer=" + writer + ", password=" + password
				+ ", contents=" + contents + ", regdate=" + regdate + ", hit=" + hit + ", fileName=" + fileName
				+ ", ref=" + ref + ", step=" + step + ", lev=" + lev + ", pnum=" + pnum + ", reply=" + reply + ", job="
				+ job + ", category=" + category + "]";
	}
	

	
}
