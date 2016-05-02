package pl.jaqjacek.games.tetris.view.points;
import flash.display.Sprite;
import flash.text.TextField;
/**
 * ...
 * @author jaq
 */
class PointsView extends Sprite
{
	private var _scoreLabel:TextField;
	private var _scorePoints:TextField;
	
	public function new()
	{
		super();
		_scoreLabel=new TextField();
		_scoreLabel.text="POINTS:";
		_scorePoints=new TextField();
		addChild(_scoreLabel);
		addChild(_scorePoints);
		_scorePoints.x=_scoreLabel.width + 10;
	}
	
	public function show():Void 
	{
		this.visible=true;
	}
	
	public function hide():Void 
	{
		this.visible=false;
	}
	
	public function setScore(scoreAmount:Int):Void 
	{
		_scorePoints.text=Std.string(scoreAmount);
	}
	
}