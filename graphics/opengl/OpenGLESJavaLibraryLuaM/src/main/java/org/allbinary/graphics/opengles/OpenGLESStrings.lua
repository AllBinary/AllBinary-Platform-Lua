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
-- package org.allbinary.graphics.opengles

local OpenGLESStrings = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLESStrings"] = OpenGLESStrings

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

local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")

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

-- class table OpenGLESStrings is declared before the requires
OpenGLESStrings.__index = OpenGLESStrings
OpenGLESStrings.className = "OpenGLESStrings"
OpenGLESStrings.javaClassName = "org.allbinary.graphics.opengles.OpenGLESStrings"

function OpenGLESStrings._jinit(self)
    return self
end

function OpenGLESStrings.new()
    return OpenGLESStrings._jinit(setmetatable({}, OpenGLESStrings))
end


-- throws Exception
function OpenGLESStrings:set(gl)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:initFont(gl, width, height)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function OpenGLESStrings:update(gl, width, height)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:drawChar(gl, graphics, character, x, y, anchor)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:drawChars(gl, graphics, data, offset, length, x, y, anchor)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:drawString(gl, graphics, string_, x, y, anchor)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:drawSubstring(gl, graphics, string_, offset, len, x, y, anchor)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:charWidth(ch)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:charsWidth(ch, offset, length)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:stringWidth_j1(string_)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLESStrings:stringWidth_j3(string_, offset, len)
        error(require("java.lang.RuntimeException").new(), 0)
end
function OpenGLESStrings:stringWidth(...)
    local count = select("#", ...)
    if count == 1 then return self:stringWidth_j1(...) end
    if count == 3 then return self:stringWidth_j3(...) end
    error("No method stringWidth takes " .. count .. " arguments")
end
OpenGLESStrings.stringWidth__jdispatcher = OpenGLESStrings.stringWidth

return OpenGLESStrings

