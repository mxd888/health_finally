package com.health.modules.sys.service.impl;

import com.health.common.utils.PageUtils;
import com.health.common.utils.Query;
import com.health.modules.sys.dao.JibingDao;
import com.health.modules.sys.entity.JibingEntity;
import com.health.modules.sys.service.JibingService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


@Service("jibingService")
public class JibingServiceImpl extends ServiceImpl<JibingDao, JibingEntity> implements JibingService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<JibingEntity> page = this.page(
                new Query<JibingEntity>().getPage(params),
                new QueryWrapper<JibingEntity>()
        );

        return new PageUtils(page);
    }

}