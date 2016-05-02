package pl.jaqjacek.games.tetris.model ;
import flash.geom.Point;
/**
 * ...
 * @author jaq
 */
class BlockVO 
{
	public var blockWidth:Int;
	public var blockHeight:Int;
	public var blockColor:Int;
	public var blockStrings:Array<Dynamic>;
	public var currentBlockIndex:Int;
	private var _vectorBlock:Array<Array<Int>>;
	private var _blockParts:Array<Point>;
	static public inline var EMPTY_COLOR:Int=8;
	
	public function new(p_blockColor:Int = 0, rest:Array<Dynamic> = null )
	{
		blockColor=p_blockColor;
		blockStrings = rest;
		if (blockStrings == null) {
			blockStrings = [];
		}
		reset();
	}
	
	public function reset():Void 
	{
		currentBlockIndex=0;
		setFromString(getStringRepresentation());
	}
	
	public function initVectorBlock():Void 
	{
		_vectorBlock=new Array<Array<Int>>();
		_blockParts=new Array<Point>();
	}
	
	public function goToNextFormation():Void 
	{
		currentBlockIndex++;
		currentBlockIndex=currentBlockIndex>=blockStrings.length ? 0:currentBlockIndex;
		setFromString(getStringRepresentation());
	}
	
	//TODO move to better place
	public function cloneBlock():BlockVO
	{
		var tmpBlock:BlockVO=new BlockVO(this.blockColor, blockStrings);
		tmpBlock.currentBlockIndex=this.currentBlockIndex;
		tmpBlock.blockStrings=blockStrings;
		return tmpBlock;
	}
	
	public function getStringRepresentation():String 
	{
		return blockStrings[currentBlockIndex];
	}
	
	public function setFromString(p_blockString:String):Void 
	{
		initVectorBlock();
		//set max block width
		var stringArray:Array<Dynamic>=p_blockString.split("|");
		for(kk in 0...stringArray.length)
		{
			blockHeight=Std.int(Math.max(stringArray[kk].length, blockHeight));
		}
		//set max block height
		blockWidth=stringArray.length;
		createBlockSlots();
		for(k in 0...blockWidth)
		{
			var tmpString:String=stringArray.shift();
			if(tmpString !=null){
				for(j in 0...tmpString.length)
				{
					if(tmpString.charAt(j)=="1"){
						_vectorBlock[k][j]=1;
						_blockParts.push(new Point(k, j));
					}
				}
			}
		}
	}
	
	public function isRowFull(rowIndex:Int=0):Bool
	{
		for(i in 0...this.blockWidth)
		{
			if(getBlockAt(i, rowIndex) == 0){
				return false;
			}
		}
		return true;
	}
	
	public function isEmptyColumn(columnIndex:Int):Bool
	{
		for(i in 0...this.blockHeight)
		{
			if(getBlockAt(columnIndex,i) != 0){
				return false;
			}
		}
		return true;
	}
	
	
	
	public function createBlockSlots():Void 
	{
		for(i in 0...blockWidth)
		{
			_vectorBlock[i]=new Array<Int>();
			for(l in 0...blockHeight)
			{
				_vectorBlock[i][l]=0;
			}
		}
	}
	
	public function getBlockAt(x:Int,y:Int):Int
	{
		return _vectorBlock[x][y];
	}
	
	public function getLeftEmptyColumnsAmount():Int 
	{
		var leftEmptyColumns:Int=0;
		for(i in 0...blockWidth)
		{
			if(isEmptyColumn(i)){
				leftEmptyColumns++;
			}
			else {
				break;
			}
		}
		return leftEmptyColumns;
	}
	
	public function clean():Void 
	{
		_blockParts=null;
		for(i in 0..._vectorBlock.length)
		{
			_vectorBlock[i]=null;
		}
		_blockParts=null;
	}
	
	public var blockParts(get_blockParts, null):Array<Point>;
 	private function get_blockParts():Array<Point>
	{
		return _blockParts;
	}
	
}