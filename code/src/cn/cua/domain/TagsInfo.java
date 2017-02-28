package cn.cua.domain;
public class TagsInfo {

	private int tagNo;
	private String tagName;
	public String subTags="";
	public TagsInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public TagsInfo(int tagNo, String tagName) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
	}
	public void addSubTag(int t){
		if(subTags.isEmpty())subTags+=t;
		else subTags+=","+t;
	}
}
