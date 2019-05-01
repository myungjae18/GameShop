package game.model.service;

import java.util.List;

import game.model.domain.Cart;

public interface CartService {
	public List selectAll(int member_id);
	public void insert(Cart cart);
	public Cart select(int game_id);
}