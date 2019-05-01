package game.mybatis.mapper;

import java.util.HashMap;

import game.model.domain.Cart;

public interface CartMapper {
	public Cart select(HashMap<String, Object> map);
}
