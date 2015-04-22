--
-- Author: Jacky Woo
-- Date: 2015-04-21 00:13:56
--
local Hero = class( "Hero", function()
	return display.newSprite():setNodeEventEnabled( true )
end )

Hero.Run_Anim_Name = "RUN_ANIM"
Hero.Attack_Anim_Name = "ATTACK_ANIM"

function Hero:ctor( ... )
	self:attackOnce()
end

local sharedTextureCache     = cc.Director:getInstance():getTextureCache()

local function newFrames( pattern, begin, length )
	local frames = {}
	local step = 1
	local last = begin + length - 1
	for index = begin, last, step do
		local frameName = string.format( pattern, index )
		local texture = sharedTextureCache:addImage( frameName )
		local size = texture:getContentSize()
		local frame = cc.SpriteFrame:create( frameName, cc.rect( 0, 0, size.width, size.height ) )
		if not frames then
			printError("Hero - newFrames() - invalid frame, name %s", tostring(frameName))
            return
		end
		frames[ #frames + 1 ] = frame
	end
	return frames
end

function Hero:onEnter( ... )
	-- 预加载所有动画并缓存
	local runFrames = newFrames( "images/hero/run%d.png", 1, 8 )
	local runAnim = display.newAnimation( runFrames, 0.5 / 8 )
	display.setAnimationCache( Hero.Run_Anim_Name, runAnim )

	self:run()

	local attackFrames = newFrames( "images/hero/atk%d.png", 1, 4 )
	local attackAnim = display.newAnimation( attackFrames, 0.2 / 4 )
	display.setAnimationCache( Hero.Attack_Anim_Name, attackAnim )
end

function Hero:onExit( ... )
	-- body
end

function Hero:attackOnce()
	local animation = display.getAnimationCache( Hero.Attack_Anim_Name )
	if animation then
		self:playAnimationOnce( animation, false, function() end )
	end
end

function Hero:attacking( ... )
	-- body
end

function Hero:run( ... )
	local animation = display.getAnimationCache( Hero.Run_Anim_Name )
	if animation then
		self:playAnimationForever( animation )
	end
end

return Hero