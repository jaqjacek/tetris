package pl.jaqjacek.games.tetris.view.level ;
#if flash
import flash.display.Sprite;
import flash.text.TextField;
#elseif js
import pixi.core.display.Container;
import pixi.core.text.Text;
#end
/**
 * ...
 * @author jaq
 */
#if js
class LevelView extends Container
#end
#if flash
class LevelView extends Sprite
#end
{
	#if flash
	private var _levelLabel:TextField;
	private var _levelPoints:TextField;
	#elseif js
	private var _levelLabel:Text;
	private var _levelPoints:Text;
	#end
	
	
	public function new()
	{
		super();
		#if flash
		_levelLabel=new TextField();
		_levelPoints=new TextField();
		#elseif js
		_levelLabel=new Text("");
		_levelPoints=new Text("");
		#end
		
		_levelLabel.text="LEVEL:";
		addChild(_levelLabel);
		addChild(_levelPoints);
		_levelPoints.x=_levelLabel.width + 10;
	}
	
	public function show():Void 
	{
		this.visible=true;
	}
	
	public function hide():Void 
	{
		this.visible=false;
	}
	
	public function setlevel(levelAmount:Int):Void 
	{
		_levelPoints.text=Std.string(levelAmount);
	}
	
}