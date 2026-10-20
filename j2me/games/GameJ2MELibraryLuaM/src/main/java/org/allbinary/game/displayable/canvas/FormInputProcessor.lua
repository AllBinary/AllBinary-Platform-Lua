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
local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local InputProcessor = require("org.allbinary.game.input.InputProcessor")
local PlatformKeyFactory = require("org.allbinary.game.input.PlatformKeyFactory")
local DownKeyEventHandler = require("org.allbinary.game.input.event.DownKeyEventHandler")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local UpGameKeyEventHandler = require("org.allbinary.game.input.event.UpGameKeyEventHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local FormInputProcessor = {}
FormInputProcessor.__index = FormInputProcessor
FormInputProcessor.className = "FormInputProcessor"
setmetatable(FormInputProcessor, {__index = InputProcessor})

function FormInputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.downKeyEventHandler = DownKeyEventHandler.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.inputFactory = InputFactory.getInstance()
    self.platformKeyFactory = PlatformKeyFactory.getInstance()
    self.allBinaryGameCanvas = nil
end


function FormInputProcessor.new(allBinaryGameCanvas)
    local self = setmetatable(InputProcessor.new(), FormInputProcessor)
    self:_init_fields()
        self.allBinaryGameCanvas = allBinaryGameCanvas
    return self
end


function FormInputProcessor:keyPressedByDevice(keyCode, deviceId)
        local try_ok, try_error = pcall(function()
            PreLogUtil.put(tostring(StringMaker.new():append(self.inputFactory.KEY_CODE_LABEL):appendint(keyCode):append(CommonSeps.getInstance().SPACE):append(self.inputFactory.DEVICE_ID_LABEL):appendint(deviceId)), self, self.gameInputStrings.KEY_PRESSED)
            local input = self.inputFactory:getInstanceById(keyCode)
            local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self.allBinaryGameCanvas, input)
            self.downKeyEventHandler:fireEventForGameKeyEvent(gameKeyEvent)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end


function FormInputProcessor:keyReleasedByDevice(canvas, keyCode, deviceId)
        local try_ok, try_error = pcall(function()
            local input = self.inputFactory:getInstanceById(keyCode)
            if self.platformKeyFactory:isEnter(input) then
                PreLogUtil.put(tostring(StringMaker.new():append(self.inputFactory.KEY_CODE_LABEL):appendint(keyCode):append(CommonSeps.getInstance().SPACE):append(self.inputFactory.DEVICE_ID_LABEL):appendint(deviceId)), self, self.gameInputStrings.KEY_RELEASED)
                local gameKey = GameKeyFactory.getInstance().KEY_NUM0
                local gameKeyEventSourceInterface = canvas
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(gameKeyEventSourceInterface, gameKey)
                self.upGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end

return FormInputProcessor

