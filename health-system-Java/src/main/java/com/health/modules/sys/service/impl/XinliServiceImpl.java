package com.health.modules.sys.service.impl;

import com.health.common.utils.PageUtils;
import com.health.common.utils.Query;
import com.health.modules.sys.dao.XinliDao;
import com.health.modules.sys.entity.XinliEntity;
import com.health.modules.sys.service.XinliService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;



@Service("xinliService")
public class XinliServiceImpl extends ServiceImpl<XinliDao, XinliEntity> implements XinliService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<XinliEntity> page = this.page(
                new Query<XinliEntity>().getPage(params),
                new QueryWrapper<XinliEntity>()
        );

        return new PageUtils(page);
    }

}