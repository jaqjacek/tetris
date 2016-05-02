package pl.jaqjacek.games.tetris.controller;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.mediator.Mediator;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;

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
	
}