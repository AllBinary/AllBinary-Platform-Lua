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

local UserDomNode = {}
package.loaded["org.allbinary.business.user.UserDomNode"] = UserDomNode

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
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")

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

-- class table UserDomNode is declared before the requires
UserDomNode.__index = UserDomNode
UserDomNode.className = "UserDomNode"
UserDomNode.javaClassName = "org.allbinary.business.user.UserDomNode"
UserDomNode.java_implements = " DomNodeInterface "
UserDomNode.java_interfaces = function() return {DomNodeInterface} end

function UserDomNode:_init_fields()
    if self.dataMappingInterface == nil then self.dataMappingInterface = nil end
end


function UserDomNode._jinit(self, dataMappingInterface)
    UserDomNode._init_fields(self)
        self.dataMappingInterface = dataMappingInterface
    return self
end

function UserDomNode.new(...)
    local self = setmetatable({}, UserDomNode)
    UserDomNode._jinit(self, ...)
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

