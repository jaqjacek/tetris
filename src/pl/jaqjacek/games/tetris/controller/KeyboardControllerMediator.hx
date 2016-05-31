package pl.jaqjacek.games.tetris.controller;
#if flash
import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
#end
import js.Browser;
import js.html.KeyEvent;
import org.puremvc.haxe.patterns.mediator.Mediator;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class KeyboardControllerMediator extends Mediator
{
	private var _dwonArrowPressed:Bool;
	public function new(viewComponent:Dynamic=null)
	{
		super(mediatorName, viewComponent);
	}
	#if flash
	override public function onRegister():Void 
	{
		var mainStage:Sprite=cast viewComponent, Sprite;
		mainStage.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		mainStage.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
	}
	
	private function keyUpHandler(e:KeyboardEvent):Void 
	{
		switch(e.keyCode){
			case Keyboard.UP:
				facade.sendNotification(AppNotifications.CHECK_BLOCK_ROTATION);
			case Keyboard.DOWN:
				_dwonArrowPressed=false;
				facade.sendNotification(AppNotifications.STOP_SPEEDING_UP);
		}
	}
	
	private function keyDownHandler(e:KeyboardEvent):Void 
	{
		switch(e.keyCode){
			case Keyboard.DOWN:
				if(!_dwonArrowPressed){
					_dwonArrowPressed=true;
					facade.sendNotification(AppNotifications.START_SPEEDING_UP);
				}
			
			case Keyboard.LEFT:
				facade.sendNotification(AppNotifications.MOVE_BLOCK, -1);
			case Keyboard.RIGHT:
				facade.sendNotification(AppNotifications.MOVE_BLOCK, 1);
		}
	}
	#end
	
	#if js
	override public function onRegister():Void 
	{
		Browser.document.addEventListener('keydown', onKeyDownHandler);
	}
	
	private function onKeyDownHandler(e):Void 
	{
		facade.sendNotification(AppNotifications.STOP_TIMER, 1);
	}
	#end
}