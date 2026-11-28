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
-- package org.allbinary.logic.communication.log.config

local LogConfig = {}
package.loaded["org.allbinary.logic.communication.log.config.LogConfig"] = LogConfig

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

local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local BooleanUtil = java_lazy("org.allbinary.logic.java.bool.BooleanUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigData = java_lazy("org.allbinary.logic.communication.log.config.LogConfigData")

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

-- class table LogConfig is declared before the requires
LogConfig.__index = LogConfig
LogConfig.className = "LogConfig"
LogConfig.javaClassName = "org.allbinary.logic.communication.log.config.LogConfig"

function LogConfig:_init_fields()
    if self.isEnabled_f == nil then self.isEnabled_f = false end
    if self.name_f == nil then self.name_f = nil end
    if self.description == nil then self.description = nil end
    if self.path == nil then self.path = nil end
    if self.fileName == nil then self.fileName = nil end
end

function LogConfig._jinit(self, ...)
    local count = select("#", ...)
    if count == 4 then return LogConfig._new4(self, ...)
    elseif count == 1 then return LogConfig._new1(self, ...)
    end
    error("No constructor of LogConfig takes " .. count .. " arguments")
end

function LogConfig.new(...)
    local self = setmetatable({}, LogConfig)
    LogConfig._jinit(self, ...)
    return self
end


function LogConfig._new4(self, aName, aDescription, aPath, aFileName)
    LogConfig._init_fields(self)
        self.isEnabled_f = false
        self.name_f = aName
        self.description = aDescription
        self.path = aPath
        self.fileName = aFileName
    return self
end


function LogConfig._new1(self, node)
    LogConfig._init_fields(self)
        local enabledValueNode = DomSearchHelper.getNode(EntryData.getInstance().ENABLE, node:getChildNodes())
        local isEnabledString = DomNodeHelper.getTextNodeValue(enabledValueNode)
        self.isEnabled_f = BooleanUtil.getInstance():getFromString(isEnabledString)
        local logConfigData = LogConfigData.getInstance()
        local nameValueNode = DomSearchHelper.getNode(logConfigData.NAME, node:getChildNodes())
        self.name_f = DomNodeHelper.getTextNodeValue(nameValueNode)
        local descriptionValueNode = DomSearchHelper.getNode(logConfigData.DESCRIPTION, node:getChildNodes())
        self.description = DomNodeHelper.getTextNodeValue(descriptionValueNode)
        local fileValueNode = DomSearchHelper.getNode(logConfigData.FILE, node:getChildNodes())
        self.fileName = DomNodeHelper.getTextNodeValue(fileValueNode)
    return self
end


function LogConfig:getName()
        return self.name_f
end


function LogConfig:isEnabled()
        return self.isEnabled_f
end


function LogConfig:enable()
        self.isEnabled_f = true
end


function LogConfig:disable()
        self.isEnabled_f = false
end


function LogConfig:getDescription()
        return self.description
end


function LogConfig:getFileName()
        return self.fileName
end


function LogConfig:setName(value)
        self.name_f = value
end


function LogConfig:setDescription(value)
        self.description = value
end


function LogConfig:setPath(value)
        self.path = value
end


function LogConfig:setFileName(value)
        self.fileName = value
end


-- throws Exception
function LogConfig:getTypeVector()
        local logKeyVector = BasicArrayListD.new()
        return logKeyVector
end

return LogConfig

