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
-- package org.allbinary.game.configuration

local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureChoiceGroups = require("org.allbinary.game.configuration.feature.GameFeatureChoiceGroups")
local InGameFeatureChoiceGroups = require("org.allbinary.game.configuration.feature.InGameFeatureChoiceGroups")
local SensorFeatureFactory = require("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local TouchFeatureFactory = require("org.allbinary.game.configuration.feature.TouchFeatureFactory")
local Init = require("org.allbinary.init.Init")
local OrientationData = require("org.allbinary.input.gyro.OrientationData")
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

local InGameFeatures = {}
InGameFeatures.__index = InGameFeatures
InGameFeatures.className = "InGameFeatures"
setmetatable(InGameFeatures, {__index = Init})

function InGameFeatures.new()
    local self = setmetatable(Init.new(), InGameFeatures)
    return self
end


function InGameFeatures:init()
        local LABEL = "Screen Buttons"
        local orientationData = OrientationData.getInstance()
        local exclusiveOrientationSensorVector = GameFeatureChoiceGroups.getExclusiveInstance():get():get(orientationData.ORIENTATION_SENSOR_INPUT)
        local inGameFeatureChoiceGroups = InGameFeatureChoiceGroups.getExclusiveInstance()
        if exclusiveOrientationSensorVector ~= nil then
            local inGameExclusiveOrientationSensorVectorCanBeNull = inGameFeatureChoiceGroups:get():get(orientationData.ORIENTATION_SENSOR_INPUT)
            if inGameExclusiveOrientationSensorVectorCanBeNull == nil then
                self:addToInGameMenu()
            else
                local inGameExclusiveOrientationSensorVector = inGameExclusiveOrientationSensorVectorCanBeNull
                if inGameExclusiveOrientationSensorVector:size() == 0 then
                    self:addToInGameMenu()
                end
            end
        end
        local features = Features.getInstance()
        if features:isFeature(TouchFeatureFactory.getInstance().SHOW_SCREEN_BUTTONS) or features:isFeature(TouchFeatureFactory.getInstance().AUTO_HIDE_SHOW_SCREEN_BUTTONS) or features:isFeature(TouchFeatureFactory.getInstance().HIDE_SCREEN_BUTTONS) then
            local exclusiveScreenButtonsVector = BasicArrayListD.new()
            local touchFeatureFactory = TouchFeatureFactory.getInstance()
            exclusiveScreenButtonsVector:add(touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS)
            exclusiveScreenButtonsVector:add(touchFeatureFactory.SHOW_SCREEN_BUTTONS)
            exclusiveScreenButtonsVector:add(touchFeatureFactory.HIDE_SCREEN_BUTTONS)
            inGameFeatureChoiceGroups:add(LABEL, exclusiveScreenButtonsVector)
        end
end


function InGameFeatures:addToInGameMenu()
        local orientationData = OrientationData.getInstance()
        local inGameExclusiveOrientationSensorVector = BasicArrayListD.new()
        inGameExclusiveOrientationSensorVector:add(SensorFeatureFactory.getInstance().ORIENTATION_SENSORS)
        inGameExclusiveOrientationSensorVector:add(SensorFeatureFactory.getInstance().NO_ORIENTATION)
        InGameFeatureChoiceGroups.getExclusiveInstance():add(orientationData.ORIENTATION_SENSOR_INPUT, inGameExclusiveOrientationSensorVector)
end


function InGameFeatures:isAny()
        local features = Features.getInstance()
        local touchFeatureFactory = TouchFeatureFactory.getInstance()
        if features:isFeature(touchFeatureFactory.SHOW_SCREEN_BUTTONS) or features:isFeature(touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS) or features:isFeature(touchFeatureFactory.HIDE_SCREEN_BUTTONS) then
            return true
        end
        local exclusiveOrientationSensorVector = GameFeatureChoiceGroups.getExclusiveInstance():get():get(OrientationData.getInstance().ORIENTATION_SENSOR_INPUT)
        if exclusiveOrientationSensorVector ~= nil then
            return true
        end
        return false
end

return InGameFeatures

