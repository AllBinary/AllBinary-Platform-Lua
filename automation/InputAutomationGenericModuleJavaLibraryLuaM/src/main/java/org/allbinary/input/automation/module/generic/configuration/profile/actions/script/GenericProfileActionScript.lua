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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions.script

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ProfileActionScriptNodeInterface = require("org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface")
local ProfileActionScriptConditionFactory = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionFactory")
local ProfileActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local GenericProfileActionData = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData")
local GenericProfileActionJPanel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

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

local GenericProfileActionScript = {}
GenericProfileActionScript.__index = GenericProfileActionScript
GenericProfileActionScript.className = "GenericProfileActionScript"
setmetatable(GenericProfileActionScript, {__index = DefaultMutableTreeNode})

function GenericProfileActionScript:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.genericProfileActionJPanel = nil
    self.profileActionConditionInterfaceVector = nil
end

function GenericProfileActionScript.new(...)
    local count = select("#", ...)
    if count == 2 then return GenericProfileActionScript._new2(...)
    elseif count == 1 then return GenericProfileActionScript._new1(...)
    end
end


function GenericProfileActionScript._new2(genericProfileActionJPanel, node)
    local self = setmetatable(DefaultMutableTreeNode.new(GenericProfileActionScript.NAME), GenericProfileActionScript)
    self:_init_fields()
        -- super(...) made self above
        self.genericProfileActionJPanel = genericProfileActionJPanel
        self:setProfileActionConditionInterfaceVector(BasicArrayListD.new())
        local actionScriptNode = DomSearchHelper.getNode(GenericProfileActionData.SCRIPT, node:getChildNodes())
        if actionScriptNode ~= nil then
            local nodeList = actionScriptNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local actionConditionNode = nodeList:item(index)
                if actionConditionNode:getNodeType() == Node.ELEMENT_NODE then
                    self:addCondition(ProfileActionScriptConditionFactory.getInstance(actionConditionNode))
                end
            end
        else
            error(java_exception("Exception", "Profile Action Script Node Null"), 0)
        end
    return self
end


function GenericProfileActionScript._new1(genericProfileActionJPanel)
    local self = setmetatable(DefaultMutableTreeNode.new(), GenericProfileActionScript)
    self:_init_fields()
        self.genericProfileActionJPanel = genericProfileActionJPanel
        self:setProfileActionConditionInterfaceVector(BasicArrayListD.new())
    return self
end


function GenericProfileActionScript:addCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "addCondition")
        self:getProfileActionConditionInterfaceVector():add(profileActionScriptNodeInterface)
        self:add(profileActionScriptNodeInterface)
end


function GenericProfileActionScript:removeCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "removeCondition")
        self:getProfileActionConditionInterfaceVector():remove(profileActionScriptNodeInterface)
        self:remove(profileActionScriptNodeInterface)
end


function GenericProfileActionScript:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


function GenericProfileActionScript:getProfileActionConditionInterfaceVector()
        return self.profileActionConditionInterfaceVector
end


function GenericProfileActionScript:setProfileActionConditionInterfaceVector(profileActionConditionInterfaceVector)
        self.profileActionConditionInterfaceVector = profileActionConditionInterfaceVector
end


-- throws Exception
function GenericProfileActionScript:toXmlNode(document)
        local node = document:createElement(GenericProfileActionData.SCRIPT)
        local vector = self:getProfileActionConditionInterfaceVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local profileActionConditionInterface = vector:get(index)
            node:appendChild(profileActionConditionInterface:toXmlNode(document))
        end
        return node
end

GenericProfileActionScript.NAME = "Root"

return GenericProfileActionScript

