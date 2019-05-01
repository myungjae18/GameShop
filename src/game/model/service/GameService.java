package game.model.service;

import java.util.List;

import game.model.domain.Comments;
import game.model.domain.Event;
import game.model.domain.Game;

public interface GameService {
   public void registGame(Game game, String[] myFile_name);
   public List selectAllGames();
   public Game selectGame(int game_id);
   public void editGame(Game game);
   public void editAllGames(Game game, String[] myFile_name);
   public void deleteGame(int game_id);
   public Game searchGame(String game_name);
   public List selectGameImg(int game_id);
   public List selectGameByCategory(int category_id);
   public void registComment(Comments comments);
   public List selectAllComments(int game_id);
}