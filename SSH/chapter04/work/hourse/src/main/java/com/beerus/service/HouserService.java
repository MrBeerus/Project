package com.beerus.service;

import com.beerus.entity.House;

import java.util.List;

public interface HouserService {
    /**
     * 查找所有租房
     * @return 房屋集合
     */
    List<House> listFindAllHouse();
    /**
     * 根据用户查找租房
     * @param id 用户id
     * @return 房屋集合
     */
    List<House> listFindByUserHouse(Integer id);
}
