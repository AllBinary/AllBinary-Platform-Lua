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

local RTSLayerSelectedLogHelper = {}
package.loaded["org.allbinary.game.layer.RTSLayerSelectedLogHelper"] = RTSLayerSelectedLogHelper

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local NamedAngle = java_lazy("org.allbinary.math.NamedAngle")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local RTSLayerLogHelper = require("org.allbinary.game.layer.RTSLayerLogHelper")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

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

-- class table RTSLayerSelectedLogHelper is declared before the requires
RTSLayerSelectedLogHelper.__index = RTSLayerSelectedLogHelper
RTSLayerSelectedLogHelper.className = "RTSLayerSelectedLogHelper"
RTSLayerSelectedLogHelper.javaClassName = "org.allbinary.game.layer.RTSLayerSelectedLogHelper"
setmetatable(RTSLayerSelectedLogHelper, {__index = RTSLayerLogHelper})

function RTSLayerSelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.positionStrings = PositionStrings.getInstance()
    self.TRACKTO_TURNTO = "trackTo:turnTo"
end

function RTSLayerSelectedLogHelper._jinit(self)
    java_super_init(RTSLayerLogHelper, self)
    RTSLayerSelectedLogHelper._init_fields(self)
    return self
end

function RTSLayerSelectedLogHelper.new()
    return RTSLayerSelectedLogHelper._jinit(setmetatable({}, RTSLayerSelectedLogHelper))
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
java_overload(RTSLayerSelectedLogHelper, "setClosestGeographicMapCellHistory", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) end)


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
java_overload(RTSLayerSelectedLogHelper, "trackTo", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) and type(java_a3) == "number" and type(java_a4) == "number" and (java_a5 == nil or type(java_a5) == "string") end)


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
        stringBuffer:append(movementAngle.name_f)
        stringBuffer:append(self.commonSeps.FORWARD_SLASH)
        stringBuffer:appendshort(java_int(movementAngle:getValue()))
        if not rawequal(angleInfo, nil) then
            local angleIncrement = angleInfo:getAngleIncrementInfo():getAngleIncrement()
            stringBuffer:append(" angleIncrement: ")
            stringBuffer:appendshort(angleIncrement)
        end
        stringBuffer:append(" Evading: ")
        stringBuffer:appendboolean(evading)
        self.logUtil:putF(tostring(stringBuffer), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "turnTo", 8, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6, java_a7, java_a8) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and type(java_a2) == "number" and type(java_a3) == "number" and (java_a4 == nil or java_is(java_a4, "AngleInfo")) and type(java_a5) == "number" and (java_a6 == nil or java_is(java_a6, "NamedAngle")) and type(java_a7) == "boolean" and type(java_a8) == "number" end)


function RTSLayerSelectedLogHelper:doneMoving(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - done moving 0,0")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "doneMoving", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:closeEnough(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - close enough")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "closeEnough", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:movingLeft(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingLeft")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "movingLeft", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:movingRight(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingRight")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "movingRight", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:movingUp(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingUp")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "movingUp", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:movingDown(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - allow movingDown")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "movingDown", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:currentMoveEnded(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - correct angle, but movement not needed for current deltas so reseting movement angle")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "currentMoveEnded", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:evade(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - evade")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "evade", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:rotateLeft(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - rotating left")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "rotateLeft", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:rotateRight(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - rotating right")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "rotateRight", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:handle(associatedAdvancedRTSGameLayer, movementAngle)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - movementAngle: "):append(movementAngle.name_f):append(self.commonSeps.FORWARD_SLASH):appendshort(java_int(movementAngle:getValue()))), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "handle", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "NamedAngle")) end)


function RTSLayerSelectedLogHelper:noRotation(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" steering - Do not rotate")), self, self.TRACKTO_TURNTO)
end
java_overload(RTSLayerSelectedLogHelper, "noRotation", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayerSelectedLogHelper:notOnPath(associatedAdvancedRTSGameLayer, geographicMapCellHistory, currentGeographicMapCellPosition, pathList)
        local stringUtil = StringUtil.getInstance()
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(CommonSeps.getInstance().SPACE):appendint(java_int(geographicMapCellHistory:getTotalVisited())):append(CommonSeps.getInstance().SPACE):append(stringUtil:toString(currentGeographicMapCellPosition)):append(" - trying to move but not on path: "):append(stringUtil:toString(pathList))), self, "turnTo")
end
java_overload(RTSLayerSelectedLogHelper, "notOnPath", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellHistory")) and (java_a3 == nil or java_is(java_a3, "GeographicMapCellPosition")) and (java_a4 == nil or java_is(java_a4, "BasicArrayList")) end)

RTSLayerSelectedLogHelper.instanceC = RTSLayerSelectedLogHelper.new()

return RTSLayerSelectedLogHelper

