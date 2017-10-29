package com.wang.module.service;

import com.wang.module.entity.User;

import java.util.List;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： wangl
 * 创建时间：  2017-06-2203:58 PM
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
public interface UserService {

    User getEntity(Long id);

    int insert(User user);

    List<User> getList();

    int countNum(User user);

    User getEntityBySele(User user);
}
