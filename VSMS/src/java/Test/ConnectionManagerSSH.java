///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//package Controller;
//
//import Model.Supplier;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
// 
//import com.jcraft.jsch.JSch;
//import com.jcraft.jsch.Session;
//import java.sql.Connection;
// 
// 
//public class ConnectionManagerSSH {
// 
//    public static void main(String[] args) throws SQLException {
// 
//        int lport=22;
//        
//        String rhost="127.0.0.1";
//        String host="52.77.45.13";
//        int rport=3306;
//        String user="ec2-user";
//        String password="";
//        String dbuserName = "root";
//        String dbpassword = "";
//        String url = "jdbc:mysql://localhost:"+lport+"/vsms";
//        String driverName="com.mysql.jdbc.Driver";
//        Connection conn = null;
//        Session session= null;
//        try{
//            //Set StrictHostKeyChecking property to no to avoid UnknownHostKey issue
//            java.util.Properties config = new java.util.Properties(); 
//            config.put("StrictHostKeyChecking", "no");
//            JSch jsch = new JSch();
//            session=jsch.getSession(user, host, lport);
//            //C:\Users\vincentt.2013\Documents\NetBeansProjects\VSMSRenewed\VSMS\web\resource\EC2VSMSNEW.pem
//            jsch.addIdentity("web\\resource\\EC2VSMSNEW.pem");
//            session.setPassword(password);
//            session.setConfig(config);
//            session.connect();
//            System.out.println("Connected");
//            int assinged_port=session.setPortForwardingL(lport, rhost, rport);
//            System.out.println("localhost:"+assinged_port+" -> "+rhost+":"+rport);
//            System.out.println("Port Forwarded");
//             
//            //mysql database connectivity
//            Class.forName(driverName).newInstance();
//            conn = ConnectionManager.getConnection();
//            //INFO:   jdbc:mysql://localhost:22/vsmsroot
//            conn = DriverManager.getConnection (url, dbuserName, dbpassword);
//            
//            
//            String sql =  "Select * from supplier";
//            PreparedStatement stmt = conn.prepareStatement(sql);
//            ResultSet rs = stmt.executeQuery();
//            while (rs.next()) {
//                int supplier_id=1;
//                String passwords = rs.getString("password");
//                String supplier_name = rs.getString("supplier_name");
//                String supplier_description = rs.getString("supplier_description");
//                String supplier_type = rs.getString("supplier_type");
//                String email = rs.getString("email");
//                int area_code = rs.getInt("area_code");
//                int telephone_number = rs.getInt("telephone_number");
//                String address = rs.getString("address");
//
//                int zipcode = rs.getInt("zipcode");
//                int min_leadtime = rs.getInt("min_leadtime");
//                int max_leadtime = rs.getInt("max_leadtime");
//
//                System.out.println(new Supplier(supplier_id, passwords, supplier_name, supplier_description, supplier_type, email, area_code, telephone_number, address, zipcode, min_leadtime, max_leadtime));
//            }
//        }catch(Exception e){
//            e.printStackTrace();
//        }finally{
//            if(conn != null && !conn.isClosed()){
//                System.out.println("Closing Database Connection");
//                conn.close();
//            }
//            if(session !=null && session.isConnected()){
//                System.out.println("Closing SSH Connection");
//                session.disconnect();
//            }
//        }
//    }
// 
//}
//
