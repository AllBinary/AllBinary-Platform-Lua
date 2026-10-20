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

local Processor = require("org.allbinary.canvas.Processor")
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

local StartIntermissionProcessor = {}
StartIntermissionProcessor.__index = StartIntermissionProcessor
StartIntermissionProcessor.className = "StartIntermissionProcessor"
setmetatable(StartIntermissionProcessor, {__index = Processor})

function StartIntermissionProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameCanvas = nil
    self.WAIT = 5000
end


function StartIntermissionProcessor.new(gameCanvas)
    local self = setmetatable(Processor.new(), StartIntermissionProcessor)
    self:_init_fields()
        self.gameCanvas = gameCanvas
    return self
end


-- throws Exception
function StartIntermissionProcessor:process()
        if self.gameCanvas:getStartIntermissionInterface():getTimeDelayHelper():isElapsedTNT(self.WAIT) then
            self.logUtil:putF("Intermission End", self, self.commonStrings.PROCESS)
            self.gameCanvas:getStartIntermissionInterface():setEnabled(false)
        end
end

return StartIntermissionProcessor

