package com.nonage.dto;

import java.util.ArrayList;

public class ColorOptionVO {
	private int cseq;//옵션 부여번호
	private int pseq;//상품 부여번호
	private String color_name;//색상 이름
	private int color_size;//색상 사이즈 
		
	ArrayList<ColorOptionVO> colorOptionVO=new ArrayList<ColorOptionVO>();
	public ColorOptionVO(int cseq,int pseq,String color_name, int color_size) {
		// TODO Auto-generated constructor stub
	}

	public void setColorOptionVO(int cseq,String color_name, int color_size) {
		this.cseq=cseq;
		this.pseq=pseq;
		this.color_name=color_name;
		this.color_size=color_size;
	}
	
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}
	public int getColor_size() {
		return color_size;
	}
	public void setColor_size(int color_size) {
		this.color_size = color_size;
	}
	
}
