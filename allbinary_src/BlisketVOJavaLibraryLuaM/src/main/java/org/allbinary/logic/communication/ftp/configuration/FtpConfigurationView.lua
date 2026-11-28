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
-- package org.allbinary.logic.communication.ftp.configuration

local FtpConfigurationView = {}
package.loaded["org.allbinary.logic.communication.ftp.configuration.FtpConfigurationView"] = FtpConfigurationView

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

local HashMap = java_lazy("java.util.HashMap")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local FtpConfiguration = java_lazy("org.allbinary.logic.communication.ftp.configuration.FtpConfiguration")
local FtpConfigurationData = java_lazy("org.allbinary.logic.communication.ftp.configuration.FtpConfigurationData")
local FtpConfigurationInterface = java_lazy("org.allbinary.logic.communication.ftp.configuration.FtpConfigurationInterface")
local FtpConfigurationMapping = java_lazy("org.allbinary.logic.communication.ftp.configuration.FtpConfigurationMapping")

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

-- class table FtpConfigurationView is declared before the requires
FtpConfigurationView.__index = FtpConfigurationView
FtpConfigurationView.className = "FtpConfigurationView"
FtpConfigurationView.javaClassName = "org.allbinary.logic.communication.ftp.configuration.FtpConfigurationView"
FtpConfigurationView.java_implements = " DomNodeInterface "
FtpConfigurationView.java_interfaces = function() return {DomNodeInterface} end

function FtpConfigurationView:_init_fields()
    if self.ftpConfigurationInterface == nil then self.ftpConfigurationInterface = nil end
end

function FtpConfigurationView._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return FtpConfigurationView._new1(self, ...)
    end
    error("No constructor of FtpConfigurationView takes " .. count .. " arguments")
end

function FtpConfigurationView.new(...)
    local self = setmetatable({}, FtpConfigurationView)
    FtpConfigurationView._jinit(self, ...)
    return self
end

function FtpConfigurationView._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return FtpConfigurationView._new1_1(self, ...) end
    return FtpConfigurationView._new1_2(self, ...)
end


function FtpConfigurationView._new1_1(self, node)
    FtpConfigurationView._init_fields(self)
        self:setFtpConfigurationInterface(FtpConfiguration.new())
        local chileNodeList = node:getChildNodes()
        local server = DomNodeHelper.getTextNodeValue(FtpConfigurationData.SERVER, chileNodeList)
        self:getFtpConfigurationInterface():setServer(server)
        local userName = DomNodeHelper.getTextNodeValue(FtpConfigurationData.USERNAME, chileNodeList)
        self:getFtpConfigurationInterface():setUserName(userName)
        local password = DomNodeHelper.getTextNodeValue(FtpConfigurationData.PASSWORD, chileNodeList)
        self:getFtpConfigurationInterface():setPassword(password)
        local path = DomNodeHelper.getTextNodeValue(FtpConfigurationData.PATH, chileNodeList)
        self:getFtpConfigurationInterface():setPath(path)
    return self
end


function FtpConfigurationView._new1_2(self, ftpConfigurationInterface)
    FtpConfigurationView._init_fields(self)
        self:setFtpConfigurationInterface(ftpConfigurationInterface)
    return self
end


-- throws Exception
function FtpConfigurationView:toXmlNode(document)
        local ftpConfigurationMapping = FtpConfigurationMapping.new(self:getFtpConfigurationInterface())
        local hashMap = ftpConfigurationMapping:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, FtpConfigurationData.NAME, hashMap)
        return node
end


function FtpConfigurationView:getFtpConfigurationInterface()
        return self.ftpConfigurationInterface
end


function FtpConfigurationView:setFtpConfigurationInterface(ftpConfigurationInterface)
        self.ftpConfigurationInterface = ftpConfigurationInterface
end

return FtpConfigurationView

