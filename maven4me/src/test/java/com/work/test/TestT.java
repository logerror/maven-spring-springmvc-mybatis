package com.work.test;

public class TestT {
	//Box<?>可以看做Box<Double>，Box<String>的父类
	public static void getData(Box<?> data) {
		System.out.println("data :" + data.getData());
	}

	public static void main(String[] args) {
		//Box<String>
		Box<Double> name = new Box<Double>(2.03);
		//Box<String>
		Box<String> age = new Box<String>("2.03");
		System.out.println("name:" + name.getData());
		System.out.println("name:" + age.getData());
		getData(name);
	}

}

class Box<T> {

	private T data;

	public Box() {

	}

	public Box(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

}
