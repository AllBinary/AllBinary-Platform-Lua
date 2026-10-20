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
-- package org.allbinary.game.layer

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local NamedAngle = require("org.allbinary.math.NamedAngle")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local RTSLayerLogHelper = require("org.allbinary.game.layer.RTSLayerLogHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayerSelectedLogHelper = {}
RTSLayerSelectedLogHelper.__index = RTSLayerSelectedLogHelper
RTSLayerSelectedLogHelper.className = "RTSLayerSelectedLogHelper"
setmetatable(RTSLayerSelectedLogHelper, {__index = RTSLayerLogHelper})

function RTSLayerSelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.positionStrings = PositionStrings.getInstance()
    self.TRACKTO_TURNTO = "trackTo:turnTo"
end

function RTSLayerSelectedLogHelper.new()
    local self = setmetatable(RTSLayerLogHelper.new(), RTSLayerSelectedLogHelper)
    self:_init_fields()
    return self
end


function RTSLayerSelectedLogHelper.getInstance()
        return RTSLayerSelectedLogHelper.instanceC
end


function RTSLayerSelectedLogHelper:setClosestGeographicMapCellHistory(associatedAdvancedRTSGameLayer, pathsList)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(CommonLabels.getInstance().START)
        stringBuffer:appendint(pathsList:size())
        stringBuffer:append(" -> ")
        stringBuffer:append(StringUtil.getInstance():toString(pathsList))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: setClosestGeographicMapCellHistory")
end


function RTSLayerSelectedLogHelper:trackTo(associatedAdvancedRTSGameLayer, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(StringUtil.getInstance():toString(nextUnvisitedPathGeographicMapCellPosition))
        stringBuffer:append(self.positionStrings.DX_LABEL)
        stringBuffer:appendint(dx)
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DY_LABEL)
        stringBuffer:appendint(dy)
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(reason)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: trackTo")
end


function RTSLayerSelectedLogHelper:turnTo(associatedAdvancedRTSGameLayer, dx, dy, angleInfo, angle, movementAngle, evading, targetAngle)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" steering - ")
        stringBuffer:append(self.positionStrings.DX_LABEL)
        stringBuffer:appendint(dx)
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DY_LABEL)
        stringBuffer:appendint(dy)
        stringBuffer:append(" angle: ")
        stringBuffer:appendint(angle)
        stringBuffer:append(" movementAngle: ")
        stringBuffer:append(movementAngle.name)
        stringBuffer:append(self.commonSeps.FORWARD_SLASH)
        stringBuffer:appendshort(java_int(movementAngle:getValue()))
        if angleInfo ~= nil then
            local angleIncrement = angleInfo:getAngleIncrementInfo():getAngleIncrement()
            stringBuffer:append(" angleIncrement: ")
            stringBuffer:appendshort(angleIncrement)
        end
        stringBuffer:append(" Evading: ")
        stringBuffer:appendboolean(evading)
        self.logUtil:putF(tostring(stringBuffer), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:doneMoving(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - done moving 0,0")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:closeEnough(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - close enough")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:movingLeft(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingLeft")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:movingRight(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingRight")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:movingUp(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingUp")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:movingDown(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingDown")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:currentMoveEnded(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - correct angle, but movement not needed for current deltas so reseting movement angle")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:evade(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - evade")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:rotateLeft(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - rotating left")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:rotateRight(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - rotating right")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:handle(associatedAdvancedRTSGameLayer, movementAngle)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - movementAngle: "):append(movementAngle.name):append(self.commonSeps.FORWARD_SLASH):appendshort(java_int(movementAngle:getValue()))), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:noRotation(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - Do not rotate")), self, self.TRACKTO_TURNTO)
end


function RTSLayerSelectedLogHelper:notOnPath(associatedAdvancedRTSGameLayer, geographicMapCellHistory, currentGeographicMapCellPosition, pathList)
        local stringUtil = StringUtil.getInstance()
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(CommonSeps.getInstance().SPACE):appendint(java_int(geographicMapCellHistory:getTotalVisited())):append(CommonSeps.getInstance().SPACE):append(stringUtil:toString(currentGeographicMapCellPosition)):append(" - trying to move but not on path: "):append(stringUtil:toString(pathList))), self, "turnTo")
end

RTSLayerSelectedLogHelper.instanceC = RTSLayerSelectedLogHelper.new()

return RTSLayerSelectedLogHelper

