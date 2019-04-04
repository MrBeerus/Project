package com.beerus.action;

import com.beerus.entity.House;
import com.beerus.entity.Users;
import com.beerus.service.HouserService;
import com.beerus.service.impl.HouseServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.List;

/**
 * @Author Beerus
 * @Description 房屋Action
 * @Date 2019/4/4
 **/
public class HouseAction extends ActionSupport {
    //房屋集合
    private List<House> houseList = null;
    //房屋数据层
    private HouserService houserService = new HouseServiceImpl();

    public void setHouseList(List<House> houseList) {
        this.houseList = houseList;
    }

    public List<House> getHouseList() {
        return houseList;
    }

    /**
     * 查找房屋列表
     *
     * @return
     */
    public String findHouseList() {
        houseList = houserService.listFindAllHouse();
        return SUCCESS;
    }

    /**
     * 根据用查找对应的房屋列表
     *
     * @return
     */
    public String findByUserHouseList() {
        houseList = houserService.listFindByUserHouse(((Users) ServletActionContext.getRequest().getSession().getAttribute("user")).getId());
        return SUCCESS;
    }
}
