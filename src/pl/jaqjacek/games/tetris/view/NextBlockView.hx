package pl.jaqjacek.games.tetris.view;
#if flash
import flash.text.TextField;
#elseif js
import pixi.core.text.Text;
#end
/**
 * ...
 * @author jaq
 */
class NextBlockView extends BlockView 
{
	#if flash
	public var nextBlockLabel:TextField;
	#elseif js
	public var nextBlockLabel:Text;
	#end
	
	public function new()
	{
		super();
		#if flash
		nextBlockLabel = new TextField();
		#elseif js
		nextBlockLabel = new Text("NEXT BLOCK");
		#end
		
		nextBlockLabel.text="NEXT BLOCK";
		nextBlockLabel.y=120;
	}
	
	public function showLabel():Void 
	{
		addChild(nextBlockLabel);
	}
	
}