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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions

-- local HashMap = require("java.util.HashMap")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local GenericProfileActionScript = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericProfileAction = {}
GenericProfileAction.__index = GenericProfileAction
GenericProfileAction.className = "GenericProfileAction"

function GenericProfileAction:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.name = nil
    self.genericProfileActionScript = nil
    self.genericProfileActionJPanel = nil
end

function GenericProfileAction.new(...)
    local count = select("#", ...)
    if count == 2 then return GenericProfileAction._new2(...)
    elseif count == 1 then return GenericProfileAction._new1(...)
    end
end


function GenericProfileAction._new2(genericProfileActionJPanel, node)
    local self = setmetatable({}, GenericProfileAction)
    self:_init_fields()
        local actionNameNode = DomSearchHelper.getNode(GenericProfileActionData.NAME, node:getChildNodes())
        if actionNameNode ~= nil then
            self.name = DomNodeHelper.getTextNodeValue(actionNameNode)
        else
            error(java_exception("Exception", "Profile Action Name Node Null"), 0)
        end
        self:setGenericProfileActionScript(GenericProfileActionScript.new(self.genericProfileActionJPanel, node))
    return self
end


function GenericProfileAction._new1(name)
    local self = setmetatable({}, GenericProfileAction)
    self:_init_fields()
        self.name = name
        self:setGenericProfileActionScript(GenericProfileActionScript.new(self.genericProfileActionJPanel))
    return self
end


function GenericProfileAction:getName()
        return self.name
end


function GenericProfileAction:setName(name)
        self.name = name
end


function GenericProfileAction:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(GenericProfileActionData.NAME, self.name)
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function GenericProfileAction:toXmlNode(document)
        local node = ModDomHelper.createNodeWithValueNodes(document, GenericProfileActionData.NAME, self:toHashMap())
        node:appendChild(self:getGenericProfileActionScript():toXmlNode(document))
        return node
end


function GenericProfileAction:getGenericProfileActionScript()
        return self.genericProfileActionScript
end


function GenericProfileAction:setGenericProfileActionScript(genericProfileActionScript)
        self.genericProfileActionScript = genericProfileActionScript
end

return GenericProfileAction

