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
-- package org.allbinary.data.tree.dom.document

local DomDocumentHelper = {}
package.loaded["org.allbinary.data.tree.dom.document.DomDocumentHelper"] = DomDocumentHelper

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

local InputStream = java_lazy("java.io.InputStream")
-- local StringBufferInputStream = require("java.io.StringBufferInputStream")
-- local DocumentBuilder = require("javax.xml.parsers.DocumentBuilder")
-- local DocumentBuilderFactory = require("javax.xml.parsers.DocumentBuilderFactory")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local Document = java_lazy("org.w3c.dom.Document")

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

-- class table DomDocumentHelper is declared before the requires
DomDocumentHelper.__index = DomDocumentHelper
DomDocumentHelper.className = "DomDocumentHelper"
DomDocumentHelper.javaClassName = "org.allbinary.data.tree.dom.document.DomDocumentHelper"


function DomDocumentHelper._jinit(self)
    return self
end

function DomDocumentHelper.new(...)
    local self = setmetatable({}, DomDocumentHelper)
    DomDocumentHelper._jinit(self, ...)
    return self
end


function DomDocumentHelper.init()
        local commonPhoneStrings = CommonPhoneStrings.getInstance()
        require("java.lang.System").setProperty("jdk.xml.maxElementDepth", commonPhoneStrings.ZERO)
        require("java.lang.System").setProperty("jdk.xml.xpathExprOpLimit", commonPhoneStrings.ZERO)
        require("java.lang.System").setProperty("jdk.xml.xpathTotalOpLimit", commonPhoneStrings.ZERO)
        local LIMIT = "500000"
        require("java.lang.System").setProperty("jdk.xml.maxGeneralEntitySizeLimit", LIMIT)
        require("java.lang.System").setProperty("jdk.xml.totalEntitySizeLimit", LIMIT)
end


function DomDocumentHelper.create_j0()
        local try_ok, try_error, try_value = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:newDocument()
            do return "__jreturn", document end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function DomDocumentHelper.create_j1_1(inputStream)
        local try_ok, try_error, try_value = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:parse(inputStream)
            do return "__jreturn", document end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function DomDocumentHelper.create_j1_2(xmlString)
        local try_ok, try_error, try_value = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:parse(StringBufferInputStream.new(xmlString))
            do return "__jreturn", document end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function DomDocumentHelper.create(...)
    local count = select("#", ...)
    if count == 0 then return DomDocumentHelper.create_j0(...) end
    if count == 1 then return DomDocumentHelper.create_j1(...) end
    error("No method create takes " .. count .. " arguments")
end
DomDocumentHelper.create__jdispatcher = DomDocumentHelper.create
function DomDocumentHelper.create_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "InputStream")) then return DomDocumentHelper.create_j1_1(...) end
    return DomDocumentHelper.create_j1_2(...)
end

return DomDocumentHelper

