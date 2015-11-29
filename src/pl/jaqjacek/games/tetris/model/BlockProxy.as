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
			//_blocks.push(new BlockVO(2,"1|1|1|1",'0000|11111'));
			//_blocks.push(new BlockVO(6,"11|11"));
			//_blocks.push(new BlockVO(5,"111|01","1|11|1","0|01|111","001|011|001"));
			_blocks.push(new BlockVO(4,"0|001|111","10|10|11","111|1","011|001|001"));
			//_blocks.push(new BlockVO(1,"0|1|111","11|1|1","111|001","001|001|011"));
			//_blocks.push(new BlockVO(3,"011|110","1|11|01"));
			//_blocks.push(new BlockVO(7,"110|011","01|11|1"));
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