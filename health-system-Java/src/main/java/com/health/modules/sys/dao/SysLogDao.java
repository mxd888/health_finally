

package com.health.modules.sys.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.health.modules.sys.entity.SysLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统日志
 *
 * @author 大米
 */
@Mapper
public interface SysLogDao extends BaseMapper<SysLogEntity> {
	
}
