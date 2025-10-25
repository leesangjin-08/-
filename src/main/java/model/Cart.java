package model;

import java.util.List;

/**
 * カート情報を表すクラス
 * @author M.Takahashi
 */
public class Cart {
	/******** フィールド ******************************************/
	/**
	 * ユーザーID
	 */
	private String userId;

	/**
	 * カート内の商品リスト
	 */
	private List<Product> listProd;

	/******** コンストラクタ **************************************/
	/**
	 * フィールド初期化コンストラクタ
	 * @param userId
	 * @param listProd
	 */
	public Cart(String userId, List<Product> listProd) {
		this.userId = userId;
		this.listProd = listProd;
	}

	/******** メソッド ******************************************/
	/*--------------------getter/setter--------------------*/
	/**
	 * @return userId
	 */
	public String getUserId() {
		return userId;
	}
	
	/*	public Boolean isPC = false;
		public Boolean isPh = false;
		public Boolean isG = false;
	*/
	/**
	 * @return listItem
	 */
	public List<Product> getListProd() {
		return listProd;
	}

	/*--------------------通常メソッド--------------------*/
	/**
	 * カートに商品を追加する
	 * @param prod 追加する商品
	 */
	public void add(Product prod) {
		listProd.add(prod);
	}

	/**
	 * カート内の特定の商品を除去する
	 * @param index 削除する商品のリスト内のインデックス
	 */
	public void remove(int index) {
		listProd.remove(index);
	}
	
	/**
	 * カート内の全ての商品を除去する
	 */
	public void clear() {
		listProd.clear();
	}

	/*	public int getCategoryNum(Category category) {
			int num = 0;
			for (Product pr : listProd) {
				if(pr.getCategory() == category) { num++; }
			}
					if (isPC == false && category == Category.パソコン) { isPC = true; }
					if (isPh == false && category == Category.スマホ) { isPh = true; }
					if (isG == false && category == Category.ゲーム機) { isG = true; }
			return num;
		}*/
	
	/*	public int getCategoryTotalPrice(Category category) {
			int cTotal = 0;
			for (Product pr : listProd)
			{
				if(pr.getCategory() == category)
				{
					cTotal += pr.getPrice();
				}
			}
			return cTotal;
		}*/
	
	/**
	 * カート内の商品の合計金額を取得する
	 * @return 合計金額
	 */
	public int getTotalPrice() {
		int total = 0;
		for (Product prod : listProd) {
			total += prod.getPrice();
		}
		
		return total;
	}
	
	/**
	 * カート内の商品の合計金額を文字列にして返す(３桁カンマ区切り＋円)
	 * @return
	 */
	public String getTotalPriceString() {
		return String.format("%,d", getTotalPrice()) + "円";
	}

}
