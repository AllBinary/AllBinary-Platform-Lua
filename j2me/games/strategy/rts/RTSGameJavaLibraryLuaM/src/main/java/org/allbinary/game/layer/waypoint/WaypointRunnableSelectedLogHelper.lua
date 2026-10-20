-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.layer.waypoint

local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local WaypointRunnableLogHelper = require("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointRunnableSelectedLogHelper = {}
WaypointRunnableSelectedLogHelper.__index = WaypointRunnableSelectedLogHelper
WaypointRunnableSelectedLogHelper.className = "WaypointRunnableSelectedLogHelper"
setmetatable(WaypointRunnableSelectedLogHelper, {__index = WaypointRunnableLogHelper})

function WaypointRunnableSelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function WaypointRunnableSelectedLogHelper.new()
    local self = setmetatable(WaypointRunnableLogHelper.new(), WaypointRunnableSelectedLogHelper)
    self:_init_fields()
    return self
end


function WaypointRunnableSelectedLogHelper.getInstance()
        return WaypointRunnableSelectedLogHelper.instanceC
end


function WaypointRunnableSelectedLogHelper:start(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(self.commonStrings.START_RUNNABLE)), self, self.commonStrings.RUN)
end


function WaypointRunnableSelectedLogHelper:end_(pathFindingLayerInterface)
        self.logUtil:putF(tostring(StringMaker.new():append(pathFindingLayerInterface:getName()):append(self.commonStrings.END_RUNNABLE)), self, self.commonStrings.RUN)
end

WaypointRunnableSelectedLogHelper.instanceC = WaypointRunnableSelectedLogHelper.new()

return WaypointRunnableSelectedLogHelper

