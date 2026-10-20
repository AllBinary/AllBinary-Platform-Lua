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
-- package org.allbinary.media.graphics.geography.map

local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorFromEventUtil = {}
ColorFromEventUtil.__index = ColorFromEventUtil
ColorFromEventUtil.className = "ColorFromEventUtil"

function ColorFromEventUtil:_init_fields()
    self.YELLOW = BasicColorFactory.getInstance().YELLOW
    self.COLOR_INT = math.tointeger(self.YELLOW // 1)
end

function ColorFromEventUtil.new()
    local self = setmetatable({}, ColorFromEventUtil)
    self:_init_fields()
    return self
end


function ColorFromEventUtil.getInstance()
        return ColorFromEventUtil.instance
end


function ColorFromEventUtil:getForegroundColor(gameCanvasInterface)
        local color = self.YELLOW
        local geographicMapCompositeInterface = gameCanvasInterface:getLayerManager()
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        if geographicMapInterface ~= nil then
            local foregroundBasicColor = geographicMapInterface:getForegroundBasicColor()
            color = foregroundBasicColor
        end
        return color
end

ColorFromEventUtil.instance = ColorFromEventUtil.new()

return ColorFromEventUtil

