-- Generated Code Do Not Modify
-- package org.allbinary.game.displayable.canvas

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BaseGameStatistics = require("org.allbinary.canvas.BaseGameStatistics")
local GameStatisticsFactory = require("org.allbinary.canvas.GameStatisticsFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--HTMLForJ2ME
local NullDisplayable = {}
NullDisplayable.__index = NullDisplayable
NullDisplayable.className = "NullDisplayable"
setmetatable(NullDisplayable, {__index = Canvas})

function NullDisplayable:_init_fields()
    self.baseGameStatistics = GameStatisticsFactory.getInstance()
end


function NullDisplayable.getInstance()
        return NullDisplayable.SINGLETON
end


function NullDisplayable.new()
    local self = setmetatable(Canvas.new(), NullDisplayable)
    self:_init_fields()
    return self
end


function NullDisplayable:paint(graphics)
        self.baseGameStatistics:nextRefresh()
end

NullDisplayable.SINGLETON = NullDisplayable.new()

return NullDisplayable

