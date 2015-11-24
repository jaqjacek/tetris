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
		
		public function BlockVO(p_blockWidth:int=1,p_blockHeight:int=1,p_blockColor:int=0,p_blockString:String="1") 
		{
			blockWidth = p_blockWidth;
			blockHeight = p_blockHeight;
			blockColor = p_blockColor;
			blockString = p_blockString;
			setFromString(p_blockString);
		}
		
		public function setFromString(p_blockString:String):void 
		{
			_vectorBlock = new Vector.<Vector.<int>>(blockHeight);
			var stringArray:Array = p_blockString.split("|");
			for (var i:int = 0; i < blockHeight; i++) 
			{
				var row:Vector.<int> = new Vector.<int>(blockHeight);
				var stringRow:String = stringArray.shift();
				for (var j:int = 0; j < blockHeight; j++) 
				{
					if (stringRow == null || stringRow.length < j - 1 || stringRow.charAt(j) == '0' ) {
						row[j] = 0;
					}
					else {
						row[j] = 1;
					}
				}
				_vectorBlock[i] = row;
			}
		}
		
		public function getBlockAt(x:int=0,y:int =0 ):int
		{
			return _vectorBlock[y][x];
		}
		
	}

}