package com.beerus.dao.impl;

import com.beerus.dao.HouseDao;
import com.beerus.entity.House;
import com.beerus.utils.HibernateUtils;

import java.util.List;

public class HouseDaoImpl extends HibernateUtils implements HouseDao {

    public List<House> listFindAllHouse() {
        return getSession().createQuery("FROM House").list();
    }

    public List<House> listFindByUserHouse(Integer id) {
        return getSession().createQuery("FROM House WHERE users.id = ?").setInteger(0, id).list();
    }
}
