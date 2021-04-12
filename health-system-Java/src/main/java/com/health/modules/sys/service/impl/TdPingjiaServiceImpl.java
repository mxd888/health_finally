package com.health.modules.sys.service.impl;

import com.health.common.utils.PageUtils;
import com.health.common.utils.Query;
import com.health.modules.sys.dao.TdPingjiaDao;
import com.health.modules.sys.entity.TdPingjiaEntity;
import com.health.modules.sys.service.TdPingjiaService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


@Service("tdPingjiaService")
public class TdPingjiaServiceImpl extends ServiceImpl<TdPingjiaDao, TdPingjiaEntity> implements TdPingjiaService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TdPingjiaEntity> page = this.page(
                new Query<TdPingjiaEntity>().getPage(params),
                new QueryWrapper<TdPingjiaEntity>()
        );

        return new PageUtils(page);
    }

}