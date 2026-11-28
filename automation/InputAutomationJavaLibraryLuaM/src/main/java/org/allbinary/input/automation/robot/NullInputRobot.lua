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
-- package org.allbinary.input.automation.robot

local NullInputRobot = {}
package.loaded["org.allbinary.input.automation.robot.NullInputRobot"] = NullInputRobot

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

-- local Point = require("java.awt.Point")
-- local Rectangle = require("java.awt.Rectangle")
-- local Color = require("java.awt.Color")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local HelpSet = require("javax.help.HelpSet")
local AbstractInputRobot = require("org.allbinary.input.automation.AbstractInputRobot")
local PointFactory = java_lazy("org.allbinary.input.automation.PointFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table NullInputRobot is declared before the requires
NullInputRobot.__index = NullInputRobot
NullInputRobot.className = "NullInputRobot"
NullInputRobot.javaClassName = "org.allbinary.input.automation.robot.NullInputRobot"
setmetatable(NullInputRobot, {__index = AbstractInputRobot})
NullInputRobot.java_implements = " InputRobotInterface "
NullInputRobot.java_interfaces = function() return {InputRobotInterface} end

function NullInputRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function NullInputRobot._jinit(self)
    java_super_init(AbstractInputRobot, self, nil)
    NullInputRobot._init_fields(self)
        -- super(...) made self above
    return self
end

function NullInputRobot.new(...)
    local self = setmetatable({}, NullInputRobot)
    NullInputRobot._jinit(self, ...)
    return self
end


function NullInputRobot:getName()
        return NullInputRobot.NAME
end
java_overload(NullInputRobot, "getName", 0)


function NullInputRobot:getHelpSet()
        return nil
end
java_overload(NullInputRobot, "getHelpSet", 0)


function NullInputRobot:getMousePoint()
        return PointFactory.getInstance(0, 0)
end
java_overload(NullInputRobot, "getMousePoint", 0)


function NullInputRobot:keyPress(keycode)
        self.logUtil:putF(require("allbinary_java").to_string("KeyCode: ") .. require("allbinary_java").to_string(keycode), self, "keyPress")
end
java_overload(NullInputRobot, "keyPress", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NullInputRobot:keyRelease(keycode)
        self.logUtil:putF(require("allbinary_java").to_string("KeyCode: ") .. require("allbinary_java").to_string(keycode), self, "keyRelease")
end
java_overload(NullInputRobot, "keyRelease", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NullInputRobot:mouseMove_j2(x, y)
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("X: ") .. require("allbinary_java").to_string(x)) .. require("allbinary_java").to_string(" Y: ")) .. require("allbinary_java").to_string(y), self, "mouseMove")
end


function NullInputRobot:mousePress(buttons)
        self.logUtil:putF(require("allbinary_java").to_string("Buttons: ") .. require("allbinary_java").to_string(buttons), self, "mousePress")
end
java_overload(NullInputRobot, "mousePress", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NullInputRobot:mouseRelease(buttons)
        self.logUtil:putF(require("allbinary_java").to_string("Buttons: ") .. require("allbinary_java").to_string(buttons), self, "mouseRelease")
end
java_overload(NullInputRobot, "mouseRelease", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NullInputRobot:createScreenCapture(screenRect)
        return nil
end
java_overload(NullInputRobot, "createScreenCapture", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Rectangle")) end)


function NullInputRobot:delay(ms)
end
java_overload(NullInputRobot, "delay", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NullInputRobot:getAutoDelay()
        return -1
end
java_overload(NullInputRobot, "getAutoDelay", 0)


function NullInputRobot:getPixelColor(x, y)
        return nil
end
java_overload(NullInputRobot, "getPixelColor", 2, function(java_a1, java_a2) return true and (java_a1 == nil or math.type(java_a1) == "integer") and (java_a2 == nil or math.type(java_a2) == "integer") end)


function NullInputRobot:isAutoWaitForIdle()
        return false
end
java_overload(NullInputRobot, "isAutoWaitForIdle", 0)


function NullInputRobot:mouseWheel(wheelAmt)
end
java_overload(NullInputRobot, "mouseWheel", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NullInputRobot:setAutoDelay(ms)
end
java_overload(NullInputRobot, "setAutoDelay", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NullInputRobot:setAutoWaitForIdle(isOn)
end
java_overload(NullInputRobot, "setAutoWaitForIdle", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function NullInputRobot:toString()
        return "DirectXWindowsInputRobot"
end
java_overload(NullInputRobot, "toString", 0)
NullInputRobot.__tostring = function(self) return self:toString() end


function NullInputRobot:waitForIdle()
end
java_overload(NullInputRobot, "waitForIdle", 0)


function NullInputRobot:mouseMove_j1(point)
        java_super(AbstractInputRobot, "mouseMove", 1)(self, point)
end
function NullInputRobot:mouseMove(...)
    local count = select("#", ...)
    if count == 2 then return self:mouseMove_j2(...) end
    if count == 1 then return self:mouseMove_j1(...) end
    local parent = getmetatable(NullInputRobot).__index
    if parent.mouseMove then return parent.mouseMove(self, ...) end
    error("No method mouseMove takes " .. count .. " arguments")
end
NullInputRobot.mouseMove__jdispatcher = NullInputRobot.mouseMove


-- throws Exception
function NullInputRobot:mouseMoveToTarget_j1(rectangle)
        java_super(AbstractInputRobot, "mouseMoveToTarget", 1)(self, rectangle)
end


-- throws Exception
function NullInputRobot:mouseMoveToTarget_j3(rectangle, x, y)
        java_super(AbstractInputRobot, "mouseMoveToTarget", 3)(self, rectangle, x, y)
end
function NullInputRobot:mouseMoveToTarget(...)
    local count = select("#", ...)
    if count == 1 then return self:mouseMoveToTarget_j1(...) end
    if count == 3 then return self:mouseMoveToTarget_j3(...) end
    local parent = getmetatable(NullInputRobot).__index
    if parent.mouseMoveToTarget then return parent.mouseMoveToTarget(self, ...) end
    error("No method mouseMoveToTarget takes " .. count .. " arguments")
end
NullInputRobot.mouseMoveToTarget__jdispatcher = NullInputRobot.mouseMoveToTarget

NullInputRobot.LIBRARY_NAME = "null"
NullInputRobot.NAME = "NULL"

return NullInputRobot

