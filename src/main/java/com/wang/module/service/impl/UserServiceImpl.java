package com.wang.module.service.impl;

import com.wang.module.dao.UserDao;
import com.wang.module.entity.User;
import com.wang.module.entity.UserExample;
import com.wang.module.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import com.wang.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： wangl
 * 创建时间：  2017-06-2203:59 PM
 * 创建描述：
 *
 * 修 改 者：  
 * 修改时间： 
 * 修改描述： 
 *
 * 审 核 者：
 * 审核时间：
 * 审核描述：
 *
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public User getEntity(Long id) {
        return userDao.selectByPrimaryKey(id);
    }


    public int insert(User user) {
        return userDao.insertSelective(user);
    }

    public List<User> getList() {

        UserExample example = new UserExample();
        return userDao.selectByExample(example);
    }

    public int countNum(User user) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

		if (StringUtils.isNotBlank(user.getEmail())){
            criteria.andEmailEqualTo(user.getEmail());
        }
        if(StringUtils.isNotBlank(user.getPhone())){
            criteria.andPhoneEqualTo(user.getPhone());
        }
        if(StringUtils.isNotBlank(user.getPassword())){
            criteria.andPasswordEqualTo(user.getPassword());
        }

        return userDao.countByExample(example);
    }

    public User getEntityBySele(User user) {

        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

        if(StringUtils.isNotBlank(user.getEmail())){
            criteria.andEmailEqualTo(user.getEmail());
        }
        if(StringUtils.isNotBlank(user.getPhone())){
            criteria.andPhoneEqualTo(user.getPhone());
        }
        if(StringUtils.isNotBlank(user.getPassword())){
            criteria.andPasswordEqualTo(user.getPassword());
        }
        List<User> users = userDao.selectByExample(example);

        return users.get(0);
    }
}
