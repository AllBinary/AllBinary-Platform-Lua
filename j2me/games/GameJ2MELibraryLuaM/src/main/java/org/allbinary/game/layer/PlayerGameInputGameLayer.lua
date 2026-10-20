--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local PlayerGameInputCompositeInterface = require("org.allbinary.game.input.PlayerGameInputCompositeInterface")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StaticViewPosition = require("org.allbinary.view.StaticViewPosition")
local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerGameInputGameLayer = {}
PlayerGameInputGameLayer.__index = PlayerGameInputGameLayer
PlayerGameInputGameLayer.className = "PlayerGameInputGameLayer"
setmetatable(PlayerGameInputGameLayer, {__index = AllBinaryGameLayer})

function PlayerGameInputGameLayer:_init_fields()
    self.playerGameInput = nil
end


function PlayerGameInputGameLayer.new(playerInputId)
    local self = setmetatable(AllBinaryGameLayer.new(StringUtil.getInstance().EMPTY_STRING, Rectangle.new(PointFactory.getInstance().ZERO_ZERO, 0, 0), StaticViewPosition.new(0, 0, 0)), PlayerGameInputGameLayer)
    self:_init_fields()
        -- super(...) made self above
        self.playerGameInput = PlayerGameInput.new(self:getGameKeyEventList(), BasicArrayListD.new(), playerInputId)
        local canvasStrings = CanvasStrings.getInstance()
        self.logUtil:putF("Danger Danger Danger: Should Not Be Called Except For Testing Input", self, canvasStrings.PAINT)
    return self
end


function PlayerGameInputGameLayer:getPlayerGameInput()
        return self.playerGameInput
end


function PlayerGameInputGameLayer:initInputProcessors()
end


-- throws Exception
function PlayerGameInputGameLayer:processInput(myManager)
end


function PlayerGameInputGameLayer:paint(graphics)
end

return PlayerGameInputGameLayer

