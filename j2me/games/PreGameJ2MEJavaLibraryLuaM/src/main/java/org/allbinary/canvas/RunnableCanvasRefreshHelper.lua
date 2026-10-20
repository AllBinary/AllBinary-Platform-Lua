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
-- package org.allbinary.canvas

local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local Processor = require("org.allbinary.canvas.Processor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RunnableCanvasRefreshHelper = {}
RunnableCanvasRefreshHelper.__index = RunnableCanvasRefreshHelper
RunnableCanvasRefreshHelper.className = "RunnableCanvasRefreshHelper"
setmetatable(RunnableCanvasRefreshHelper, {__index = Processor})

function RunnableCanvasRefreshHelper:_init_fields()
    self.runnableCanvas = nil
end


function RunnableCanvasRefreshHelper.new(runnableCanvas)
    local self = setmetatable(Processor.new(), RunnableCanvasRefreshHelper)
    self:_init_fields()
        self.runnableCanvas = runnableCanvas
    return self
end


function RunnableCanvasRefreshHelper:process()
        self.runnableCanvas:repaint()
end

return RunnableCanvasRefreshHelper

