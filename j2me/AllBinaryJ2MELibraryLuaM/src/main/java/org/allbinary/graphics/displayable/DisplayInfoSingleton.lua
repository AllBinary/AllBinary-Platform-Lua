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
-- package org.allbinary.graphics.displayable

-- local Displayable = require("javax.microedition.lcdui.Displayable")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = require("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local LastDisplayChangeEventHandler = require("org.allbinary.graphics.displayable.event.LastDisplayChangeEventHandler")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local SWTJOGLProcessor = require("org.allbinary.graphics.threed.SWTJOGLProcessor")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DisplayInfoSingleton = {}
DisplayInfoSingleton.__index = DisplayInfoSingleton
DisplayInfoSingleton.className = "DisplayInfoSingleton"

function DisplayInfoSingleton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonLabels = CommonLabels.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.ORIENTATION = "ORIENTATION"
    self.ADJUSTING_FOR_SCALING_IN_PORTRAIT = "Adjusting for Scaling in portrait display ratio: "
    self.ADJUSTING_FOR_SCALING_IN_LANDSCAPE = "Adjusting for Scaling in landscape display ratio: "
    self.last = java_new_array(0, 4)
    self.lastHalf = java_new_array(0, 4)
    self.full = java_new_array(0, 4)
    self.top = 0
    self.left = 0
    self.xOffset = 0
    self.yOffset = 0
    self.scaleLargestTo = 0.0
    self.WIDTH = 0
    self.HEIGHT = 1
    self.CUSTOM_WIDTH = 2
    self.CUSTOM_HEIGHT = 3
    self.scalableListener = BaseScalable.new()
    self.displayRatio = 0.0
    self.ratio = 1.0
    self.SET_LAST_SIZE_METHOD_NAME = "setLastSize"
    self.FULL_WIDTH = " FullWidth: "
    self.FULL_HEIGHT = " FullHeight: "
    self.LAST_WIDTH = "LastWidth: "
    self.LAST_HEIGHT = " LastHeight: "
    self.PORTRAIT = "Portrait"
    self.LANDSCAPE = "Landscape"
    self.displayChangeEvent = DisplayChangeEvent.new(self)
    self.FIRE_METHOD_NAME = "fire"
    self.REASON = "reason: "
    self.UPDATE_FROM_ORIENTATION_CHANGE = "Updating from Orientation Change "
    self.list = BasicArrayListD.new()
    self.DISPLAY_INFO = "Display Info: "
    self.FULL = "full"
    self.LAST = "last"
    self.LAST_HALF = "lastHalf"
end


function DisplayInfoSingleton.getInstance()
        return DisplayInfoSingleton.SINGLETON
end


function DisplayInfoSingleton.new()
    local self = setmetatable({}, DisplayInfoSingleton)
    self:_init_fields()
        local size = (self.last.n or #self.last)
        for index = 0, size - 1 do
            self.last[index + 1] = 0
            self.lastHalf[index + 1] = 0
            self.full[index + 1] = 0
        end
        if AndroidUtil.isAndroid() then
            self.scaleLargestTo = 640.0
        else
            self.scaleLargestTo = 1080.0
        end
    return self
end


function DisplayInfoSingleton:getLastHalf()
        return self.lastHalf
end


function DisplayInfoSingleton:getLast()
        return self.last
end


function DisplayInfoSingleton:getFull()
        return self.full
end


function DisplayInfoSingleton:getScaleLargestTo()
        return self.scaleLargestTo
end


function DisplayInfoSingleton:setScaleLargestTo(scaleLargestTo)
        self.scaleLargestTo = (scaleLargestTo + 0.0)
end


function DisplayInfoSingleton:setLastSize(aLastWidth, aLastHeight, reason)
        if self.full[self.WIDTH + 1] ~= aLastWidth or self.full[self.HEIGHT + 1] ~= aLastHeight then
            self:setLastSizeForce(aLastWidth, aLastHeight, reason)
        end
end


function DisplayInfoSingleton:setLastSizeForce(aLastWidth, aLastHeight, reason)
        local stringMaker = StringMaker.new()
        self.logUtil:putF(tostring(stringMaker:append(CommonLabels.getInstance().START_LABEL):append(reason)), self, self.SET_LAST_SIZE_METHOD_NAME)
        local aFullWidth = aLastWidth
        local aFullHeight = aLastHeight
        stringMaker:delete(0, stringMaker:length())
        self.logUtil:putF(tostring(stringMaker:append(self.FULL_WIDTH):appendint(aFullWidth):append(self.FULL_HEIGHT):appendint(aFullHeight):append(tostring(self))), self, self.SET_LAST_SIZE_METHOD_NAME)
        local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
        if operatingSystemInterface:isOverScan() then
            aLastWidth = aLastWidth * operatingSystemInterface:getOverScanXPercent() / 100
            aLastHeight = aLastHeight * operatingSystemInterface:getOverScanYPercent() / 100
        end
        if operatingSystemInterface:isScalable() then
            if self:isPortraitWH(aLastWidth, aLastHeight) then
                if (aLastHeight + 0.0) > self.scaleLargestTo then
                    self.displayRatio = self.scaleLargestTo / (aLastHeight + 0.0)
                    self.ratio = (aLastHeight + 0.0) / self.scaleLargestTo
                    stringMaker:delete(0, stringMaker:length())
                    self.logUtil:putF(tostring(stringMaker:append(self.ADJUSTING_FOR_SCALING_IN_PORTRAIT):appendfloat(self.displayRatio)), self, self.SET_LAST_SIZE_METHOD_NAME)
                    aLastWidth = java_int(((aLastWidth + 0.0) * self.displayRatio))
                    aLastHeight = java_int(((aLastHeight + 0.0) * self.displayRatio))
                    self.scalableListener:scale(self.ratio)
                else
                    self.ratio = 1.0
                    self.scalableListener:scale(self.ratio)
                end
            else
                if (aLastWidth + 0.0) > self.scaleLargestTo then
                    self.displayRatio = self.scaleLargestTo / (aLastWidth + 0.0)
                    self.ratio = (aLastWidth + 0.0) / self.scaleLargestTo
                    stringMaker:delete(0, stringMaker:length())
                    self.logUtil:putF(tostring(stringMaker:append(self.ADJUSTING_FOR_SCALING_IN_LANDSCAPE):appendfloat(self.displayRatio)), self, self.SET_LAST_SIZE_METHOD_NAME)
                    aLastWidth = java_int(((aLastWidth + 0.0) * self.displayRatio))
                    aLastHeight = java_int(((aLastHeight + 0.0) * self.displayRatio))
                    self.scalableListener:scale(self.ratio)
                else
                    self.ratio = 1.0
                    self.scalableListener:scale(self.ratio)
                end
            end
        end
        stringMaker:delete(0, stringMaker:length())
        self.logUtil:putF(tostring(stringMaker:append(self.LAST_WIDTH):appendint(aLastWidth):append(self.LAST_HEIGHT):appendint(aLastHeight)), self, self.SET_LAST_SIZE_METHOD_NAME)
        self.xOffset = aFullWidth - aLastWidth
        self.yOffset = aFullHeight - aLastHeight
        self.left = self.scalableListener:getLeft(self.xOffset)
        self.top = self.scalableListener:getTop(self.yOffset)
        self.full[self.WIDTH + 1] = aFullWidth
        self.full[self.HEIGHT + 1] = aFullHeight
        self.last[self.WIDTH + 1] = aLastWidth
        self.lastHalf[self.WIDTH + 1] = (((self.last[self.WIDTH + 1]) // (1 << (1))))
        self.last[self.HEIGHT + 1] = aLastHeight
        self.lastHalf[self.HEIGHT + 1] = (((self.last[self.HEIGHT + 1]) // (1 << (1))))
        SWTJOGLProcessor.getInstance():setCustom(aLastWidth, aLastHeight, self.ratio)
        self:add(self.SET_LAST_SIZE_METHOD_NAME)
end


function DisplayInfoSingleton:isPortraitWH(lastWidth, lastHeight)
        if lastHeight > lastWidth then
            return true
        else
            return false
        end
end


function DisplayInfoSingleton:isPortrait()
        return self:isPortraitWH(self.last[self.WIDTH + 1], self.last[self.HEIGHT + 1])
end


function DisplayInfoSingleton:add(reason)
        local stringMaker = StringMaker.new()
        self.logUtil:putF(tostring(stringMaker:append(self.REASON):append(reason)), self, self.FIRE_METHOD_NAME)
        stringMaker:delete(0, stringMaker:length())
        self.logUtil:putF(self:toStringAppend(stringMaker), self, self.FIRE_METHOD_NAME)
        self.list:add(reason)
end


function DisplayInfoSingleton:process()
        local try_ok, try_error = pcall(function()
            if self.list:size() > 0 then
                self:processForced()
            end
            self.list:clear()
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.FIRE_METHOD_NAME, e)
        end
end


function DisplayInfoSingleton:processForced()
        local try_ok, try_error = pcall(function()
            local swtJOGLProcessor = SWTJOGLProcessor.getInstance()
            swtJOGLProcessor:clear()
            DisplayChangeEventHandler.getInstance():fireEvent(self.displayChangeEvent)
            LastDisplayChangeEventHandler.getInstance():fireEvent(self.displayChangeEvent)
            swtJOGLProcessor:onSurfaceChanged()
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.FIRE_METHOD_NAME, e)
        end
end


function DisplayInfoSingleton:update(displayable, reason)
        local aLastWidth = displayable:getWidth()
        local aLastHeight = displayable:getHeight()
        local aFullWidth = aLastWidth
        local aFullHeight = aLastHeight
        local stringMaker = StringMaker.new()
        self.logUtil:putF(tostring(stringMaker:append(CommonLabels.getInstance().START_LABEL):append(reason):append(self.LAST_WIDTH):appendint(aLastWidth):append(self.LAST_HEIGHT):appendint(aLastHeight):append(self.commonSeps.SPACE):append(tostring(self))), self, self.commonStrings.UPDATE)
        if aLastWidth > 0 and aLastHeight > 0 then
            local features = Features.getInstance()
            local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
            if not features:isDefault(openGLFeatureFactory.OPENGL) or self.last[self.WIDTH + 1] ~= aLastWidth or self.last[self.HEIGHT + 1] ~= aLastHeight then
                stringMaker:delete(0, stringMaker:length())
                self.logUtil:putF(tostring(stringMaker:append(self.UPDATE_FROM_ORIENTATION_CHANGE)), self, self.commonStrings.UPDATE)
                local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
                if operatingSystemInterface:isOverScan() then
                    aLastWidth = aLastWidth * operatingSystemInterface:getOverScanXPercent() / 100
                    aLastHeight = aLastHeight * operatingSystemInterface:getOverScanYPercent() / 100
                end
                if operatingSystemInterface:isScalable() then
                    if self:isPortraitWH(aLastWidth, aLastHeight) then
                        if (aLastHeight + 0.0) > self.scaleLargestTo then
                            self.displayRatio = self.scaleLargestTo / (aLastHeight + 0.0)
                            self.ratio = (aLastHeight + 0.0) / self.scaleLargestTo
                            stringMaker:delete(0, stringMaker:length())
                            self.logUtil:putF(tostring(stringMaker:append(self.ADJUSTING_FOR_SCALING_IN_PORTRAIT):appendfloat(self.displayRatio)), self, self.commonStrings.UPDATE)
                            aLastWidth = java_int(((aLastWidth + 0.0) * self.displayRatio))
                            aLastHeight = java_int(((aLastHeight + 0.0) * self.displayRatio))
                            self.scalableListener:scale(self.ratio)
                        else
                            self.ratio = 1.0
                            self.scalableListener:scale(self.ratio)
                        end
                    else
                        if (aLastWidth + 0.0) > self.scaleLargestTo then
                            self.displayRatio = self.scaleLargestTo / (aLastWidth + 0.0)
                            self.ratio = (aLastWidth + 0.0) / self.scaleLargestTo
                            stringMaker:delete(0, stringMaker:length())
                            self.logUtil:putF(tostring(stringMaker:append(self.ADJUSTING_FOR_SCALING_IN_LANDSCAPE):appendfloat(self.displayRatio)), self, self.commonStrings.UPDATE)
                            aLastWidth = java_int(((aLastWidth + 0.0) * self.displayRatio))
                            aLastHeight = java_int(((aLastHeight + 0.0) * self.displayRatio))
                            self.scalableListener:scale(self.ratio)
                        else
                            self.ratio = 1.0
                            self.scalableListener:scale(self.ratio)
                        end
                    end
                end
                stringMaker:delete(0, stringMaker:length())
                self.logUtil:putF(tostring(stringMaker:append(self.UPDATE_FROM_ORIENTATION_CHANGE):append(self.LAST_WIDTH):appendint(aLastWidth):append(self.LAST_HEIGHT):appendint(aLastHeight)), self, self.commonStrings.UPDATE)
                self.xOffset = aFullWidth - aLastWidth
                self.yOffset = aFullHeight - aLastHeight
                self.left = self.scalableListener:getLeft(self.xOffset)
                self.top = self.scalableListener:getTop(self.yOffset)
                self.full[self.WIDTH + 1] = aFullWidth
                self.full[self.HEIGHT + 1] = aFullHeight
                self.last[self.WIDTH + 1] = aLastWidth
                self.lastHalf[self.WIDTH + 1] = (((self.last[self.WIDTH + 1]) // (1 << (1))))
                self.last[self.HEIGHT + 1] = aLastHeight
                self.lastHalf[self.HEIGHT + 1] = (((self.last[self.HEIGHT + 1]) // (1 << (1))))
                SWTJOGLProcessor.getInstance():setCustom(aLastWidth, aLastHeight, self.ratio)
                self:add(self.commonStrings.UPDATE)
            end
        end
end


function DisplayInfoSingleton:toString()
        local stringBuffer = StringMaker.new()
        return self:toStringAppend(stringBuffer)
end
DisplayInfoSingleton.__tostring = function(self) return self:toString() end


function DisplayInfoSingleton:toStringAppend(stringBuffer)
        stringBuffer:append(self.DISPLAY_INFO)
        stringBuffer:append(self.FULL)
        stringBuffer:append(self.commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self.full[self.WIDTH + 1])
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.FULL)
        stringBuffer:append(self.commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self.full[self.HEIGHT + 1])
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.LAST)
        stringBuffer:append(self.commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self.last[self.WIDTH + 1])
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.LAST)
        stringBuffer:append(self.commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self.last[self.HEIGHT + 1])
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.LAST_HALF)
        stringBuffer:append(self.commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self.lastHalf[self.WIDTH + 1])
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.LAST_HALF)
        stringBuffer:append(self.commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self.lastHalf[self.HEIGHT + 1])
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append((function() if self:isPortrait() then return self.PORTRAIT else return self.LANDSCAPE end end)())
        return tostring(stringBuffer)
end


function DisplayInfoSingleton:getTop()
        return self.top
end


function DisplayInfoSingleton:getLeft()
        return self.left
end


function DisplayInfoSingleton:getLastWidth()
        return self.last[self.WIDTH + 1]
end


function DisplayInfoSingleton:getLastHeight()
        return self.last[self.HEIGHT + 1]
end


function DisplayInfoSingleton:getLastHalfWidth()
        return self.lastHalf[self.WIDTH + 1]
end


function DisplayInfoSingleton:getLastHalfHeight()
        return self.lastHalf[self.HEIGHT + 1]
end


function DisplayInfoSingleton:getCustomLastWidth()
        return self.last[self.CUSTOM_WIDTH + 1]
end


function DisplayInfoSingleton:getCustomLastHeight()
        return self.last[self.CUSTOM_HEIGHT + 1]
end


function DisplayInfoSingleton:getRawLastWidth()
        return self.last[self.WIDTH + 1]
end


function DisplayInfoSingleton:getRawLastHeight()
        return self.last[self.HEIGHT + 1]
end


function DisplayInfoSingleton:setCustom(width, height)
        self.last[self.CUSTOM_WIDTH + 1] = width
        self.lastHalf[self.CUSTOM_WIDTH + 1] = (((self.last[self.CUSTOM_WIDTH + 1]) // (1 << (1))))
        self.last[self.CUSTOM_HEIGHT + 1] = height
        self.lastHalf[self.CUSTOM_HEIGHT + 1] = (((self.last[self.CUSTOM_HEIGHT + 1]) // (1 << (1))))
end


function DisplayInfoSingleton:setScalableListener(scalableListener)
        self.scalableListener = scalableListener
end


function DisplayInfoSingleton:getScalableListener()
        return self.scalableListener
end


function DisplayInfoSingleton:getRatio()
        return self.ratio
end


function DisplayInfoSingleton:getDisplayRatio()
        return self.displayRatio
end


function DisplayInfoSingleton:setOffset(left, top)
        self.left = left
end


function DisplayInfoSingleton:getxOffset()
        return self.xOffset
end


function DisplayInfoSingleton:getyOffset()
        return self.yOffset
end

DisplayInfoSingleton.SINGLETON = DisplayInfoSingleton.new()

return DisplayInfoSingleton

