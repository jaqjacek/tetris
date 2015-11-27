package pl.jaqjacek.games.tetris.model 
{
	import flash.display.MovieClip;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import pl.jaqjacek.games.tetris.media.Block;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockProxy extends Proxy 
	{
		public static const NAME:String = "BlockProxy_"
		
		private var _blocks:Vector.<BlockVO>;
		
		public var curentBlock:BlockVO;
		public var nextBlock:BlockVO;
		
		public function BlockProxy() 
		{
			super(NAME);
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			_blocks = new Vector.<BlockVO>();
			initBlockList();
		}
		
		public function initBlockList():void 
		{
			//create standard block list
			_blocks.push(new BlockVO(2,"1|1|1|1"));
			_blocks.push(new BlockVO(8,"11|11"));
			_blocks.push(new BlockVO(5,"111|01"));
			_blocks.push(new BlockVO(4,"111|1"));
			_blocks.push(new BlockVO(1,"001|111"));
			_blocks.push(new BlockVO(3,"011|110"));
			_blocks.push(new BlockVO(7,"110|011"));
		}
		
		public function getRandomBlock():BlockVO
		{
			return _blocks[Math.floor(Math.random() * _blocks.length)];
		}
		
		public function getBlockMedia(blockColor:int=1):MovieClip 
		{
			var tmpBlock:Block = new Block();
			tmpBlock.gotoAndStop(blockColor);
			return tmpBlock;
		}
		
	}

}