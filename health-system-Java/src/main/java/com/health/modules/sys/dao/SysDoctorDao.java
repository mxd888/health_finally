

package com.health.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.health.modules.sys.entity.SysDoctorEntity;
import com.health.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 系统医生
 *
 * @author 大米
 */
@Mapper
public interface SysDoctorDao extends BaseMapper<SysDoctorEntity> {
	
	/**
	 * 根据医生名，查询系统医生
	 */
	SysDoctorEntity queryByUserName(String username);

}
