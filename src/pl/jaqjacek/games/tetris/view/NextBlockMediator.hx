package pl.jaqjacek.games.tetris.view ;
import pl.jaqjacek.games.tetris.model.BlockVO;
/**
 * ...
 * @author jaq
 */
class NextBlockMediator extends BlockMediator 
{
	public static inline var NAME:String = "NextBlockMediator_";
	
	public function new(viewComponent:Dynamic=null)
	{
		super(NAME, viewComponent);
	}
	
	override public function onRegister():Void 
	{
		_blockView=new NextBlockView();
		blockSize=30;
		
		_blockView.x=600;
		_blockView.y=0;
	}
	
	override public function setBlock(block:BlockVO):Void 
	{
		super.setBlock(block);
		_blockView.show();
	}
	
	override public function addBlockToView(x:Int,y:Int,block:IGameBlock):Void 
	{
		block.width=blockSize;
		block.height=blockSize;
		_blockView.createBlockAt(x,y,block,blockSize);
	}
	
}