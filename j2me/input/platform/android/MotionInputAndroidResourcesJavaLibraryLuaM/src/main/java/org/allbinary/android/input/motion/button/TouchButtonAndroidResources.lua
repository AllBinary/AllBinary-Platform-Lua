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
-- package org.allbinary.android.input.motion.button

local AndroidResources = require("org.allbinary.AndroidResources")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local Init = require("org.allbinary.init.Init")
local CommonButtons = require("org.allbinary.input.motion.button.CommonButtons")
local TouchButtonBlankResource = require("org.allbinary.input.motion.button.TouchButtonBlankResource")
local TouchButtonDownResource = require("org.allbinary.input.motion.button.TouchButtonDownResource")
local TouchButtonGenericActionResource = require("org.allbinary.input.motion.button.TouchButtonGenericActionResource")
local TouchButtonResource = require("org.allbinary.input.motion.button.TouchButtonResource")
local TouchButtonStartResource = require("org.allbinary.input.motion.button.TouchButtonStartResource")
local TouchButtonStrafeLeftResource = require("org.allbinary.input.motion.button.TouchButtonStrafeLeftResource")
local TouchButtonStrafeRightResource = require("org.allbinary.input.motion.button.TouchButtonStrafeRightResource")
local TouchButtonTurnLeftResource = require("org.allbinary.input.motion.button.TouchButtonTurnLeftResource")
local TouchButtonTurnRightResource = require("org.allbinary.input.motion.button.TouchButtonTurnRightResource")
local TouchButtonUpResource = require("org.allbinary.input.motion.button.TouchButtonUpResource")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")

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

local TouchButtonAndroidResources = {}
TouchButtonAndroidResources.__index = TouchButtonAndroidResources
TouchButtonAndroidResources.className = "TouchButtonAndroidResources"
setmetatable(TouchButtonAndroidResources, {__index = Init})

function TouchButtonAndroidResources.new()
    local self = setmetatable(Init.new(), TouchButtonAndroidResources)
    return self
end


function TouchButtonAndroidResources:init()
        local resourceUtil = ResourceUtil.getInstance()
        local androidResources = AndroidResources.getInstance()
        local RESOURCE_STRING_ARRAY = {TouchButtonBlankResource.getInstance(), TouchButtonGenericActionResource.getInstance(), TouchButtonStartResource.getInstance(), TouchButtonUpResource.getInstance(), TouchButtonDownResource.getInstance(), TouchButtonTurnLeftResource.getInstance(), TouchButtonTurnRightResource.getInstance(), TouchButtonStrafeLeftResource.getInstance(), TouchButtonStrafeRightResource.getInstance()}
        local RESOURCE_ARRAY = java_new_array(0, (RESOURCE_STRING_ARRAY.n or #RESOURCE_STRING_ARRAY))
        if CommonButtons.getInstance().STANDARD_BUTTON_SIZE == 128 then
            RESOURCE_ARRAY[1] = androidResources.raw.touch_button_128_by_128
            RESOURCE_ARRAY[2] = androidResources.raw.touch_button_generic_action_128_by_128
            RESOURCE_ARRAY[3] = androidResources.raw.touch_button_start_128_by_128
            RESOURCE_ARRAY[4] = androidResources.raw.touch_button_up_arrow_128_by_128
            RESOURCE_ARRAY[5] = androidResources.raw.touch_button_down_arrow_128_by_128
            RESOURCE_ARRAY[6] = androidResources.raw.touch_button_turn_left_arrow_128_by_128
            RESOURCE_ARRAY[7] = androidResources.raw.touch_button_turn_right_arrow_128_by_128
            RESOURCE_ARRAY[8] = androidResources.raw.touch_button_strafe_left_arrow_128_by_128
            RESOURCE_ARRAY[9] = androidResources.raw.touch_button_strafe_right_arrow_128_by_128
            if OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan() then
                resourceUtil:addResource(RESOURCE_STRING_ARRAY[3].HINT, tostring(androidResources.raw.ouya_o))
            end
        else
            RESOURCE_ARRAY[1] = androidResources.raw.touch_button_64_by_64
            RESOURCE_ARRAY[2] = androidResources.raw.touch_button_generic_action_64_by_64
            RESOURCE_ARRAY[3] = androidResources.raw.touch_button_start_64_by_64
            RESOURCE_ARRAY[4] = androidResources.raw.touch_button_up_arrow_64_by_64
            RESOURCE_ARRAY[5] = androidResources.raw.touch_button_down_arrow_64_by_64
            RESOURCE_ARRAY[6] = androidResources.raw.touch_button_turn_left_arrow_64_by_64
            RESOURCE_ARRAY[7] = androidResources.raw.touch_button_turn_right_arrow_64_by_64
            RESOURCE_ARRAY[8] = androidResources.raw.touch_button_strafe_left_arrow_64_by_64
            RESOURCE_ARRAY[9] = androidResources.raw.touch_button_strafe_right_arrow_64_by_64
        end
        for index = 0, (RESOURCE_ARRAY.n or #RESOURCE_ARRAY) - 1 do
            resourceUtil:addResource(RESOURCE_STRING_ARRAY[index + 1].RESOURCE, tostring(RESOURCE_ARRAY[index + 1]))
        end
end

return TouchButtonAndroidResources

