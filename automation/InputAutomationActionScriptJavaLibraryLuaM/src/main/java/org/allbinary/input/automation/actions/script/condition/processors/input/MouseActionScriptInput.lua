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
-- package org.allbinary.input.automation.actions.script.condition.processors.input

-- local awt = require("java.awt")
-- local InputEvent = require("java.awt.event.InputEvent")
-- local HashMap = require("java.util.HashMap")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local BasicProfileActionScriptInput = require("org.allbinary.input.automation.actions.script.condition.processors.input.BasicProfileActionScriptInput")
local MouseActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputInterface")

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

local MouseActionScriptInput = {}
MouseActionScriptInput.__index = MouseActionScriptInput
MouseActionScriptInput.className = "MouseActionScriptInput"
setmetatable(MouseActionScriptInput, {__index = BasicProfileActionScriptInput})

function MouseActionScriptInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.point = nil
    self.buttons = 0
    self.mouseActionScriptInputJPanel = nil
end

function MouseActionScriptInput.new(...)
    local count = select("#", ...)
    if count == 1 then return MouseActionScriptInput._new1(...)
    elseif count == 0 then return MouseActionScriptInput._new0(...)
    end
end


function MouseActionScriptInput._new1(node)
    local self = setmetatable(BasicProfileActionScriptInput.new(MouseActionScriptInput.NAME, node), MouseActionScriptInput)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.point = Point.new()
        local actionNode = DomSearchHelper.getNode(MouseActionScriptInputData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():compareTo(MouseActionScriptInputData.BUTTONS) == 0 then
                    local buttons = DomNodeHelper.getTextNodeValue(childNode)
                    self:setButtonClicks(math.tointeger(tostring(buttons) // 1))
                elseif childNode:getNodeName():compareTo(MouseActionScriptInputData.MOVE) == 0 then
                    local mouseXNode = DomSearchHelper.getNode(MouseActionScriptInputData.MOVE_X, childNode:getChildNodes())
                    local mouseXString = DomNodeHelper.getTextNodeValue(mouseXNode)
                    local mouseXInteger = tostring(mouseXString)
                    local mouseYNode = DomSearchHelper.getNode(MouseActionScriptInputData.MOVE_Y, childNode:getChildNodes())
                    local mouseYString = DomNodeHelper.getTextNodeValue(mouseYNode)
                    local mouseYInteger = tostring(mouseYString)
                    local newPoint = Point.new(math.tointeger(mouseXInteger // 1), math.tointeger(mouseYInteger // 1))
                    self:setPoint(newPoint)
                else
                    error(java_exception("Exception", "Action Script Input Unknown Node"), 0)
                end
            end
        else
            error(java_exception("Exception", "Action Script Input Node Null"), 0)
        end
        self:setAllowsChildren(false)
        self.mouseActionScriptInputJPanel = MouseActionScriptInputJPanel.new(self)
    return self
end


function MouseActionScriptInput._new0()
    local self = setmetatable(BasicProfileActionScriptInput.new(MouseActionScriptInput.NAME), MouseActionScriptInput)
    self:_init_fields()
        -- super(...) made self above
        self.point = Point.new()
        self:setAllowsChildren(false)
        self.mouseActionScriptInputJPanel = MouseActionScriptInputJPanel.new(self)
    return self
end


function MouseActionScriptInput:setPoint(point)
        self.point = point
end


function MouseActionScriptInput:getPoint()
        return self.point
end


function MouseActionScriptInput:getButtonClicks()
        return self.buttons
end


function MouseActionScriptInput:setButtonClicks(buttons)
        self.buttons = buttons
end


function MouseActionScriptInput:showDialog()
        self.mouseActionScriptInputJPanel:getMouseActionJDialog():setVisible(true)
end


function MouseActionScriptInput:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(MouseActionScriptInputData.BUTTONS, tostring(self:getButtonClicks()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function MouseActionScriptInput:toXmlNode(document)
        local node = BasicProfileActionScriptInput.toXmlNode(self, document)
        local mouseNode = ModDomHelper.createNodeWithValueNodes(document, MouseActionScriptInputData.NAME, self:toHashMap())
        node:appendChild(mouseNode)
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(MouseActionScriptInputData.MOVE_X, tostring(self:getPoint().x))
        hashMap:put(MouseActionScriptInputData.MOVE_Y, tostring(self:getPoint().y))
        mouseNode:appendChild(ModDomHelper.createNodeWithValueNodes(document, MouseActionScriptInputData.MOVE, hashMap))
        return node
end


-- throws Exception
function MouseActionScriptInput:process(frame)
        MouseInputAutomationProcessor.process(self)
end


function MouseActionScriptInput:log()
        local buttonStringBuffer = StringMaker.new()
        buttonStringBuffer:append("1: ")
        local booleanFactory = BooleanFactory.getInstance()
        if (self:getButtonClicks() & InputEvent.BUTTON1_MASK) ~= 0 then
            buttonStringBuffer:append(booleanFactory.TRUE_STRING)
        else
            buttonStringBuffer:append(booleanFactory.FALSE_STRING)
        end
        buttonStringBuffer:append(" 2: ")
        if (self:getButtonClicks() & InputEvent.BUTTON2_MASK) ~= 0 then
            buttonStringBuffer:append(booleanFactory.TRUE_STRING)
        else
            buttonStringBuffer:append(booleanFactory.FALSE_STRING)
        end
        buttonStringBuffer:append(" 3: ")
        if (self:getButtonClicks() & InputEvent.BUTTON3_MASK) ~= 0 then
            buttonStringBuffer:append(booleanFactory.TRUE_STRING)
        else
            buttonStringBuffer:append(booleanFactory.FALSE_STRING)
        end
        self.logUtil:putF("Input Type: " .. self:getInputRobotInterface():getName() .. " Point: " .. tostring(self:getPoint()) .. " Buttons Clicked: " .. tostring(buttonStringBuffer), self, "log")
end

MouseActionScriptInput.NAME = "Mouse"

return MouseActionScriptInput

