package com.health.modules.sys.service.impl;

import com.health.common.utils.PageUtils;
import com.health.common.utils.Query;
import com.health.modules.sys.dao.YundongDao;
import com.health.modules.sys.entity.YundongEntity;
import com.health.modules.sys.service.YundongService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


@Service("yundongService")
public class YundongServiceImpl extends ServiceImpl<YundongDao, YundongEntity> implements YundongService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<YundongEntity> page = this.page(
                new Query<YundongEntity>().getPage(params),
                new QueryWrapper<YundongEntity>()
        );

        return new PageUtils(page);
    }

}