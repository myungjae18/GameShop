package game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import game.common.board.Pager;
import game.model.domain.Cart;
import game.model.domain.Category;
import game.model.domain.Game;
import game.model.domain.Game_Img;
import game.model.domain.Member;
import game.model.service.CartService;
import game.model.service.CategoryService;
import game.model.service.GameService;

@RestController
public class RestGameController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private GameService gameService;
	@Autowired
	private CartService cartService;
	@Autowired
	private Pager pager;

	@RequestMapping(value = "/rest/admin/categories/{category_id}", method = RequestMethod.GET)
	public Category getCategory(@PathVariable("category_id") int category_id) {
		return categoryService.select(category_id);
	}

	@RequestMapping(value = "/rest/admin/categories", method = RequestMethod.GET)
	public List getCategories() {
		return categoryService.selectAll();
	}

	@RequestMapping(value = "/rest/admin/gamePagers", method = RequestMethod.GET)
	public Pager paging(@RequestParam("currentPage") int currentPage) {
		List<Game> gameList = gameService.selectAllGames();
		pager.init(currentPage, gameList.size());
		return pager;
	}

	@RequestMapping(value = "/rest/admin/games", method = RequestMethod.GET)
	public List getGames() {
		return gameService.selectAllGames();
	}

	@RequestMapping(value = "/rest/admin/games/{game_id}", method = RequestMethod.GET)
	public Game getGameDetail(@PathVariable("game_id") int game_id) {
		return gameService.selectGame(game_id);
	}

	@RequestMapping(value = "/rest/admin/game/images", method = RequestMethod.GET)
	public List getGameImage(@RequestParam("game_id") int game_id) {
		return gameService.selectGameImg(game_id);
	}

	@RequestMapping(value = "/rest/admin/searchgame", method = RequestMethod.GET)
	public Game searchGames(@RequestParam("game_name") String game_name) {
		return gameService.searchGame(game_name);
	}

	@RequestMapping(value = "/rest/client/game/search", method = RequestMethod.GET)
	public Game searchGame(@RequestParam("game_name") String game_name) {
		return gameService.searchGame(game_name);
	}

	@RequestMapping(value = "/rest/client/games/{game_id}", method = RequestMethod.GET)
	public Game clientGetGame(@PathVariable("game_id") int game_id) {
		return gameService.selectGame(game_id);
	}

	@RequestMapping(value = "/rest/client/games", method = RequestMethod.GET)
	public List clientGetGames() {
		return gameService.selectAllGames();
	}

	@RequestMapping(value = "/rest/client/game/images", method = RequestMethod.GET)
	public List clientGetGameImage(@RequestParam("game_id") int game_id) {
		return gameService.selectGameImg(game_id);
	}

	@RequestMapping(value = "/rest/client/game/sort", method = RequestMethod.GET)
	public List sortGames(int category_id) {
		List gameList = null;
		if (category_id == 0) {
			gameList = gameService.selectAllGames();
		} else {
			gameList = gameService.selectGameByCategory(category_id);
		}
		return gameList;
	}

	@RequestMapping(value = "/rest/client/gameList", method = RequestMethod.GET)
	public List mainGameList() {
		return gameService.selectAllGames();
	}

	@RequestMapping(value = "/rest/client/game/comment/{game_id}", method = RequestMethod.GET)
	public List getComments(@PathVariable("game_id") int game_id) {
		return gameService.selectAllComments(game_id);
	}

	@RequestMapping(value = "/rest/client/pay/cart/{member_id}", method = RequestMethod.GET)
	public List getCart(@PathVariable("member_id") int member_id) {
		return cartService.selectAll(member_id);
	}

	@RequestMapping(value = "/rest/client/pay/cart/image", method = RequestMethod.GET)
	public List getCartImg(int game_id) {
		return gameService.selectGameImg(game_id);
	}

	@RequestMapping(value = "/rest/client/game/category", method = RequestMethod.GET)
	public List clientGetCategories() {
		return categoryService.selectAll();
	}
	
	@RequestMapping(value="/rest/client/pay/cart/game/{game_id}", method=RequestMethod.GET)
	public Cart checkCart(@PathVariable("game_id") int game_id) {
		return cartService.select(game_id);
	}
}