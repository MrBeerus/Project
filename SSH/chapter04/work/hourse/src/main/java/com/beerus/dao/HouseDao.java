package com.beerus.dao;

import com.beerus.entity.House;

import java.util.List;

/**
 * 房屋信息数据层
 */
public interface HouseDao {
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
