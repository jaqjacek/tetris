package pl.jaqjacek.games.tetris
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace(this.stage);
			new AppFacade().startup(this);
			
			// entry point
		}
		
	}
	
}