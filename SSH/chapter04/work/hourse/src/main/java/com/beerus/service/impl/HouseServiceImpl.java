package com.beerus.service.impl;

import com.beerus.dao.HouseDao;
import com.beerus.dao.impl.HouseDaoImpl;
import com.beerus.entity.House;
import com.beerus.service.HouserService;

import java.util.List;

public class HouseServiceImpl implements HouserService {
    private HouseDao houseDao = new HouseDaoImpl();

    public List<House> listFindAllHouse() {
        return houseDao.listFindAllHouse();
    }

    public List<House> listFindByUserHouse(Integer id) {
        return houseDao.listFindByUserHouse(id);
    }
}
