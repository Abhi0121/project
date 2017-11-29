package com.cebs.beans;

public class Items 
{
	private String item_name,unit_name;
	private int item_price,branch_id,item_id;
	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}


	private double total;	
	
	public int getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}

	
	
	public double getTotal() 
	{
		total=item_price;
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getUnit_name() {
		return unit_name;
	}

	public void setUnit_name(String unit_name) {
		this.unit_name = unit_name;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}


	public Items(int item_id,String item_name,int item_price,String unit_name,int branch_id)
	{
		this.item_id = item_id;
		this.item_name=item_name;
		this.item_price=item_price;
		this.unit_name=unit_name;
		this.branch_id=branch_id;
	}
	
	
}
