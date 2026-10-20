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
-- package org.allbinary.game.configuration.feature

local GameFeatureEvent = require("org.allbinary.game.configuration.event.GameFeatureEvent")
local GameFeatureEventHandler = require("org.allbinary.game.configuration.event.GameFeatureEventHandler")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Features = {}
Features.__index = Features
Features.className = "Features"

function Features:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.list = nil
    self.defaultList = nil
end


function Features.getInstance()
        if Features.SINGLETON == NullUtil.getInstance().NULL_OBJECT then
            Features.SINGLETON = Features.new()
        end
        return Features.SINGLETON
end


function Features.new()
    local self = setmetatable({}, Features)
    self:_init_fields()
        self.list = BasicArrayListD.new()
        self.defaultList = BasicArrayListD.new()
        self:init()
    return self
end


-- throws Exception
function Features:addDefault(gameFeature)
        self:add(gameFeature)
        if not self.defaultList:contains(gameFeature) then
            self.defaultList:add(gameFeature)
        end
end


-- throws Exception
function Features:add(gameFeature)
        if not self.list:contains(gameFeature) then
            self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(tostring(gameFeature))), self, self.commonStrings.ADD)
            self.list:add(gameFeature)
            GameFeatureEventHandler.getInstance():fireEvent(GameFeatureEvent.new(gameFeature, tostring(gameFeature)))
        end
end


-- throws Exception
function Features:removeDefault(gameFeature)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(tostring(gameFeature))), self, "removeDefault")
        self:remove(gameFeature)
        self.defaultList:remove(gameFeature)
end


-- throws Exception
function Features:remove(gameFeature)
        if self.list:contains(gameFeature) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.REMOVE)
            self.list:remove(gameFeature)
            GameFeatureEventHandler.getInstance():fireEvent(GameFeatureEvent.new(gameFeature, tostring(gameFeature)))
        end
end


function Features:init()
        local try_ok, try_error = pcall(function()
            local gameFeatureFactory = GameFeatureFactory.getInstance()
            local inputFeatureFactory = InputFeatureFactory.getInstance()
            local sensorFeatureFactory = SensorFeatureFactory.getInstance()
            local touchFeatureFactory = TouchFeatureFactory.getInstance()
            self:addDefault(gameFeatureFactory.ARTIFICIAL_INTELLEGENCE_PROCESSOR)
            self:addDefault(gameFeatureFactory.COLLIDABLE_INTERFACE_LAYER_PROCESSOR)
            self:addDefault(gameFeatureFactory.GAME_INPUT_LAYER_PROCESSOR)
            self:addDefault(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR)
            self:addDefault(inputFeatureFactory.MULTI_KEY_PRESS)
            self:addDefault(inputFeatureFactory.REMOVE_DUPLICATE_KEY_PRESSES)
            self:addDefault(gameFeatureFactory.SCREEN_SHAKE)
            self:addDefault(gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)
            local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
            if operatingSystemInterface:isOverScan() then
                self:addDefault(sensorFeatureFactory.NO_ORIENTATION)
                self:addDefault(touchFeatureFactory.HIDE_SCREEN_BUTTONS)
            else
                self:addDefault(sensorFeatureFactory.ORIENTATION_SENSORS)
                self:addDefault(touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS)
            end
            self:addDefault(touchFeatureFactory.TOUCH_ENABLED)
            self:addDefault(MainFeatureFactory.getInstance().FULL_SCREEN)
            self:addDefault(MainFeatureFactory.getInstance().LOAD_ONDEMAND)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end


function Features:isDefault(gameFeature)
        return self.defaultList:contains(gameFeature)
end


function Features:isFeature(gameFeature)
        return self.list:contains(gameFeature)
end


-- throws Exception
function Features:toggle(gameFeature)
        if self:isFeature(gameFeature) then
            self:remove(gameFeature)
        else
            self:add(gameFeature)
        end
end

Features.SINGLETON = NullUtil.getInstance().NULL_OBJECT

return Features

