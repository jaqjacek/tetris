package pl.jaqjacek.games.tetris.model ;
/**
 * ...
 * @author jaq
 */
class BoardBlockVO extends BlockVO 
{
	
	public function new(p_blockColor:Int=0, p_blockWidth:Int=10, p_blockHeight:Int=20)
	{
		super(p_blockColor);
		blockHeight=p_blockHeight;
		blockWidth=p_blockWidth;
		setFromString('');
	}
	
	override public function setFromString(p_blockString:String):Void 
	{
		initVectorBlock();
		createBlockSlots();
	}
	
	public function setBlockAt(x:Int,y:Int,blockColor:Int):Void 
	{
		_vectorBlock[x][y]=blockColor;
	}
	
}