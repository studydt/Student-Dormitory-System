package javabean;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Timer;
public class JDBC {
    static final String DB_URL = "jdbc:mysql://localhost:3306/student_system?useSSL=false&serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "123456";
    Connection connection= null;

    public JDBC() throws SQLException, ClassNotFoundException {
        //1、注册JDBC驱动
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2、获取数据库连接
        Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
        this.connection = connection;
    }

    public ArrayList<userhome> selectuserhome(String adminhome) throws SQLException {
        ArrayList<userhome> userhomes=new ArrayList<>();

        Statement statement = this.connection.createStatement();//获取操作数据库的对象
        String sql = "select * from user,userhome where userhome.number=user.number and adminhome=?";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,adminhome);
        ResultSet resultSet = pstmt.executeQuery();//执行sql，获取结果集
        ArrayList<userhome> userhomes1 =new ArrayList<>();
        while (resultSet.next()){
            userhome userhome1 = new userhome();
            userhome1.setNumber(resultSet.getString("number"));
            userhome1.setName(resultSet.getString("name"));
            userhome1.setHome(resultSet.getString("home"));
            userhome1.setEmail(resultSet.getString("email"));
            userhome1.setThing(Integer.parseInt(resultSet.getString("thing")));
            userhome1.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(resultSet.getDate("date")));
            userhomes1.add(userhome1);
        }
        return userhomes1;
    }

    public user checkuser(user user1) throws SQLException{
        String sql = "select * from user where number=? and password =?";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,user1.getNumber());
        pstmt.setString(2,user1.getPassword());
        ResultSet resultSet = pstmt.executeQuery();//执行sql，获取结果集
        user user_result=new user();
        if(resultSet.next()){
            user_result.setNumber(resultSet.getString("number"));
            user_result.setName(resultSet.getString("name"));
            user_result.setHome(resultSet.getString("home"));
            user_result.setEmail(resultSet.getString("email"));
            return user_result;
        }
        return null;
    }
    public admin checkadmin(admin admin1) throws SQLException{
        String sql = "select * from admin where adminnumber=? and adminpassword=?";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,admin1.getAdminnumber());
        pstmt.setString(2,admin1.getAdminpassword());
        ResultSet resultSet = pstmt.executeQuery();//执行sql，获取结果集
        admin admin_result=new admin();
        if(resultSet.next()){
            admin_result.setAdminnumber(resultSet.getString("adminnumber"));
            admin_result.setAdminname(resultSet.getString("adminname"));
            admin_result.setAdminhome(resultSet.getString("adminhome"));
            admin_result.setAdminemail(resultSet.getString("adminemail"));
            return admin_result;
        }
        return null;
    }
    public int insertuser(user user1) throws SQLException {
        String sql = "INSERT INTO user values(?,?,?,?,?)";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,user1.getNumber());
        pstmt.setString(2,user1.getName());
        pstmt.setString(3,user1.getHome());
        pstmt.setString(4,user1.getEmail());
        pstmt.setString(5,user1.getPassword());

        int resultSet = pstmt.executeUpdate();
        return resultSet;
    }
    public int insertadmin(admin admin1) throws SQLException {
        String sql = "INSERT INTO admin values(?,?,?,?,?)";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,admin1.getAdminnumber());
        pstmt.setString(2,admin1.getAdminname());
        pstmt.setString(3,admin1.getAdminhome());
        pstmt.setString(4,admin1.getAdminemail());
        pstmt.setString(5,admin1.getAdminpassword());

        int resultSet = pstmt.executeUpdate();
        return resultSet;
    }
    public int insertuserhome(userhome userhome1) throws SQLException {
        String sql = "INSERT INTO userhome values(?,?,?,?)";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,userhome1.getNumber());
        pstmt.setString(2,userhome1.getAdminhome());
        pstmt.setInt(3,userhome1.getThing());
        pstmt.setTimestamp(4,new Timestamp(System.currentTimeMillis()));
        int resultSet = pstmt.executeUpdate();
        return resultSet;
    }
    public int updateuser(user user1) throws SQLException {
        String sql ="UPDATE `user` SET `name`=? ,home=? , email=?,`password`=? WHERE number =?";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,user1.getName());
        pstmt.setString(2,user1.getHome());
        pstmt.setString(3,user1.getEmail());
        pstmt.setString(4,user1.getPassword());
        pstmt.setString(5,user1.getNumber());
        int i = pstmt.executeUpdate();
        return i;
    }
    public int updateadmin(admin admin1) throws SQLException {
        String sql ="UPDATE `admin` SET `adminname`=? ,adminhome=? , adminemail=?,`adminpassword`=? WHERE adminnumber =?";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,admin1.getAdminname());
        pstmt.setString(2,admin1.getAdminhome());
        pstmt.setString(3,admin1.getAdminemail());
        pstmt.setString(4,admin1.getAdminpassword());
        pstmt.setString(5,admin1.getAdminnumber());
        int i = pstmt.executeUpdate();
        return i;
    }
    public int deleteuserhome(userhome userhome1) throws SQLException {
        String sql ="DELETE FROM userhome WHERE number=? AND adminhome =?";
        PreparedStatement pstmt = this.connection.prepareStatement(sql);
        pstmt.setString(1,userhome1.getNumber());
        pstmt.setString(2,userhome1.getAdminhome());
        int i = pstmt.executeUpdate();
        return  i;
    }
    protected void close() throws SQLException {
        this.connection.close();
    }
}

