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
-- package org.allbinary.game.displayable.canvas

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CanvasUtil = {}
CanvasUtil.__index = CanvasUtil
CanvasUtil.className = "CanvasUtil"


function CanvasUtil.new()
    local self = setmetatable({}, CanvasUtil)
    return self
end


function CanvasUtil.getKeyName(key)
        local commonPhoneStrings = CommonPhoneStrings.getInstance()
        if key == Canvas.UP then
            return commonPhoneStrings.UP
        elseif key == Canvas.DOWN then
            return commonPhoneStrings.DOWN
        elseif key == Canvas.RIGHT then
            return commonPhoneStrings.RIGHT
        elseif key == Canvas.LEFT then
            return commonPhoneStrings.LEFT
        elseif key == Canvas.FIRE then
            return commonPhoneStrings.FIRE
        end
        return "UNKNOWN KEY"
end

return CanvasUtil

