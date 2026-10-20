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

-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GameInputStrings = require("org.allbinary.game.input.GameInputStrings")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicMenuInputProcessor = require("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoCanvasBasicStartInputProcessor = {}
DemoCanvasBasicStartInputProcessor.__index = DemoCanvasBasicStartInputProcessor
DemoCanvasBasicStartInputProcessor.className = "DemoCanvasBasicStartInputProcessor"
setmetatable(DemoCanvasBasicStartInputProcessor, {__index = BasicMenuInputProcessor})


function DemoCanvasBasicStartInputProcessor.new(gameKeyEventList, gameCanvas)
    local self = setmetatable(BasicMenuInputProcessor.new(gameKeyEventList, -1, gameCanvas), DemoCanvasBasicStartInputProcessor)
        -- super(...) made self above
    return self
end


-- throws Exception
function DemoCanvasBasicStartInputProcessor:processInputList()
        local list = self:getGameKeyEventList()
        local size = list:size()
        local gameKeyEvent = nil
        for index = 0, size - 1 do
            gameKeyEvent = list.objectArray[index + 1]
            self.logUtil:putF(tostring(StringMaker.new():append("Start GameKey: "):append(StringUtil.getInstance():toString(gameKeyEvent))), self, GameInputStrings.getInstance().PROCESS_INPUT)
        end
        self:getCanvas():getCustomCommandListener():commandAction(GameCommandsFactory.getInstance().START_COMMAND, NullCanvas.NULL_CANVAS)
        return size
end

return DemoCanvasBasicStartInputProcessor

