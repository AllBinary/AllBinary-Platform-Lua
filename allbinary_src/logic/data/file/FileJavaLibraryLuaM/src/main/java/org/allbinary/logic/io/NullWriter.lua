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
-- package org.allbinary.logic.io

local NullWriter = {}
package.loaded["org.allbinary.logic.io.NullWriter"] = NullWriter

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

-- local IOException = require("java.io.IOException")
-- local Writer = require("java.io.Writer")

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

-- class table NullWriter is declared before the requires
NullWriter.__index = NullWriter
NullWriter.className = "NullWriter"
NullWriter.javaClassName = "org.allbinary.logic.io.NullWriter"
setmetatable(NullWriter, {__index = Writer})

function NullWriter._jinit(self)
    java_super_init(Writer, self)
    return self
end

function NullWriter.new()
    return NullWriter._jinit(setmetatable({}, NullWriter))
end


-- throws IOException
function NullWriter:write_j1_1(c)
end


-- throws IOException
function NullWriter:write_j3_1(cbuf, off, len)
end


-- throws IOException
function NullWriter:write_j1_2(str)
end


-- throws IOException
function NullWriter:write_j3_2(str, off, len)
end
function NullWriter:write(...)
    local count = select("#", ...)
    if count == 1 then return self:write_j1(...) end
    if count == 3 then return self:write_j3(...) end
    local parent = getmetatable(NullWriter).__index
    if parent.write then return parent.write(self, ...) end
    error("No method write takes " .. count .. " arguments")
end
NullWriter.write__jdispatcher = NullWriter.write
function NullWriter:write_j1(...)
    local java_a1 = ...
    if true and math.type(java_a1) == "integer" then return NullWriter.write_j1_1(self, ...) end
    return NullWriter.write_j1_2(self, ...)
end
function NullWriter:write_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "string"))) and math.type(java_a2) == "integer" and math.type(java_a3) == "integer" then return NullWriter.write_j3_1(self, ...) end
    return NullWriter.write_j3_2(self, ...)
end


-- throws IOException
function NullWriter:flush()
end
java_overload(NullWriter, "flush", 0)


-- throws IOException
function NullWriter:close()
end
java_overload(NullWriter, "close", 0)

NullWriter.NULL_WRITER = NullWriter.new()

return NullWriter

