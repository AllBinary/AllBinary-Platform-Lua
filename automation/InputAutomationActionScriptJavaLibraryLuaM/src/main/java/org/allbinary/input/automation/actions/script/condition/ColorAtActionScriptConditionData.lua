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
-- package org.allbinary.input.automation.actions.script.condition


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorAtActionScriptConditionData = {}
ColorAtActionScriptConditionData.__index = ColorAtActionScriptConditionData
ColorAtActionScriptConditionData.className = "ColorAtActionScriptConditionData"


function ColorAtActionScriptConditionData.new()
    local self = setmetatable({}, ColorAtActionScriptConditionData)
    return self
end

ColorAtActionScriptConditionData.NAME = "COLOR_AT_ACTION_CONDITION_NAME"
ColorAtActionScriptConditionData.LOCATION_X = "COLOR_AT_ACTION_CONDITION_LOCATION_X"
ColorAtActionScriptConditionData.LOCATION_Y = "COLOR_AT_ACTION_CONDITION_LOCATION_Y"
ColorAtActionScriptConditionData.MIN_RED = "COLOR_AT_ACTION_CONDITION_MIN_RED"
ColorAtActionScriptConditionData.MAX_RED = "COLOR_AT_ACTION_CONDITION_MAX_RED"
ColorAtActionScriptConditionData.MIN_GREEN = "COLOR_AT_ACTION_CONDITION_MIN_GREEN"
ColorAtActionScriptConditionData.MAX_GREEN = "COLOR_AT_ACTION_CONDITION_MAX_GREEN"
ColorAtActionScriptConditionData.MIN_BLUE = "COLOR_AT_ACTION_CONDITION_MIN_BLUE"
ColorAtActionScriptConditionData.MAX_BLUE = "COLOR_AT_ACTION_CONDITION_MAX_BLUE"

return ColorAtActionScriptConditionData

