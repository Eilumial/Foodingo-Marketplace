<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page import="Controller.ConnectionManager"%>
<%@ page import="java.sql.*" %>
<%
  // Read RDS connection information from the environment
    //Insert input stream here
    InputStream is = ConnectionManager.class.getResourceAsStream("/connection.properties");
    Properties props = new Properties();
    props.load(is);
    String dbName = props.getProperty("AWS_APP_NAME");
    String userName = props.getProperty("AWS_MYSQL_DB_USERNAME");
    String password = props.getProperty("AWS_MYSQL_DB_PASSWORD");
    String hostname = props.getProperty("AWS_MYSQL_DB_HOST");
    String port = props.getProperty("AWS_MYSQL_DB_PORT");
    String jdbcUrl = "jdbc:mysql://" + hostname + ":"
            + port + "/" + dbName + "?user=" + userName + "&password=" + password;

    // Load the JDBC driver
    try {
        System.out.println("Loading driver...");
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver loaded!");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException("Cannot find the driver in the classpath!", e);
    }

    Connection conn = null;
    Statement setupStatement = null;
    Statement readStatement = null;
    ResultSet resultSet = null;
    String results = "";
    int numresults = 0;
    String statement = null;

    try {
        // Create connection to RDS DB instance
        conn = ConnectionManager.getConnection();

        // Create a table and write two rows
        setupStatement = conn.createStatement();
        String createTable = "CREATE TABLE Beanstalk2 (Resource char(50));";
        String insertRow1 = "INSERT INTO Beanstalk2 (Resource) VALUES ('EC2 Instance');";
        String insertRow2 = "INSERT INTO Beanstalk2 (Resource) VALUES ('RDS Instance');";

        setupStatement.addBatch(createTable);
        setupStatement.addBatch(insertRow1);
        setupStatement.addBatch(insertRow2);
        setupStatement.executeBatch();
        setupStatement.close();

    } catch (SQLException ex) {
        // handle any errors
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
    } finally {
        System.out.println("Closing the connection.");
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ignore) {
            }
        }
    }

    try {
        conn = ConnectionManager.getConnection();

        readStatement = conn.createStatement();
        resultSet = readStatement.executeQuery("SELECT Resource FROM Beanstalk;");

        resultSet.first();
        results = resultSet.getString("Resource");
        resultSet.next();
        results += ", " + resultSet.getString("Resource");

        resultSet.close();
        readStatement.close();
        conn.close();

    } catch (SQLException ex) {
        // Handle any errors
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
    } finally {
        System.out.println("Closing the connection.");
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ignore) {
            }
        }
    }
%>
<html>
    <body><p>Established connection to RDS. Read first two rows: <%= results%></p></body>
</html>