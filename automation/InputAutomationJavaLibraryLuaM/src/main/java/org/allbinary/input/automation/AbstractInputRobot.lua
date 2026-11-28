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
-- package org.allbinary.input.automation

local AbstractInputRobot = {}
package.loaded["org.allbinary.input.automation.AbstractInputRobot"] = AbstractInputRobot

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
-- local HelpSet = require("javax.help.HelpSet")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PointHelper = java_lazy("org.allbinary.input.automation.PointHelper")

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

-- class table AbstractInputRobot is declared before the requires
AbstractInputRobot.__index = AbstractInputRobot
AbstractInputRobot.className = "AbstractInputRobot"
AbstractInputRobot.javaClassName = "org.allbinary.input.automation.AbstractInputRobot"

function AbstractInputRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.helpSet == nil then self.helpSet = nil end
end


function AbstractInputRobot._jinit(self, helpSet)
    AbstractInputRobot._init_fields(self)
        self:setHelpSet(helpSet)
    return self
end

function AbstractInputRobot.new(...)
    local self = setmetatable({}, AbstractInputRobot)
    AbstractInputRobot._jinit(self, ...)
    return self
end


function AbstractInputRobot:getHelpSet()
        return self.helpSet
end


function AbstractInputRobot:mouseMove_j1(point)
        self:mouseMove(point.x, point.y)
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Moved Mouse To: x: ") .. require("allbinary_java").to_string(point.x)) .. require("allbinary_java").to_string(" y: ")) .. require("allbinary_java").to_string(point.y), self, "moveMouse")
end


-- throws Exception
function AbstractInputRobot:mouseMoveToTarget_j3(rectangle, x, y)
        local point = PointHelper.getCenterPoint(rectangle)
        self:mouseMove(point.x + x, point.y + y)
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Moved Mouse To: x: ") .. require("allbinary_java").to_string(point.x)) .. require("allbinary_java").to_string(" y: ")) .. require("allbinary_java").to_string(point.y)) .. require("allbinary_java").to_string(" in the middle of: ")) .. require("allbinary_java").to_string(rectangle), self, "moveMouseToTarget")
end


-- throws Exception
function AbstractInputRobot:mouseMoveToTarget_j1(rectangle)
        self:mouseMoveToTarget(rectangle, 0, 0)
end
function AbstractInputRobot:mouseMoveToTarget(...)
    local count = select("#", ...)
    if count == 3 then return self:mouseMoveToTarget_j3(...) end
    if count == 1 then return self:mouseMoveToTarget_j1(...) end
    error("No method mouseMoveToTarget takes " .. count .. " arguments")
end
AbstractInputRobot.mouseMoveToTarget__jdispatcher = AbstractInputRobot.mouseMoveToTarget


function AbstractInputRobot:mouseMove_j2(x, y)
        error(require("java.lang.RuntimeException").new(), 0)
end
function AbstractInputRobot:mouseMove(...)
    local count = select("#", ...)
    if count == 1 then return self:mouseMove_j1(...) end
    if count == 2 then return self:mouseMove_j2(...) end
    error("No method mouseMove takes " .. count .. " arguments")
end
AbstractInputRobot.mouseMove__jdispatcher = AbstractInputRobot.mouseMove


function AbstractInputRobot:setHelpSet(helpSet)
        self.helpSet = helpSet
end

return AbstractInputRobot

