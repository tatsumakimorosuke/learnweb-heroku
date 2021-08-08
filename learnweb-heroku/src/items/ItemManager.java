package items;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import shopping.Item;
import shopping.ItemDetailView;
import shopping.ItemSummaryView;

public class ItemManager implements ItemSummaryView, ItemDetailView {
	String JDBC_URL = "jdbc:h2:tcp://localhost/~/learnweb";
	String DB_USER = "sa";
	String DB_PASS = "";

	public List<Item> itemList() {
		List<Item> itemList = new ArrayList<Item>();

		String sql = "SELECT PRODUCT_CD, PRODUCT_NM FROM PRODUCT";
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);) {
			while (rs.next()) {

				Item item = new Item();
				item.setProductCd(rs.getString("PRODUCT_CD"));
				item.setProductNm(rs.getString("PRODUCT_NM"));

				itemList.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;

	}

	@Override
	public Item itemDetail(String itemCd) {
		Item item = new Item();
		String sql = "SELECT PRODUCT_CD, PRODUCT_NM, DESCRIPTION FROM PRODUCT WHERE PRODUCT_CD = ?";
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
				PreparedStatement pSmt = conn.prepareStatement(sql)) {
			pSmt.setString(1, itemCd);

			ResultSet rs = pSmt.executeQuery();

			while (rs.next()) {

				item.setProductCd(rs.getString("PRODUCT_CD"));
				item.setProductNm(rs.getString("PRODUCT_NM"));
				item.setDescription(rs.getString("DESCRIPTION"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return item;
	}

}
