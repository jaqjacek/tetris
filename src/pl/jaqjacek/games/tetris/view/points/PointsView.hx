package pl.jaqjacek.games.tetris.view.points;
#if flash
import flash.display.Sprite;
import flash.text.TextField;
#elseif js
import pixi.core.text.Text;
import pixi.core.display.Container;
#end
/**
 * ...
 * @author jaq
 */
#if js
class PointsView extends Container
#end
#if flash
class PointsView extends Sprite
#end
{
	#if flash
	private var _scoreLabel:TextField;
	private var _scorePoints:TextField;
	#elseif js
	private var _scoreLabel:Text;
	private var _scorePoints:Text;
	#end
	
	public function new()
	{
		super();
		#if flash
		_scoreLabel=new TextField();
		_scorePoints=new TextField();
		#elseif js
		_scoreLabel=new Text("");
		_scorePoints=new Text("");
		#end
		_scoreLabel.text = "POINTS:";
		
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