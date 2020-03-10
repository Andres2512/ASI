package config;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * mysql://b93f301ede078a:e3246e49@us-cdbr-iron-east-04.cleardb.net/heroku_ef62cf613622b63?reconnect=true
 */
public class Conexion {

    Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-04.cleardb.net:3306/heroku_49e662d46b8ce5c", "b66b7efddcc756", "37149f09");

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error" + e);
        }
    }

    public Connection getConnection() {
        return con;
    }

}
