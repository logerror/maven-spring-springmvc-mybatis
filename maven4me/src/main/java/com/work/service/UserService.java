package com.work.service;

import java.util.List;

import com.work.pojo.User;

public interface UserService {
	 public User getUserById(long userId);
	 public void insertUser(List<User> User);
}
