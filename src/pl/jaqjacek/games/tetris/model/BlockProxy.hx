package pl.jaqjacek.games.tetris.model ;
import org.puremvc.haxe.patterns.proxy.Proxy;
#if flash
import pl.jaqjacek.games.tetris.view.FlashGameBlock;
#elseif js
import pl.jaqjacek.games.tetris.view.IGameBlock;
#end
import pl.jaqjacek.games.tetris.view.JSGameBlock;

/**
 * ...
 * @author jaq
 */
class BlockProxy extends Proxy 
{
	public static inline var NAME:String = "BlockProxy_";
	
	private var _blocks:Array<BlockVO>;
	
	public var curentBlock:BlockVO;
	public var nextBlock:BlockVO;
	
	public function new()
	{
		super(NAME);
	}
	
	override public function onRegister():Void 
	{
		super.onRegister();
		_blocks=new Array<BlockVO>();
		initBlockList();
	}
	
	public function initBlockList():Void 
	{
		//create standard block list
		_blocks.push(new BlockVO(2,["1|1|1|1",'0000|11111']));
		_blocks.push(new BlockVO(6,["11|11"]));
		_blocks.push(new BlockVO(5,["111|01","1|11|1","0|01|111","001|011|001"]));
		_blocks.push(new BlockVO(4,["0|001|111","10|10|11","111|1","011|001|001"]));
		_blocks.push(new BlockVO(1,["0|1|111","11|1|1","111|001","001|001|011"]));
		_blocks.push(new BlockVO(3,["011|110","1|11|01"]));
		_blocks.push(new BlockVO(7,["110|011","01|11|1"]));
	}
	
	public function getRandomBlock():BlockVO
	{
		return _blocks[Math.floor(Math.random() * _blocks.length)];
	}
	
	public function getBlockMedia(blockColor:Int=1):IGameBlock 
	{
		#if flash
		var tmpBlock:IGameBlock = new FlashGameBlock();
		#elseif js
		var tmpBlock:IGameBlock = new JSGameBlock();
		#end
		tmpBlock.gotoAndStop(blockColor);
		return tmpBlock;
	}
	
}