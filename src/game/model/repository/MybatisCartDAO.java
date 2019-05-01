package game.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.model.domain.Cart;

@Repository
public class MybatisCartDAO implements CartDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List selectAll(int member_id) {
		return sessionTemplate.selectList("Cart.selectAll", member_id);
	}

	public int insert(Cart cart) {
		return sessionTemplate.insert("Cart.insert", cart);
	}

	public Cart select(int game_id) {
		return sessionTemplate.selectOne("Cart.select", game_id);
	}
}