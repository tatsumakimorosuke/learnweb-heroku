package img;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import shopping.Item;
import shopping.ItemImageView;

public class ImageManager implements ItemImageView {
	private static Connection getConnection() throws URISyntaxException, SQLException {
		// heroku configに設定されている値を取得。
		URI dbUri = new URI(System.getenv("CLEARDB_DATABASE_URL"));
		// :をデリミタとして必要な情報を抜き取る。
		String username = dbUri.getUserInfo().split(":")[0];
		String password = dbUri.getUserInfo().split(":")[1];
		// JDBC用のURLを生成。
		String dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();

		return DriverManager.getConnection(dbUrl, username, password);
	}

	@Override
	public void itemImage(Item item) {
		try {
			// ドライバの読み込み。
			Class.forName("com.mysql.cj.jdbc.Driver");
			// データベースへ接続のためprivateメソッドを呼び出す。
			String sql = "SELECT PRODUCT_IMG FROM PRODUCT_IMG WHERE PRODUCT_CD = ?";
			try (Connection conn = getConnection();
					PreparedStatement pSmt = conn.prepareStatement(sql)) {
				pSmt.setString(1, item.getProductCd());

				ResultSet rs = pSmt.executeQuery();

				while (rs.next()) {

					item.setProductImg(rs.getString("PRODUCT_IMG"));
				}
			} catch (URISyntaxException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();

		}
	}

}
