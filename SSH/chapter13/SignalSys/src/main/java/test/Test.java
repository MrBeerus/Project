package test;

import com.beerus.entity.SaleOrder;
import com.beerus.entity.SaleOrderLine;
import com.beerus.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * @Author Beerus
 * @Description
 * @Date 2019/4/11
 **/
public class Test {
    public static void main(String[] args) {
        Session session = HibernateUtils.getSession();
        Transaction transaction = session.beginTransaction();
        List<SaleOrder> saleOrderList = session.createQuery("FROM SaleOrder").list();

        for (SaleOrder s : saleOrderList) {
            for (SaleOrderLine s2 : s.getSaleOrderLines()) {
                System.out.println(s2.getOdlProductName());
            }
        }
        transaction.commit();
    }
}
