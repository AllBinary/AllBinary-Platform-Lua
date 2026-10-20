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
-- package org.allbinary.game.ag.layer.hud.basic

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameAdStateFactory = require("org.allbinary.business.advertisement.GameAdStateFactory")
local Processor = require("org.allbinary.canvas.Processor")
local GameAdState = require("org.allbinary.game.GameAdState")
local GameNotification = require("org.allbinary.game.ag.layer.hud.basic.notification.GameNotification")
local GameNotificationHud = require("org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CustomGPoint = require("org.allbinary.graphics.CustomGPoint")
local GPoint = require("org.allbinary.graphics.GPoint")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerGameNotificationHud = {}
PlayerGameNotificationHud.__index = PlayerGameNotificationHud
PlayerGameNotificationHud.className = "PlayerGameNotificationHud"
setmetatable(PlayerGameNotificationHud, {__index = GameNotificationHud})
local SetAndRemoveProcessor = {}
    SetAndRemoveProcessor.__index = SetAndRemoveProcessor
    SetAndRemoveProcessor.className = "SetAndRemoveProcessor"
    setmetatable(SetAndRemoveProcessor, {__index = Processor})
    PlayerGameNotificationHud.SetAndRemoveProcessor = SetAndRemoveProcessor

    function SetAndRemoveProcessor:_init_fields()
        self.updateMeasurementProcessor = nil
    end
    

    function PlayerGameNotificationHud.new(updateMeasurementProcessor)
        local self = setmetatable(Processor.new(), PlayerGameNotificationHud)
        self:_init_fields()
            self.updateMeasurementProcessor = updateMeasurementProcessor
        return self
    end
    

    -- throws Exception
    function PlayerGameNotificationHud:process()
            self.updateMeasurementProcessor:setAndRemoveProcess()
    end

local NextUnremoveableProcessor = {}
    NextUnremoveableProcessor.__index = NextUnremoveableProcessor
    NextUnremoveableProcessor.className = "NextUnremoveableProcessor"
    setmetatable(NextUnremoveableProcessor, {__index = Processor})
    PlayerGameNotificationHud.NextUnremoveableProcessor = NextUnremoveableProcessor

    function NextUnremoveableProcessor:_init_fields()
        self.updateMeasurementProcessor = nil
    end
    

    function PlayerGameNotificationHud.new(updateMeasurementProcessor)
        local self = setmetatable(Processor.new(), PlayerGameNotificationHud)
        self:_init_fields()
            self.updateMeasurementProcessor = updateMeasurementProcessor
        return self
    end
    

    -- throws Exception
    function PlayerGameNotificationHud:process()
            self.updateMeasurementProcessor:setNextUnremoveableProcess()
    end


function PlayerGameNotificationHud:_init_fields()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(0)
    self.circularIndexUtil = nil
    self.gameNotification = GameNotification.new()
    self.permanentGameNotification = GameNotification.new()
    self.setAndRemoveProcessor = SetAndRemoveProcessor.new(self)
    self.nextUnremoveableProcessor = NextUnremoveableProcessor.new(self)
    self.processor = Processor.getInstance()
    self.PERMANENT_GAME_NOTIFICATION = "Permanent Game Notification: "
    self.lastString = StringUtil.getInstance().EMPTY_STRING
    self.string = self.EMPTY_STRING
    self.point = CustomGPoint.NULL_CUSTOM_POINT
    self.width = 0
end


function PlayerGameNotificationHud.new(location, direction, bufferZone, basicColor)
    local self = setmetatable(GameNotificationHud.new(location, direction, bufferZone, basicColor), PlayerGameNotificationHud)
    self:_init_fields()
        -- super(...) made self above
        self.circularIndexUtil = CircularIndexUtil.createInstance(0)
        local gameNotificationEventHandler = GameNotificationEventHandler.getInstance()
        gameNotificationEventHandler:removeAllListeners()
        gameNotificationEventHandler:addListenerInterface(self)
    return self
end


function PlayerGameNotificationHud:updateMeasurement(graphics)
        local try_ok, try_error = pcall(function()
            GameNotificationHud.updateMeasurement(self, graphics)
            local font = graphics:getFont()
            self.width = font:stringWidth(self.string)
            self.processor:process()
            self.processor = Processor.getInstance()
        end)
        if not try_ok then
            local e = try_error
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, commonStrings.UPDATE, e)
        end
end


function PlayerGameNotificationHud:getPoint(x, y)
        self.point = CustomGPoint.getInstance3(0, 0)
        self.point:setX(x)
        self.point:setY(y)
        return self.point
end


function PlayerGameNotificationHud:add(string, seconds, basicColor, permanent)
        if permanent then
            if self.lastString ~= string then
                self.lastString = string
                self.logUtil:putF(tostring(StringMaker.new():append(self.PERMANENT_GAME_NOTIFICATION):append(string)), self, self.commonStrings.ADD)
            end
            self.permanentGameNotification:add(string, seconds, basicColor)
            self.circularIndexUtil:setSize(self.permanentGameNotification:getSize())
        else
            self.gameNotification:add(string, seconds, basicColor)
        end
end


-- throws Exception
function PlayerGameNotificationHud:processTick()
        if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            local gameAdState = GameAdStateFactory.getInstance():getCurrentInstance()
            if gameAdState:isShowingAtLocation(self:getLocation()) then
                self.offsetY = -54
            else
                self.offsetY = 0
            end
            if self.gameNotification:getSize() > 0 then
                self:setAndRemove()
            elseif self.permanentGameNotification:getSize() > 0 then
                self:setNextUnremoveable()
            else
                self.string = self.EMPTY_STRING
            end
        end
end


-- throws Exception
function PlayerGameNotificationHud:setAndRemove()
        self.string = self.gameNotification.stringList:removeAt(0)
        self.processor = self.setAndRemoveProcessor
end


-- throws Exception
function PlayerGameNotificationHud:setAndRemoveProcess()
        self:setX((((self.displayInfo:getLastWidth() - self.width)) // (1 << (1))))
        self.point:setX(self:getX())
        self.point:setY(self:getY())
        local time = self.gameNotification.timeList:removeAt(0)
        local iTime = math.tointeger(time // 1) * 1000
        if iTime == 0 then
            iTime = 500
        end
        self.timeDelayHelper.delay = iTime
        self:setBasicColorP(self.gameNotification.colorList:removeAt(0))
end


-- throws Exception
function PlayerGameNotificationHud:setNextUnremoveable()
        local index = self.circularIndexUtil:getIndex()
        self.string = self.permanentGameNotification.stringList.objectArray[index + 1]
        self.processor = self.nextUnremoveableProcessor
end


-- throws Exception
function PlayerGameNotificationHud:setNextUnremoveableProcess()
        local index = self.circularIndexUtil:getIndex()
        self:setX((((self.displayInfo:getLastWidth() - self.width)) // (1 << (1))))
        self.point:setX(self:getX())
        self.point:setY(self:getY())
        local time = self.permanentGameNotification.timeList.objectArray[index + 1]
        self.timeDelayHelper.delay = math.tointeger(time // 1) * 1000
        self:setBasicColorP(self.permanentGameNotification.colorList.objectArray[index + 1])
        self.circularIndexUtil:next()
end


function PlayerGameNotificationHud:clear()
        self.gameNotification:clear()
        self.permanentGameNotification:clear()
end


function PlayerGameNotificationHud:paint(graphics)
        self.myFontProcessor:process(graphics)
        GameNotificationHud.paintString(self, graphics, self.string)
end

return PlayerGameNotificationHud

