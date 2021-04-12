package com.health.modules.sys.service.impl;

import com.health.common.utils.PageUtils;
import com.health.common.utils.Query;
import com.health.modules.sys.dao.TijianDao;
import com.health.modules.sys.entity.TijianEntity;
import com.health.modules.sys.service.TijianService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;



@Service("tijianService")
public class TijianServiceImpl extends ServiceImpl<TijianDao, TijianEntity> implements TijianService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TijianEntity> page = this.page(
                new Query<TijianEntity>().getPage(params),
                new QueryWrapper<TijianEntity>()
        );

        return new PageUtils(page);
    }

}