package addr1;

public class AddrDAO {
	
	private static AddressDAO instance;

    private AddressDAO() {}

    public static AddressDAO getInstance() {
        if (instance == null) {
            instance = new AddressDAO();
        }
        return instance;
    }

    public List<Address> getAllAddresses() {
        List<Address> addresses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM addresses");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Address address = new Address();
                address.setName(rs.getString("name"));
                address.setEmail(rs.getString("email"));
                address.setPhone(rs.getString("phone"));
                address.setCreatedDate(rs.getTimestamp("createdDate"));
                addresses.add(address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }
        return addresses;
    }

    public void addAddress(Address address) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("INSERT INTO addresses (name, email, phone, createdDate) VALUES (?, ?, ?, ?)");
            pstmt.setString(1, address.getName());
            pstmt.setString(2, address.getEmail());
            pstmt.setString(3, address.getPhone());
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, null);
        }
    }

    private Connection getConnection() throws SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/your_database";
        String dbUser = "your_username";
        String dbPass = "your_password";
        return DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
    }

    private void closeResources(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } a
	

}
