/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Comparator;

/**
 *
 * @author David
 */
public class SupplierTimeComparator implements Comparator<Supplier>{
    public int compare(Supplier supplier1,Supplier supplier2){
        double expectedLeadTime1=(supplier1.getMax_leadtime()+supplier1.getMin_leadtime())/2.0;
        double expectedLeadTime2=(supplier2.getMax_leadtime()+supplier2.getMin_leadtime())/2.0;
        if(expectedLeadTime1>expectedLeadTime2){
            return 1;
        }else if(expectedLeadTime1==expectedLeadTime2){
            return 0;
        }else{
            return -1;
        }
    }
    
}
