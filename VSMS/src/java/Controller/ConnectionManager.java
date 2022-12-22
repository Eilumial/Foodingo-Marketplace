package Controller;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * A class that manages connections to the database. It also has a utility
 * method that close connections, statements and resultsets
 */
public class ConnectionManager {

    private static final String PROPS_FILENAME = "/connection.properties";
    private static String dbUser;
    private static String dbPassword;
    private static String dbURL;
    private static String awsDbURL;
    private static String sshEC2URL;

    static {
//         grab environment variable this is for Openshift
        //dbURL = grabOpenshiftEnvironment();
// grap environment variable for AWS
        try {
//            //Insert input stream here
            InputStream is = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
            Properties props = new Properties();
            props.load(is);

//            Grab RDS Environment for AWS if it is RDS
//            awsDbURL =grabAWSRDSEnvironment(props);
            //            Grab SSH Environment for AWS EC2 
//            grabSSHEC2Url(props);

            // load localhost database connection details
            String host = props.getProperty("db.host");
            String port = props.getProperty("db.port");
            String dbName = props.getProperty("db.name");
            dbUser = props.getProperty("db.user");
            dbPassword = props.getProperty("db.password");
            dbURL = "jdbc:mysql://" + host + ":" + port + "/" + dbName;
        } catch (Exception ex) {
            // unable to load properties file
            String message = "Unable to load '" + PROPS_FILENAME + "'.";

            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
            throw new RuntimeException(message, ex);
        }

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            // unable to load properties file
            String message = "Unable to find JDBC driver for MySQL.";

            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
            throw new RuntimeException(message, ex);
        }

    }

   

    /**
     * Gets a connection to the database
     *
     * @return the connection
     * @throws SQLException if an error occurs when connecting
     */
    public static Connection getConnection() throws SQLException {
        String message = "dbURL: " + dbURL
                + "  , dbUser: " + dbUser
                + "  , dbPassword: " + dbPassword;
        Logger
                .getLogger(ConnectionManager.class
                        .getName()).log(Level.INFO, message);
        if (awsDbURL != null) {
            return DriverManager.getConnection(awsDbURL);
        } else {
            return DriverManager.getConnection(dbURL, dbUser, dbPassword);
        }
    }

    /**
     * close the given connection, statement and resultset
     *
     * @param conn the connection object to be closed
     * @param stmt the statement object to be closed
     * @param rs the resultset object to be closed
     */
    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();

            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionManager.class
                    .getName()).log(Level.WARNING,
                            "Unable to close ResultSet", ex);
        }
        try {
            if (stmt != null) {
                stmt.close();

            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionManager.class
                    .getName()).log(Level.WARNING,
                            "Unable to close Statement", ex);
        }
        try {
            if (conn != null) {
                conn.close();

            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionManager.class
                    .getName()).log(Level.WARNING,
                            "Unable to close Connection", ex);
        }
        
    }

    private static boolean isLocalhost() {
        try {
            URL myURL = new URL("http://localhost");
            // also you can put a port 
            //  URL myURL = new URL("http://localhost:8080");
            URLConnection myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            return true;
        } catch (MalformedURLException e) {
            // new URL() failed
            return false;
        } catch (IOException e) {
            // openConnection() failed
            return false;
        } catch (Exception e) {
            return false;
        }
    }
//ENVIRONMENT SETTING (if not using localhost)
     public static String grabOpenshiftEnvironment() {

        String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");

        // this is production environment
        // obtain database connection properties from environment variables
        String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
        String dbName = System.getenv("OPENSHIFT_APP_NAME");
        dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        dbPassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");

        return "jdbc:mysql://" + host + ":" + port + "/" + dbName;
    }
    private static String grabAWSRDSEnvironment(Properties props) {
        String host = props.getProperty("AWS_MYSQL_DB_HOST");
        String port = props.getProperty("AWS_MYSQL_DB_PORT");
        String dbName = props.getProperty("AWS_APP_NAME");
        dbUser = props.getProperty("AWS_MYSQL_DB_USERNAME");
        dbPassword = props.getProperty("AWS_MYSQL_DB_PASSWORD");
        return "jdbc:mysql://" + host + ":"
                + port + "/" + dbName + "?user=" + dbUser + "&password=" + dbPassword;
    }

   

}
