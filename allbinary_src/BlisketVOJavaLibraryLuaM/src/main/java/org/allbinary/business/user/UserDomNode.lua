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
-- package org.allbinary.business.user

-- local HashMap = require("java.util.HashMap")
local EntryData = require("org.allbinary.business.entry.EntryData")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Document = require("org.w3c.dom.Document")
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

local UserDomNode = {}
UserDomNode.__index = UserDomNode
UserDomNode.className = "UserDomNode"

function UserDomNode:_init_fields()
    self.dataMappingInterface = nil
end


function UserDomNode.new(dataMappingInterface)
    local self = setmetatable({}, UserDomNode)
    self:_init_fields()
        self.dataMappingInterface = dataMappingInterface
    return self
end


-- throws Exception
function UserDomNode:toXmlNode(document)
        local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
        local hashMap = self.dataMappingInterface:toHashMap()
        hashMap:put(EntryData.getInstance().LASTMODIFIED, EMPTY_STRING)
        hashMap:put(EntryData.getInstance().ENCRYPTION, EMPTY_STRING)
        hashMap:put(UserData.PASSWORD, EMPTY_STRING)
        return ModDomHelper.createNameValueNodes(document, UserData.NAME, hashMap)
end


-- throws Exception
function UserDomNode:toXmlDoc()
        return nil
end


-- throws Exception
function UserDomNode:view()
        return nil
end

return UserDomNode

