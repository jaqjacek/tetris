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
		public var blockStrings:Array;
		protected var _currentBlockIndex:int
		protected var _vectorBlock:Vector.<Vector.<int>>;
		
		public function BlockVO(p_blockColor:int=0,...rest) 
		{
			blockColor = p_blockColor;
			blockStrings = rest;
			_currentBlockIndex = 0;
			setFromString(getStringRepresentation());
		}
		
		public function initVectorBlock():void 
		{
			_vectorBlock = new Vector.<Vector.<int>>();
		}
		
		public function goToNextFormation():void 
		{
			_currentBlockIndex++;
			_currentBlockIndex = _currentBlockIndex >= blockStrings.length ? 0: _currentBlockIndex;
			setFromString(getStringRepresentation());
		}
		
		public function getStringRepresentation():String 
		{
			return blockStrings[_currentBlockIndex];
		}
		
		public function setFromString(p_blockString:String):void 
		{
			initVectorBlock();
			//set max block width
			var stringArray:Array = p_blockString.split("|");
			for (var kk:int = 0; kk < stringArray.length; kk++) 
			{
				blockHeight = Math.max(stringArray[kk].length, blockHeight);
			}
			//set max block height
			blockWidth = stringArray.length;
			createBlockSlots();
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
		
		public function createBlockSlots():void 
		{
			for (var i:int = 0; i < blockWidth; i++) 
			{
				_vectorBlock[i] = new Vector.<int>();
				for (var l:int = 0; l < blockHeight; l++) 
				{
					_vectorBlock[i][l] = 0;
				}
			}
		}
		
		public function getBlockAt(x:int=0,y:int =0 ):int
		{
			return _vectorBlock[x][y];
		}
		
	}

}