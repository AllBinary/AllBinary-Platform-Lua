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

local EntryData = require("org.allbinary.business.entry.EntryData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local BooleanUtil = require("org.allbinary.logic.java.bool.BooleanUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogConfig = {}
LogConfig.__index = LogConfig
LogConfig.className = "LogConfig"

function LogConfig:_init_fields()
    self.isEnabled = nil
    self.name = nil
    self.description = nil
    self.path = nil
    self.fileName = nil
end

function LogConfig.new(...)
    local count = select("#", ...)
    if count == 4 then return LogConfig._new4(...)
    elseif count == 1 then return LogConfig._new1(...)
    end
end


function LogConfig._new4(aName, aDescription, aPath, aFileName)
    local self = setmetatable({}, LogConfig)
    self:_init_fields()
        self.isEnabled = false
        self.name = aName
        self.description = aDescription
        self.path = aPath
        self.fileName = aFileName
    return self
end


function LogConfig._new1(node)
    local self = setmetatable({}, LogConfig)
    self:_init_fields()
        local enabledValueNode = DomSearchHelper.getNode(EntryData.getInstance().ENABLE, node:getChildNodes())
        local isEnabledString = DomNodeHelper.getTextNodeValue(enabledValueNode)
        self.isEnabled = BooleanUtil.getInstance():getFromString(isEnabledString)
        local logConfigData = LogConfigData.getInstance()
        local nameValueNode = DomSearchHelper.getNode(logConfigData.NAME, node:getChildNodes())
        self.name = DomNodeHelper.getTextNodeValue(nameValueNode)
        local descriptionValueNode = DomSearchHelper.getNode(logConfigData.DESCRIPTION, node:getChildNodes())
        self.description = DomNodeHelper.getTextNodeValue(descriptionValueNode)
        local fileValueNode = DomSearchHelper.getNode(logConfigData.FILE, node:getChildNodes())
        self.fileName = DomNodeHelper.getTextNodeValue(fileValueNode)
    return self
end


function LogConfig:getName()
        return self.name
end


function LogConfig:isEnabled()
        return self.isEnabled
end


function LogConfig:enable()
        self.isEnabled = true
end


function LogConfig:disable()
        self.isEnabled = false
end


function LogConfig:getDescription()
        return self.description
end


function LogConfig:getFileName()
        return self.fileName
end


function LogConfig:setName(value)
        self.name = value
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

