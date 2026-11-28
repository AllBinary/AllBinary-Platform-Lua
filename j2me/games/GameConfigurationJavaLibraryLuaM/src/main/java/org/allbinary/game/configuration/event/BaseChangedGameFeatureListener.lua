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
-- package org.allbinary.game.configuration.event

local BaseChangedGameFeatureListener = {}
package.loaded["org.allbinary.game.configuration.event.BaseChangedGameFeatureListener"] = BaseChangedGameFeatureListener

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Feature = java_lazy("org.allbinary.game.configuration.feature.Feature")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureUtil = java_lazy("org.allbinary.game.configuration.feature.GameFeatureUtil")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local GameFeatureListenerInterface = require("org.allbinary.game.configuration.event.GameFeatureListenerInterface")
local GameFeatureEvent = java_lazy("org.allbinary.game.configuration.event.GameFeatureEvent")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BaseChangedGameFeatureListener is declared before the requires
BaseChangedGameFeatureListener.__index = BaseChangedGameFeatureListener
BaseChangedGameFeatureListener.className = "BaseChangedGameFeatureListener"
BaseChangedGameFeatureListener.javaClassName = "org.allbinary.game.configuration.event.BaseChangedGameFeatureListener"
BaseChangedGameFeatureListener.java_implements = " GameFeatureListenerInterface "
BaseChangedGameFeatureListener.java_interfaces = function() return {GameFeatureListenerInterface} end

function BaseChangedGameFeatureListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameFeatureUtil = GameFeatureUtil.getInstance()
    self.list = BasicArrayListD.new()
    self.changed = true
end

function BaseChangedGameFeatureListener._jinit(self)
    BaseChangedGameFeatureListener._init_fields(self)
    return self
end

function BaseChangedGameFeatureListener.new()
    return BaseChangedGameFeatureListener._jinit(setmetatable({}, BaseChangedGameFeatureListener))
end


function BaseChangedGameFeatureListener:onEvent(eventObject)
        ForcedLogUtil.log(CommonStrings.getInstance().NOT_IMPLEMENTED, self)
end


function BaseChangedGameFeatureListener:onGameFeatureChange(gameFeatureEvent)
        self.logUtil:putF(tostring(StringMaker.new():append(self.gameFeatureUtil.GAME_FEATURE_CHANGED):append(gameFeatureEvent:getWhatChanged())), self, self.gameFeatureUtil.ON_GAME_FEATURE_CHANGE)
        self.list:add(gameFeatureEvent:getGameOption())
        self:setChanged(true)
end


function BaseChangedGameFeatureListener:add(gameFeature)
        self.list:add(gameFeature)
end


function BaseChangedGameFeatureListener:remove(gameFeature)
        self.list:remove(gameFeature)
end


function BaseChangedGameFeatureListener:setChanged(initialized)
        self.changed = initialized
        if not (self:isChanged()) then
            self.list:clear()
        end
end


function BaseChangedGameFeatureListener:isChangedFeature(gameFeature)
        local isChanged = self.list:contains(gameFeature)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("GameFeature: ")
        stringBuffer:append(StringUtil.getInstance():toString(gameFeature))
        stringBuffer:append(" isFeature: ")
        stringBuffer:appendboolean(Features.getInstance():isFeature(gameFeature))
        stringBuffer:append(" isChanged: ")
        stringBuffer:appendboolean(isChanged)
        self.logUtil:putF(tostring(stringBuffer), self, "isChanged")
        return isChanged
end


function BaseChangedGameFeatureListener:isChanged()
        return self.changed
end

return BaseChangedGameFeatureListener

