

package com.health.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.health.common.exception.RRException;
import com.health.common.utils.Constant;
import com.health.common.utils.PageUtils;
import com.health.common.utils.Query;
import com.health.modules.sys.dao.SysDoctorDao;
import com.health.modules.sys.dao.SysUserDao;
import com.health.modules.sys.entity.SysDoctorEntity;
import com.health.modules.sys.entity.SysUserEntity;
import com.health.modules.sys.service.SysDoctorService;
import com.health.modules.sys.service.SysRoleService;
import com.health.modules.sys.service.SysUserRoleService;
import com.health.modules.sys.service.SysUserService;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * 系统医生
 *
 * @author 大米
 */
@Service("sysDoctorService")
public class SysDoctorServiceImpl extends ServiceImpl<SysDoctorDao, SysDoctorEntity> implements SysDoctorService {




	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String username = (String)params.get("username");

		IPage<SysDoctorEntity> page = this.page(
			new Query<SysDoctorEntity>().getPage(params),
			new QueryWrapper<SysDoctorEntity>()
				.like(StringUtils.isNotBlank(username),"username", username)
		);

		return new PageUtils(page);
	}


	@Override
	public SysDoctorEntity queryByUserName(String username) {
		return baseMapper.queryByUserName(username);
	}

	@Override
	@Transactional
	public void saveUser(SysDoctorEntity user) {
		user.setCreateTime(new Date());
		user.setPassword(user.getPassword());
		this.save(user);
	}

	@Override
	@Transactional
	public void update(SysDoctorEntity user) {
		if(StringUtils.isBlank(user.getPassword())){
			user.setPassword(null);
		}else{
			user.setPassword(user.getPassword());
		}
		this.updateById(user);

	}

	@Override
	public void deleteBatch(Long[] userId) {
		this.removeByIds(Arrays.asList(userId));
	}

}