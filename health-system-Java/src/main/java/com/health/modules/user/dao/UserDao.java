package com.health.modules.user.dao;

import com.health.modules.user.entity.UserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 用户
 * 
 * @author mxd
 * @email 1191998028@qq.com
 * @date 2021-04-10 22:10:06
 */
@Mapper
@Repository
public interface UserDao extends BaseMapper<UserEntity> {
	
}
