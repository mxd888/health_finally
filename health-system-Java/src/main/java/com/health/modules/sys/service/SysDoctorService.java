

package com.health.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.health.common.utils.PageUtils;
import com.health.modules.sys.entity.SysDoctorEntity;
import com.health.modules.sys.entity.SysUserEntity;

import java.util.List;
import java.util.Map;


/**
 * 系统医生
 *
 * @author 大米
 */
public interface SysDoctorService extends IService<SysDoctorEntity> {

	/**
	 * 查
	 * @param params
	 * @return
	 */
	PageUtils queryPage(Map<String, Object> params);



	/**
	 * 根据医生名，查询系统医生
	 */
	SysDoctorEntity queryByUserName(String username);

	/**
	 * 保存医生
	 */
	void saveUser(SysDoctorEntity user);
	
	/**
	 * 修改医生
	 */
	void update(SysDoctorEntity user);
	
	/**
	 * 删除医生
	 */
	void deleteBatch(Long[] userIds);

}
