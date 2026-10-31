import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = System.getenv().getOrDefault("AIRLINE_DB_URL", "jdbc:mysql://localhost:3306/airline_reservation_system");
    private static final String USER = System.getenv("AIRLINE_DB_USER");
    private static final String PASSWORD = System.getenv("AIRLINE_DB_PASSWORD");

    public static Connection getConnection() throws SQLException {
        if (USER == null || PASSWORD == null) {
            throw new SQLException("Set AIRLINE_DB_USER and AIRLINE_DB_PASSWORD before starting the application.");
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
