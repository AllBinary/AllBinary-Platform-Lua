--
-- AllBinary Open License Version 1
-- Copyright (c) 2026 AllBinary
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

local Processor = require("org.allbinary.canvas.Processor")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
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

local InitGameProcessor = {}
InitGameProcessor.__index = InitGameProcessor
InitGameProcessor.className = "InitGameProcessor"
setmetatable(InitGameProcessor, {__index = Processor})

function InitGameProcessor:_init_fields()
    self.gameCanvas = nil
end


function InitGameProcessor.new(gameCanvas)
    local self = setmetatable(Processor.new(), InitGameProcessor)
    self:_init_fields()
        self.gameCanvas = gameCanvas
    return self
end


-- throws Exception
function InitGameProcessor:process()
        if ProgressCanvasFactory.getInstance():isInGame() then
            self.gameCanvas:setProcessGameProcessorInit()
        end
end

return InitGameProcessor

