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
-- package org.allbinary.input.automation.actions.script.condition

-- local ActionEvent = require("java.awt.event.ActionEvent")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local swing = require("javax.swing")
-- local TreePath = require("javax.swing.tree.TreePath")
local JTreeInterfaceFactory = require("org.allbinary.input.automation.actions.script.JTreeInterfaceFactory")
local ProfileActionScriptItem = require("org.allbinary.input.automation.actions.script.ProfileActionScriptItem")
local ProfileActionScriptNodeInterface = require("org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface")
local ProfileActionScriptProcessorInterface = require("org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface")
local GenericProfileActionScriptInputData = require("org.allbinary.input.automation.actions.script.condition.processors.input.GenericProfileActionScriptInputData")
local KeyboardActionScriptInput = require("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInput")
local MouseActionScriptInput = require("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInput")
local ProfileActionScriptInputFactory = require("org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputFactory")
local GenericProfileActionScriptOutputData = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.GenericProfileActionScriptOutputData")
local ImageActionScriptOutput = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutput")
local ProfileActionScriptOutputFactory = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local ProfileActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local BasicProfileActionScriptCondition = {}
BasicProfileActionScriptCondition.__index = BasicProfileActionScriptCondition
BasicProfileActionScriptCondition.className = "BasicProfileActionScriptCondition"
setmetatable(BasicProfileActionScriptCondition, {__index = ProfileActionScriptItem})

function BasicProfileActionScriptCondition:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.profileActionProcessorInterfaceVector = nil
    self.profileActionConditionInterfaceVector = nil
end

function BasicProfileActionScriptCondition.new(...)
    local count = select("#", ...)
    if count == 2 then return BasicProfileActionScriptCondition._new2(...)
    elseif count == 1 then return BasicProfileActionScriptCondition._new1(...)
    end
end


