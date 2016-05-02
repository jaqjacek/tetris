package pl.jaqjacek.games.tetris.view;
import flash.display.MovieClip;
import flash.text.TextField;
/**
 * ...
 * @author jaq
 */
class NextBlockView extends BlockView 
{
	public var nextBlockLabel:TextField;
	
	public function new()
	{
		super();
		nextBlockLabel=new TextField();
		nextBlockLabel.text="NEXT BLOCK";
		nextBlockLabel.y=120;
	}
	
	public function showLabel():Void 
	{
		addChild(nextBlockLabel);
	}
	
}