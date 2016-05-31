package pl.jaqjacek.games.tetris;
import js.Browser;
#if flash
import flash.Lib;
import flash.display.Sprite;
import flash.events.Event;
#elseif js
import js.Lib;
import pixi.loaders.Loader;
import pixi.plugins.app.Application;

#end

/**
 * ...
 * @author jaq
 */
#if flash
class Main extends Sprite 
#elseif js
class Main extends Application
#end
{
	#if flash
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
		#if flash
			new AppFacade().startup(this);
		#elseif js
			new JSAppFacade().startup(this);
		#end
		
		
		// entry point
	}
	
	static function main() {
		Lib.current.addChild(new Main());
	} 
	#end
	
	#if js
	public function new()
	{
		super();
		backgroundColor = 0x80FF66;
		width = 800;
		height = 600;
		this.fps = 24;
		super.start();
		stage.interactive = true;
		var assetsToLoader:Array<String> = [];
		init();
		
	}
	
	private function init(e:Dynamic=null):Void 
	{
		new AppFacade().startup(this);
	}
	
	static function main() {
		new Main();
	} 
	#end
	
}