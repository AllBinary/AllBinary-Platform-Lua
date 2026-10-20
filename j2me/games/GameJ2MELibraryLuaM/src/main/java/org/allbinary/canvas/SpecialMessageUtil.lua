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
-- package org.allbinary.canvas

local Features = require("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Memory = require("org.allbinary.system.Memory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpecialMessageUtil = {}
SpecialMessageUtil.__index = SpecialMessageUtil
SpecialMessageUtil.className = "SpecialMessageUtil"

function SpecialMessageUtil.new()
    local self = setmetatable({}, SpecialMessageUtil)
    return self
end


function SpecialMessageUtil.getInstance()
        return SpecialMessageUtil.SINGLETON
end


function SpecialMessageUtil:get()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(Memory.getInfo())
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(tostring(GameStatisticsFactory.getInstance()))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(" Option: ")
        if Features.getInstance():isDefault(OpenGLFeatureFactory.getInstance().OPENGL_AUTO_SELECT) then
            stringBuffer:append(OpenGLFeatureFactory.getInstance().OPENGL_AUTO_SELECT:getName())
        else
            stringBuffer:append(OpenGLFeatureFactory.getInstance().OPENGL_MINIMUM:getName())
        end
        return tostring(stringBuffer)
end

SpecialMessageUtil.SINGLETON = SpecialMessageUtil.new()

return SpecialMessageUtil

