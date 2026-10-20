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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local Features = require("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FullScreenUtil = {}
FullScreenUtil.__index = FullScreenUtil
FullScreenUtil.className = "FullScreenUtil"

function FullScreenUtil.new()
    local self = setmetatable({}, FullScreenUtil)
    return self
end


function FullScreenUtil.getInstance()
        return FullScreenUtil.instance
end


-- throws Exception
function FullScreenUtil:initOnRun(fullScreenInterface, commandListener)
        if commandListener ~= nil then
            self:init(fullScreenInterface)
        end
end


function FullScreenUtil:init(fullScreenInterface)
end


function FullScreenUtil:isScreenChange(isFullScreen)
        local mainFeatureFactory = MainFeatureFactory.getInstance()
        local features = Features.getInstance()
        if features:isFeature(mainFeatureFactory.FULL_SCREEN) ~= isFullScreen then
            return true
        end
        return false
end


function FullScreenUtil:isScreenChangeCanvas(fullScreenInterface)
        return self:isScreenChange(false)
end

FullScreenUtil.instance = FullScreenUtil.new()

return FullScreenUtil

