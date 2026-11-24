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
-- package org.allbinary.input

local DirectionalAnalogLocationInputProcessor = {}
package.loaded["org.allbinary.input.DirectionalAnalogLocationInputProcessor"] = DirectionalAnalogLocationInputProcessor

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

local AnalogLocationInputProcessor = require("org.allbinary.android.input.motion.AnalogLocationInputProcessor")
local GameInputProcessor = java_lazy("org.allbinary.game.input.GameInputProcessor")
local GameKeyEventSourceInterface = java_lazy("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyFactory = java_lazy("org.allbinary.game.input.GameKeyFactory")
local AnalogLocationInput = java_lazy("org.allbinary.game.input.analog.AnalogLocationInput")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local CustomGPoint = java_lazy("org.allbinary.graphics.CustomGPoint")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table DirectionalAnalogLocationInputProcessor is declared before the requires
DirectionalAnalogLocationInputProcessor.__index = DirectionalAnalogLocationInputProcessor
DirectionalAnalogLocationInputProcessor.className = "DirectionalAnalogLocationInputProcessor"
DirectionalAnalogLocationInputProcessor.javaClassName = "org.allbinary.input.DirectionalAnalogLocationInputProcessor"
setmetatable(DirectionalAnalogLocationInputProcessor, {__index = AnalogLocationInputProcessor})
DirectionalAnalogLocationInputProcessor.java_implements = " GameKeyEventSourceInterface "
DirectionalAnalogLocationInputProcessor.java_interfaces = function() return {GameKeyEventSourceInterface} end

function DirectionalAnalogLocationInputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.inputProcessorArray == nil then self.inputProcessorArray = nil end
    self.gameKeyFactory = GameKeyFactory.getInstance()
    self.leftGameKeyEvent = GameKeyEvent.NONE
    self.rightGameKeyEvent = GameKeyEvent.NONE
    self.upGameKeyEvent = GameKeyEvent.NONE
    self.downGameKeyEvent = GameKeyEvent.NONE
    self.leftTriggerGameKeyEvent = GameKeyEvent.NONE
    self.rightTriggerGameKeyEvent = GameKeyEvent.NONE
end


function DirectionalAnalogLocationInputProcessor._jinit(self, inputProcessorArray)
    java_super_init(AnalogLocationInputProcessor, self)
    DirectionalAnalogLocationInputProcessor._init_fields(self)
        self.inputProcessorArray = inputProcessorArray
        local try_ok, try_error, try_value = pcall(function()
            self.leftGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.LEFT)
            self.rightGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.RIGHT)
            self.upGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.UP)
            self.downGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.DOWN)
            self.leftTriggerGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.KEY_NUM0)
            self.rightTriggerGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.KEY_NUM5)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end

function DirectionalAnalogLocationInputProcessor.new(...)
    local self = setmetatable({}, DirectionalAnalogLocationInputProcessor)
    DirectionalAnalogLocationInputProcessor._jinit(self, ...)
    return self
end


function DirectionalAnalogLocationInputProcessor:process(allbinaryLayerManager, analogLocationInput)
        local try_ok, try_error, try_value = pcall(function()
            local customGPoint = nil
            customGPoint = analogLocationInput:getCustomGPoint()
            local x = customGPoint:getX()
            local y = customGPoint:getY()
            local leftTrigger = analogLocationInput:getLeftTrigger()
            local rightTrigger = analogLocationInput:getRightTrigger()
            if x < 0 then
                self.inputProcessorArray[self.leftGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.leftGameKeyEvent, x)
            elseif x > 0 then
                self.inputProcessorArray[self.rightGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.rightGameKeyEvent, x)
            end
            if y < 0 then
                self.inputProcessorArray[self.downGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.downGameKeyEvent, y)
            elseif y > 0 then
                self.inputProcessorArray[self.upGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.upGameKeyEvent, y)
            end
            if leftTrigger > 0 then
                self.inputProcessorArray[self.leftTriggerGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.leftTriggerGameKeyEvent, leftTrigger)
            end
            if rightTrigger > 0 then
                self.inputProcessorArray[self.rightTriggerGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.rightTriggerGameKeyEvent, rightTrigger)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put("Unable to process analog input", self, commonStrings.PROCESS, e)
        end
end
java_overload(DirectionalAnalogLocationInputProcessor, "process", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "AnalogLocationInput")) end)


function DirectionalAnalogLocationInputProcessor:getSourceId()
        return 0
end
java_overload(DirectionalAnalogLocationInputProcessor, "getSourceId", 0)

return DirectionalAnalogLocationInputProcessor

