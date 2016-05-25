package pl.jaqjacek.games.tetris.view.points;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.mediator.Mediator;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class PointsMediator extends Mediator 
{
	public static inline var NAME:String = "PointsMediator_";
	private var _pointsView:PointsView;
	private var _points:Int;
	
	public function new(viewComponent:Dynamic=null)
	{
		super(NAME, viewComponent);
		
	}
	
	override public function onRegister():Void 
	{
		_pointsView=new PointsView();
		_points=0;
		viewComponent.addChild(_pointsView);
		_pointsView.setScore(0);
	}
	
	override public function listNotificationInterests():Array<String> 
	{
		return [
				AppNotifications.ADD_POINTS,
				AppNotifications.RESET_POINTS
		];
	}
	
	override public function handleNotification(notification:INotification):Void 
	{
		var nName:String=notification.getName();
		var nBody:Dynamic=notification.getBody();
		
		switch(nName)
		{
			case AppNotifications.ADD_POINTS:
				_points += cast nBody;
				_pointsView.setScore(_points);
			
			case AppNotifications.RESET_POINTS:
				_points=0;
				_pointsView.setScore(_points);
			default:
		}
	}
	
}