function BasicProfileActionScriptCondition._new2(label, node)
    local self = setmetatable(ProfileActionScriptItem.new(label, node), BasicProfileActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        self:init()
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local actionItemNode = nodeList:item(index)
            if actionItemNode:getNodeType() == Node.ELEMENT_NODE then
                if actionItemNode:getNodeName():compareTo(GenericProfileActionScriptConditionData.NAME) == 0 then
                    self:addCondition(ProfileActionScriptConditionFactory.getInstance(actionItemNode))
                elseif actionItemNode:getNodeName():compareTo(GenericProfileActionScriptInputData.NAME) == 0 then
                    self:addProcessor(ProfileActionScriptInputFactory.getInstance(actionItemNode))
                elseif actionItemNode:getNodeName():compareTo(GenericProfileActionScriptOutputData.NAME) == 0 then
                    self:addProcessor(ProfileActionScriptOutputFactory.getInstance(actionItemNode))
                end
            end
        end
    return self
end


-- throws Exception
function BasicProfileActionScriptCondition:addProcessorNodes(node)
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local processorActionItemNode = nodeList:item(index)
            if processorActionItemNode:getNodeName():compareTo(GenericProfileActionScriptInputData.NAME) == 0 then
                self:addProcessor(ProfileActionScriptInputFactory.getInstance(processorActionItemNode))
            elseif processorActionItemNode:getNodeName():compareTo(GenericProfileActionScriptOutputData.NAME) == 0 then
                self:addProcessor(ProfileActionScriptOutputFactory.getInstance(processorActionItemNode))
            end
        end
end


function BasicProfileActionScriptCondition._new1(label)
    local self = setmetatable(ProfileActionScriptItem.new(label), BasicProfileActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        self:init()
    return self
end


function BasicProfileActionScriptCondition:init()
        self:setProfileActionProcessorInterfaceVector(BasicArrayListD.new())
        self:setProfileActionConditionInterfaceVector(BasicArrayListD.new())
        self:getJPopupMenu():add(self:getConditionJPopupMenu())
        self:getJPopupMenu():add(self:getInputJPopupMenu())
        self:getJPopupMenu():add(self:getOutputJPopupMenu())
end


function BasicProfileActionScriptCondition:getConditionJPopupMenu()
        local jMenu = JMenu.new(self.NEW_CONDITION)
        local jMenuItemColorAt = JMenuItem.new(self.NEW_COLOR_AT)
        local jMenuItemAlways = JMenuItem.new(self.NEW_ALWAYS)
        local jMenuItemTimeInterval = JMenuItem.new(self.NEW_TIME_INTERVAL)
        jMenuItemColorAt:addActionListener(self)
        jMenuItemAlways:addActionListener(self)
        jMenuItemTimeInterval:addActionListener(self)
        jMenu:add(jMenuItemColorAt)
        jMenu:add(jMenuItemAlways)
        jMenu:add(jMenuItemTimeInterval)
        return jMenu
end


function BasicProfileActionScriptCondition:getInputJPopupMenu()
        local jMenu = JMenu.new(self.NEW_INPUT)
        local jMenuItemKey = JMenuItem.new(self.NEW_KEY_INPUT)
        local jMenuItemMouse = JMenuItem.new(self.NEW_MOUSE_INPUT)
        local jMenuItemJoystick = JMenuItem.new(self.NEW_JOYSTICK_INPUT)
        jMenuItemKey:addActionListener(self)
        jMenuItemMouse:addActionListener(self)
        jMenuItemJoystick:addActionListener(self)
        jMenu:add(jMenuItemKey)
        jMenu:add(jMenuItemMouse)
        jMenu:add(jMenuItemJoystick)
        return jMenu
end


function BasicProfileActionScriptCondition:getOutputJPopupMenu()
        local jMenu = JMenu.new(self.NEW_OUTPUT)
        local jMenuItemImage = JMenuItem.new(self.NEW_IMAGE_OUTPUT)
        jMenuItemImage:addActionListener(self)
        jMenu:add(jMenuItemImage)
        return jMenu
end


function BasicProfileActionScriptCondition:addProcessor(profileActionProcessorInterface)
        self.logUtil:putF(self.commonStrings.START, self, "addInput")
        self:getProfileActionProcessorInterfaceVector():add(profileActionProcessorInterface)
        self:add(profileActionProcessorInterface)
end


function BasicProfileActionScriptCondition:removeProcessor(profileActionProcessorInterface)
        self.logUtil:putF(self.commonStrings.START, self, "removeInput")
        self:getProfileActionProcessorInterfaceVector():remove(profileActionProcessorInterface)
        self:remove(profileActionProcessorInterface)
end


function BasicProfileActionScriptCondition:removeCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "removeCondition")
        self:getProfileActionConditionInterfaceVector():remove(profileActionScriptNodeInterface)
        self:remove(profileActionScriptNodeInterface)
end


function BasicProfileActionScriptCondition:addCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "addCondition")
        self:getProfileActionConditionInterfaceVector():add(profileActionScriptNodeInterface)
        self:add(profileActionScriptNodeInterface)
end


-- throws Exception
function BasicProfileActionScriptCondition:toXmlNode(document)
        local node = document:createElement(GenericProfileActionScriptConditionData.NAME)
        local profileActionConditionInterfaceVector = self:getProfileActionConditionInterfaceVector()
        local size = profileActionConditionInterfaceVector:size()
        for index = 0, size - 1 do
            local profileActionConditionInterface = profileActionConditionInterfaceVector:get(index)
            node:appendChild(profileActionConditionInterface:toXmlNode(document))
        end
        local profileActionProcessorInterfaceVector = self:getProfileActionProcessorInterfaceVector()
        local size2 = profileActionProcessorInterfaceVector:size()
        for index = 0, size2 - 1 do
            local profileActionProcessorInterface = profileActionProcessorInterfaceVector:get(index)
            node:appendChild(profileActionProcessorInterface:toXmlNode(document))
        end
        return node
end


