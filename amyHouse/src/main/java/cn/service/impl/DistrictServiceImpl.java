package cn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.dao.DistrictDao;
import cn.dao.StreetDao;
import cn.entity.TDistrict;
import cn.entity.TStreet;
import cn.service.DistrictService;

//@Service注解标注该类为业务类
//括号中的districtService相当于spring配置文件中定义bean的id
//当扫描该类时会在spring容器中生成一个id名称叫districtService的实例
@Service("districtService")
public class DistrictServiceImpl implements DistrictService {
	
	@Resource
	private DistrictDao districtDao;
	@Resource
	private StreetDao streetDao;

	@Override
	public List<TDistrict> queryAllDistrict() {
		
		return districtDao.getAllDistrict();
	}

	@Override
	public List<TStreet> getStreetsByDistrictId(Long districtId) {
		
		return streetDao.getStreetsByDistrictId(districtId);
	}

}
