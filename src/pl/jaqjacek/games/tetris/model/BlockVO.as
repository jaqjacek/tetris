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
			_vectorBlock = new Vector.<Vector.<int>>();
			//set max block width
			var stringArray:Array = p_blockString.split("|");
			for (var kk:int = 0; kk < stringArray.length; kk++) 
			{
				blockHeight = Math.max(stringArray[kk].length, blockHeight);
			}
			//set max block height
			blockWidth = stringArray.length;
			for (var i:int = 0; i < blockWidth; i++) 
			{
				_vectorBlock[i] = new Vector.<int>();
				for (var l:int = 0; l < blockHeight; l++) 
				{
					_vectorBlock[i][l] = 0;
				}
			}
			for (var k:int = 0; k < blockWidth; k++) 
			{
				var tmpString:String = stringArray.shift();
				if (tmpString != null) {
					for (var j:int = 0; j < tmpString.length; j++) 
					{
						if(tmpString.charAt(j) == "1") {
							_vectorBlock[k][j] = 1;
						}
					}
				}
				
			}
		}
		
		public function getBlockAt(x:int=0,y:int =0 ):int
		{
			return _vectorBlock[x][y];
		}
		
	}

}