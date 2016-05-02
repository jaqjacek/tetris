package pl.jaqjacek.games.tetris;

import flash.Lib;
import flash.display.Sprite;
import flash.events.Event;

/**
 * ...
 * @author jaq
 */
class Main extends Sprite 
{
	
	public function new()
	{
		super();
		if (stage != null) 
			init();
		else 
			addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event=null):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		new AppFacade().startup(this);
		
		// entry point
	}
	
	static function main() {
		Lib.current.addChild(new Main());
	} 
	
}