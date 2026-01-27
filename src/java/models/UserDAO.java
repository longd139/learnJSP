package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class UserDAO {

    private static final String LOGIN_QUERY = "SELECT fullName, roleID FROM tblUsers WHERE userID = ? AND password = ?";
    private static final String SEARCH_QUERY = "SELECT userID,fullName, roleID FROM tblUsers WHERE fullName like ?";

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(LOGIN_QUERY);
            ptm.setString(1, userID);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                user = new UserDTO(userID, fullName, roleID, password);
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public List<UserDTO> findName(String keyword) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH_QUERY);
            ptm.setString(1, "%" + keyword + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                String password = "***";
                listUser.add(new UserDTO(userID, fullName, roleID, password));
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listUser;
    }

}
