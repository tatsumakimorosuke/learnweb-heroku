package img;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import shopping.Item;
import shopping.ItemImageView;

public class ImageManager implements ItemImageView{
	String JDBC_URL = "jdbc:h2:tcp://localhost/~/learnweb";
	String DB_USER = "sa";
	String DB_PASS = "";
	@Override
	public void itemImage(Item item) {
		// TODO 自動生成されたメソッド・スタブ
		String sql = "SELECT PRODUCT_IMG FROM PRODUCT_IMG WHERE PRODUCT_CD = ?";
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
				PreparedStatement pSmt = conn.prepareStatement(sql)) {
			pSmt.setString(1, item.getProductCd());

			ResultSet rs = pSmt.executeQuery();

			while (rs.next()) {

				item.setProductImg(rs.getString("PRODUCT_IMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
