package pl.jaqjacek.games.tetris.controller 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class KeyboardControllerMediator extends Mediator
	{
		private var _dwonArrowPressed:Boolean;
		public function KeyboardControllerMediator(viewComponent:Object=null) 
		{
			super(mediatorName, viewComponent);
			trace(viewComponent);
		}
		
		override public function onRegister():void 
		{
			var mainStage:Sprite = viewComponent as Sprite;
			trace(mainStage);
			mainStage.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			mainStage.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		private function keyUpHandler(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.UP:
					facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.ROTATE_BLOCK);
				break;
				case Keyboard.DOWN:
					_dwonArrowPressed = false;
					facade.sendNotification(AppNotifications.STOP_SPEEDING_UP);
				break;
			}
		}
		
		private function keyDownHandler(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.DOWN:
					if (!_dwonArrowPressed) {
						_dwonArrowPressed = true;
						facade.sendNotification(AppNotifications.START_SPEEDING_UP);
					}
				break;
				case Keyboard.LEFT:
					facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.MOVE_BLOCK, -1);
				break;
				case Keyboard.RIGHT:
					facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.MOVE_BLOCK, 1);
				break;
			}
		}
		
	}

}