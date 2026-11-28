-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local NullRTSLayer = {}
package.loaded["org.allbinary.game.layer.NullRTSLayer"] = NullRTSLayer

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

local GameNotificationHud = java_lazy("org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud")
local DestroyedEvent = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local PlayerGameInput = java_lazy("org.allbinary.game.input.PlayerGameInput")
local NullRTSFormInputFactory = java_lazy("org.allbinary.game.input.form.NullRTSFormInputFactory")
local RTSFormInput = java_lazy("org.allbinary.game.input.form.RTSFormInput")
local Capital = java_lazy("org.allbinary.game.layer.capital.Capital")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local PlayerOwnedRTSLayers = java_lazy("org.allbinary.game.layer.PlayerOwnedRTSLayers")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table NullRTSLayer is declared before the requires
NullRTSLayer.__index = NullRTSLayer
NullRTSLayer.className = "NullRTSLayer"
NullRTSLayer.javaClassName = "org.allbinary.game.layer.NullRTSLayer"
setmetatable(NullRTSLayer, {__index = NullPathFindingLayer})
NullRTSLayer.java_implements = " RTSPlayerLayerInterface "
NullRTSLayer.java_interfaces = function() return {RTSPlayerLayerInterface} end

function NullRTSLayer._jinit(self)
    java_super_init(NullPathFindingLayer, self)
    return self
end

function NullRTSLayer.new()
    return NullRTSLayer._jinit(setmetatable({}, NullRTSLayer))
end


function NullRTSLayer:getName()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "getName", 0)


-- throws Exception
function NullRTSLayer:processInput(layerManager)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "processInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function NullRTSLayer:initInputProcessors()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "initInputProcessors", 0)


function NullRTSLayer:getGameNotificationHud()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "getGameNotificationHud", 0)


function NullRTSLayer:getCurrentScrollSelectionForm()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "getCurrentScrollSelectionForm", 0)


function NullRTSLayer:setCurrentScrollSelectionForm(currentScrollSelectionForm)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "setCurrentScrollSelectionForm", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ScrollSelectionForm")) end)


function NullRTSLayer:getBuildingScrollSelectionForm()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "getBuildingScrollSelectionForm", 0)


function NullRTSLayer:getPlayerGameInput()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "getPlayerGameInput", 0)


function NullRTSLayer:onEvent(eventObject)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


-- throws Exception
function NullRTSLayer:onDestroyed(destroyedEvent)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "onDestroyed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DestroyedEvent")) end)


-- throws Exception
function NullRTSLayer:processTick(allBinaryLayerManager)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "processTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function NullRTSLayer:getCapital()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "getCapital", 0)


function NullRTSLayer:getRTSFormInput()
        return NullRTSFormInputFactory.getInstance()
end
java_overload(NullRTSLayer, "getRTSFormInput", 0)


function NullRTSLayer:add(sound)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "add", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Sound")) end)


function NullRTSLayer:getPlayerOwnedRTSLayers()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "getPlayerOwnedRTSLayers", 0)


function NullRTSLayer:implmentsArtificialIntelligenceCompositeInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(NullRTSLayer, "implmentsArtificialIntelligenceCompositeInterface", 0)

NullRTSLayer.NULL_RTS_LAYER = NullRTSLayer.new()

return NullRTSLayer

