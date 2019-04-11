package test;

import com.beerus.entity.District;
import com.beerus.entity.Street;
import com.beerus.utils.HibernateUtils;
import org.hibernate.Query;
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
        Transaction tx = session.beginTransaction();

        District d = (District) session.load(District.class, 3301);

        Street s = new Street();
        s.setDistrict(d);
        s.setName("下雨路");


        d.getDatas().add(s);


        tx.commit();
    }
}
