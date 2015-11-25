package pl.jaqjacek.games.tetris.model 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockVO 
	{
		public var blockWidth:int;
		public var blockHeight:int;
		public var blockColor:int;
		public var blockString:String;
		private var _vectorBlock:Vector.<Vector.<int>>;
		
		public function BlockVO(p_blockColor:int=0,p_blockString:String="1") 
		{
			blockColor = p_blockColor;
			blockString = p_blockString;
			setFromString(p_blockString);
		}
		
		public function setFromString(p_blockString:String):void 
		{
			var stringArray:Array = p_blockString.split("|");
			for (var kk:int = 0; kk < stringArray.length; kk++) 
			{
				blockWidth = Math.max(stringArray[kk].length, blockWidth);
			}
			blockHeight = stringArray.length;
			_vectorBlock = new Vector.<Vector.<int>>(blockHeight);
			for (var i:int = 0; i < blockHeight; i++) 
			{
				_vectorBlock[i] = new Vector.<int>(blockWidth);
			}
			
			for (var k:int = 0; k < stringArray.length; k++) 
			{
				var tmpString:String = stringArray[k];
				for (var j:int = 0; j < blockWidth; j++) 
				{
					_vectorBlock[j][k] = 0;
					if (tmpString != null != tmpString.charAt(k) == "1") {
						_vectorBlock[j][k] = 1;
					}
				}
				
			}
		}
		
		public function getBlockAt(x:int=0,y:int =0 ):int
		{
			trace("vector",_vectorBlock[y].length,x,y)
			return _vectorBlock[x][y];
		}
		
	}

}