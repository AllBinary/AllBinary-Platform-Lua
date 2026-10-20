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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OverlayPaintable = {}
OverlayPaintable.__index = OverlayPaintable
OverlayPaintable.className = "OverlayPaintable"
setmetatable(OverlayPaintable, {__index = InitUpdatePaintable})

function OverlayPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OverlayPaintable.new()
    local self = setmetatable(InitUpdatePaintable.new(), OverlayPaintable)
    self:_init_fields()
    return self
end


function OverlayPaintable:update()
        local try_ok, try_error = pcall(function()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.UPDATE, e)
        end
end


function OverlayPaintable:paint(graphics)
end

return OverlayPaintable

