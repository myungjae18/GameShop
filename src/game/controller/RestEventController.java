package game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import game.common.board.Pager;
import game.common.exception.DataNotFoundException;
import game.model.domain.Event;
import game.model.service.EventService;

@RestController
public class RestEventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private Pager pager;

	@RequestMapping(value = "/rest/admin/eventPagers", method = RequestMethod.GET)
	public Pager paging(@RequestParam("currentPage") int currentPage) {
		List<Event> eventList = eventService.selectAll();
		pager.init(currentPage, eventList.size());
		return pager;
	}

	@RequestMapping(value = "/rest/admin/events", method = RequestMethod.GET)
	public List getEvent() {
		return eventService.selectAll();
	}

	@RequestMapping(value = "/rest/admin/event/games", method = RequestMethod.GET)
	public List getEventGame(@RequestParam("event_id") int event_id) {
		return eventService.selectGame(event_id);
	}

	@RequestMapping(value = "/rest/admin/event/{event_id}", method = RequestMethod.GET)
	public Event getDetail(@PathVariable("event_id") int event_id) {
		return eventService.select(event_id);
	}

	@RequestMapping(value = "/rest/admin/eventsearch", method = RequestMethod.GET)
	public Event search(@RequestParam("event_name") String event_name) {
		return eventService.search(event_name);
	}
	
	@RequestMapping(value = "/rest/admin/existGames", method = RequestMethod.GET)
	   public List getAdminEventGameList(@RequestParam("game_id") int game_id) {
	     return eventService.eventGame(game_id);
	   } 
	
	@RequestMapping(value = "/rest/client/eventGames", method = RequestMethod.GET)
	   public List getEventGameList() {
	      return eventService.eventGameList();
	   }
	
	@RequestMapping(value = "/rest/client/events", method = RequestMethod.GET)
	public List getClientEvent() {
		return eventService.selectAll();
	}

	@RequestMapping(value = "/rest/client/event/games", method = RequestMethod.GET)
	public List getClientEventGame(@RequestParam("event_id") int event_id) {
		return eventService.selectGame(event_id);
	}

	@ExceptionHandler(DataNotFoundException.class)
	@ResponseBody
	public String dataNotFoundHandler(DataNotFoundException e) {
		return "{\"resultCode\":0, \"msg\":\"" + e.getMessage() + "\"}";
	}
}