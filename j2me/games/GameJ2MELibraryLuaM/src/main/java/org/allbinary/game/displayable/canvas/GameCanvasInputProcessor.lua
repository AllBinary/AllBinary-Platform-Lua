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
local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local InputProcessor = require("org.allbinary.game.input.InputProcessor")
local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local DownGameKeyEventHandler = require("org.allbinary.game.input.event.DownGameKeyEventHandler")
local DownKeyEventHandler = require("org.allbinary.game.input.event.DownKeyEventHandler")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local UpGameKeyEventHandler = require("org.allbinary.game.input.event.UpGameKeyEventHandler")
local InputToGameKeyMapping = require("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameCanvasInputProcessor = {}
GameCanvasInputProcessor.__index = GameCanvasInputProcessor
GameCanvasInputProcessor.className = "GameCanvasInputProcessor"
setmetatable(GameCanvasInputProcessor, {__index = InputProcessor})

function GameCanvasInputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.allBinaryGameCanvas = nil
    self.downGameKeyEventHandler = DownGameKeyEventHandler.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.downKeyEventHandler = DownKeyEventHandler.getInstance()
    self.smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
    self.inputToGameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()
    self.NONE = GameKeyFactory.getInstance().NONE
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
end


function GameCanvasInputProcessor.new(allBinaryGameCanvas)
    local self = setmetatable(InputProcessor.new(), GameCanvasInputProcessor)
    self:_init_fields()
        self.allBinaryGameCanvas = allBinaryGameCanvas
        self.inputToGameKeyMapping:init(self.allBinaryGameCanvas)
    return self
end


function GameCanvasInputProcessor:keyPressedByDevice(keyCode, deviceId)
        local try_ok, try_error = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self.allBinaryGameCanvas, keyCode)
            if gameKey ~= self.NONE then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self.allBinaryGameCanvas, gameKey)
                self.downGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.downGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.ADD_KEY_EVENT)
            end
            local keyCodeAsInteger = self.smallIntegerSingletonFactory:getAtNoThrow(keyCode)
            self.downKeyEventHandler:fireEventI(keyCodeAsInteger)
            self.downKeyEventHandler:getInstanceForDevice(deviceId):fireEventI(keyCodeAsInteger)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end


function GameCanvasInputProcessor:keyReleasedByDevice(canvas, keyCode, deviceId)
        self:removeGameKeyEvent(canvas, keyCode, deviceId, false)
end


function GameCanvasInputProcessor:removeGameKeyEvent(canvas, keyCode, deviceId, repeated)
        local try_ok, try_error = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(canvas, keyCode)
            if gameKey ~= self.NONE then
                local gameKeyEventSourceInterface = canvas
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(gameKeyEventSourceInterface, gameKey)
                self.upGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.REMOVE_KEY_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.REMOVE_KEY_EVENT, e)
        end
end

return GameCanvasInputProcessor

