    
package game.model.repository;

import java.util.List;

import game.model.domain.Comments;

public interface CommentsDAO {
	public int insert(Comments comments);
	public List selectAllByGame(int game_id);
}