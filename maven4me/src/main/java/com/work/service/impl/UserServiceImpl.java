package com.work.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.work.dao.UserDao;
import com.work.pojo.User;
import com.work.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	
	public User getUserById(long userId) {
		return userDao.selectByPrimaryKey(userId);
	}

	/**
	 * 事务处理必须抛出异常，Spring才会帮助事务回滚
	 * 
	 * @param users
	 */

	@Transactional
	public void insertUser(List<User> users) {
		
		for (int i = 0; i < users.size(); i++) {
			if (i < 2) {
				userDao.insert(users.get(i));
			} else {
				throw new RuntimeException();
			}

		}

	}

}