function BasicProfileActionScriptCondition:getProfileActionConditionInterfaceVector()
        return self.profileActionConditionInterfaceVector
end


function BasicProfileActionScriptCondition:setProfileActionConditionInterfaceVector(profileActionConditionInterfaceVector)
        self.profileActionConditionInterfaceVector = profileActionConditionInterfaceVector
end


function BasicProfileActionScriptCondition:actionPerformed(actionEvent)
        local try_ok, try_error = pcall(function()
            ProfileActionScriptItem.actionPerformed(self, actionEvent)
            if actionEvent:getActionCommand():compareTo(self.DELETE) == 0 then
                if java_instanceof(self:getParent(), ProfileActionScriptNodeInterface) then
                    local profileActionScriptNodeInterface = self:getParent()
                    profileActionScriptNodeInterface:removeCondition(self)
                    JTreeInterfaceFactory.getInstance():getJTreeInterface():updateJTree()
                end
            elseif actionEvent:getActionCommand():compareTo(self.NEW_COLOR_AT) == 0 then
                self:addCondition(ColorAtActionScriptCondition.new())
                self:updateTree()
            elseif actionEvent:getActionCommand():compareTo(self.NEW_ALWAYS) == 0 then
                self:addCondition(AlwaysActionScriptCondition.new())
                self:updateTree()
            elseif actionEvent:getActionCommand():compareTo(self.NEW_TIME_INTERVAL) == 0 then
                self:addCondition(TimeIntervalActionScriptCondition.new())
                self:updateTree()
            elseif actionEvent:getActionCommand():compareTo(self.NEW_KEY_INPUT) == 0 then
                self:addProcessor(KeyboardActionScriptInput.new())
                self:updateTree()
            elseif actionEvent:getActionCommand():compareTo(self.NEW_MOUSE_INPUT) == 0 then
                self:addProcessor(MouseActionScriptInput.new())
                self:updateTree()
            elseif actionEvent:getActionCommand():compareTo(self.NEW_IMAGE_OUTPUT) == 0 then
                self:addProcessor(ImageActionScriptOutput.new())
                self:updateTree()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Error", self, "actionPerformed", e)
        end
end


function BasicProfileActionScriptCondition:getProfileActionProcessorInterfaceVector()
        return self.profileActionProcessorInterfaceVector
end


function BasicProfileActionScriptCondition:setProfileActionProcessorInterfaceVector(profileActionProcessorInterfaceVector)
        self.profileActionProcessorInterfaceVector = profileActionProcessorInterfaceVector
end


function BasicProfileActionScriptCondition:updateTree()
        JTreeInterfaceFactory.getInstance():getJTreeInterface():updateJTree()
        local treePath = TreePath.new(self)
        JTreeInterfaceFactory.getInstance():getJTreeInterface():getActionScriptJTree():expandPath(treePath)
end


-- throws Exception
function BasicProfileActionScriptCondition:shouldProcess(frame)
        local profileActionConditionInterfaceVector = self:getProfileActionConditionInterfaceVector()
        local size = profileActionConditionInterfaceVector:size()
        for index = 0, size - 1 do
            local profileActionScriptConditionInterface = profileActionConditionInterfaceVector:get(index)
            if not profileActionScriptConditionInterface:shouldProcess(frame) then
                return false
            end
        end
        return true
end


-- throws Exception
function BasicProfileActionScriptCondition:process(frame)
        self.logUtil:putF(tostring(StringMaker.new():append("Start - Processing "):appendint(self:getProfileActionProcessorInterfaceVector():size()):append(" inputs")), self, self.commonStrings.PROCESS)
        local profileActionProcessorInterfaceVector = self:getProfileActionProcessorInterfaceVector()
        local size = profileActionProcessorInterfaceVector:size()
        for index = 0, size - 1 do
            local profileActionScriptProcessorInterface = profileActionProcessorInterfaceVector:get(index)
            profileActionScriptProcessorInterface:process(frame)
        end
end

return BasicProfileActionScriptCondition

