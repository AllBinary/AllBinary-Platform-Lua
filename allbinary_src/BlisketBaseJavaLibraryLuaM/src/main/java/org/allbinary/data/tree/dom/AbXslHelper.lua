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
-- package org.allbinary.data.tree.dom

local AbXslHelper = {}
package.loaded["org.allbinary.data.tree.dom.AbXslHelper"] = AbXslHelper

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local XslHelper = java_lazy("org.allbinary.data.tree.dom.XslHelper")

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

-- class table AbXslHelper is declared before the requires
AbXslHelper.__index = AbXslHelper
AbXslHelper.className = "AbXslHelper"
AbXslHelper.javaClassName = "org.allbinary.data.tree.dom.AbXslHelper"

function AbXslHelper._jinit(self)
    return self
end

function AbXslHelper.new()
    return AbXslHelper._jinit(setmetatable({}, AbXslHelper))
end


function AbXslHelper.getInstance()
        return AbXslHelper.instance_f
end


-- throws Exception
function AbXslHelper:translate_j2_1(xslFile, xmlFile)
        return self:translate(xslFile:getAbsolutePath(), xmlFile:getAbsolutePath())
end


-- throws Exception
function AbXslHelper:translate_j2_2(xslPath, xmlPath)
        return self:translate(xslPath:getPath(), xmlPath:getPath())
end


-- throws Exception
function AbXslHelper:translate_j2_3(xsltFilePath, xmlFilePath)
        local try_ok, try_error, try_value = pcall(function()
            local outputStream = require("java.io.ByteArrayOutputStream").new()
            do return "__jreturn", tostring(XslHelper.getInstance():translate(StreamSource.new(xsltFilePath), StreamSource.new(xmlFilePath), StreamResult.new(outputStream))) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbXslHelper:translate(...)
    local count = select("#", ...)
    if count == 2 then return self:translate_j2(...) end
    error("No method translate takes " .. count .. " arguments")
end
AbXslHelper.translate__jdispatcher = AbXslHelper.translate
function AbXslHelper:translate_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbFile")) and (java_a2 == nil or java_is(java_a2, "AbFile")) then return AbXslHelper.translate_j2_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "AbPath")) and (java_a2 == nil or java_is(java_a2, "AbPath")) then return AbXslHelper.translate_j2_2(self, ...) end
    return AbXslHelper.translate_j2_3(self, ...)
end

AbXslHelper.instance_f = AbXslHelper.new()

return AbXslHelper

