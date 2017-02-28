package cn.cua.domain;
public class SubTagsInfo {

	private int subtagId;
	private String subtagName;
	private int tagNo;
	public SubTagsInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSubtagId() {
		return subtagId;
	}
	public void setSubtagId(int subtagId) {
		this.subtagId = subtagId;
	}
	public String getSubtagName() {
		return subtagName;
	}
	public void setSubtagName(String subtagName) {
		this.subtagName = subtagName;
	}
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public SubTagsInfo(int subtagId, String subtagName) {
		super();
		this.subtagId = subtagId;
		this.subtagName = subtagName;
		this.tagNo=0;
	}
	public SubTagsInfo(int subtagId, String subtagName, int tagNo) {
		super();
		this.subtagId = subtagId;
		this.subtagName = subtagName;
		this.tagNo = tagNo;
	}


}
