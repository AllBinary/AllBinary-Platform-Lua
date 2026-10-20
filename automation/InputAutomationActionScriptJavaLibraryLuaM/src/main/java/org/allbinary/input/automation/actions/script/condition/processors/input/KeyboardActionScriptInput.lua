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

-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local KeySingletonFactory = require("org.allbinary.input.KeySingletonFactory")
local KeyUtil = require("org.allbinary.input.KeyUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local BasicProfileActionScriptInput = require("org.allbinary.input.automation.actions.script.condition.processors.input.BasicProfileActionScriptInput")
local KeyboardActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputInterface")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local KeyboardActionScriptInput = {}
KeyboardActionScriptInput.__index = KeyboardActionScriptInput
KeyboardActionScriptInput.className = "KeyboardActionScriptInput"
setmetatable(KeyboardActionScriptInput, {__index = BasicProfileActionScriptInput})

function KeyboardActionScriptInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.keyArray = {KeySingletonFactory.getInstance(KeyEvent.VK_0)}
    self.keyboardActionScriptInputJPanel = nil
    self.press = false
    self.release = false
    self.delayBetweenKeys = 0
end

function KeyboardActionScriptInput.new(...)
    local count = select("#", ...)
    if count == 1 then return KeyboardActionScriptInput._new1(...)
    elseif count == 0 then return KeyboardActionScriptInput._new0(...)
    end
end


function KeyboardActionScriptInput._new1(node)
    local self = setmetatable(BasicProfileActionScriptInput.new(KeyboardActionScriptInput.NAME, node), KeyboardActionScriptInput)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        local actionNode = DomSearchHelper.getNode(KeyboardActionScriptInputData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            local vector = BasicArrayListD.new()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():startsWith(KeyboardActionScriptInputData.KEY) then
                    local keyString = DomNodeHelper.getTextNodeValue(childNode)
                    vector:add(tostring(keyString))
                elseif childNode:getNodeName():compareTo(KeyboardActionScriptInputData.DELAY_BETWEEN_KEYS) == 0 then
                    local time = DomNodeHelper.getTextNodeValue(childNode)
                    self:setDelayBetweenKeys(math.tointeger(tostring(time) // 1))
                elseif childNode:getNodeName():compareTo(KeyboardActionScriptInputData.PRESS) == 0 then
                    local value = DomNodeHelper.getTextNodeValue(childNode)
                    self:setPress(tostring(value))
                elseif childNode:getNodeName():compareTo(KeyboardActionScriptInputData.RELEASE) == 0 then
                    local value = DomNodeHelper.getTextNodeValue(childNode)
                    self:setRelease(tostring(value))
                else
                    error(java_exception("Exception", "Action Script Input Unknown Node"), 0)
                end
            end
            self:setKeyArray(vector:toArrayType(java_new_array(nil, vector:size())))
        else
            error(java_exception("Exception", "Action Script Input Node Null"), 0)
        end
        self:setAllowsChildren(false)
        if not self:isPress() and not self:isRelease() then
            self:setNormal()
        end
        self.keyboardActionScriptInputJPanel = KeyboardActionScriptInputJPanel.new(self)
    return self
end


function KeyboardActionScriptInput._new0()
    local self = setmetatable(BasicProfileActionScriptInput.new(KeyboardActionScriptInput.NAME), KeyboardActionScriptInput)
    self:_init_fields()
        -- super(...) made self above
        if not self:isPress() and not self:isRelease() then
            self:setNormal()
        end
        self:setAllowsChildren(false)
        self:setTime(120)
        self.keyboardActionScriptInputJPanel = KeyboardActionScriptInputJPanel.new(self)
    return self
end


function KeyboardActionScriptInput:getDelayBetweenKeys()
        return self.delayBetweenKeys
end


function KeyboardActionScriptInput:setDelayBetweenKeys(delayBetweenKeys)
        self.delayBetweenKeys = delayBetweenKeys
end


function KeyboardActionScriptInput:isPress()
        return self.press
end


function KeyboardActionScriptInput:setPress(press)
        self.press = press
end


function KeyboardActionScriptInput:isRelease()
        return self.release
end


function KeyboardActionScriptInput:setRelease(release)
        self.release = release
end


function KeyboardActionScriptInput:isNormal()
        return self:isRelease() and self:isPress()
end


function KeyboardActionScriptInput:setNormal()
        self:setPress(true)
        self:setRelease(true)
end


function KeyboardActionScriptInput:getKeyArray()
        return self.keyArray
end


function KeyboardActionScriptInput:setKeyArray(keyArray)
        if keyArray ~= nil then
            self.logUtil:putF(CommonLabels.getInstance().START + (keyArray.n or #keyArray), self, "setKeyArray")
        end
        self.keyArray = keyArray
end


function KeyboardActionScriptInput:showDialog()
        self.keyboardActionScriptInputJPanel:getKeyActionJDialog():setVisible(true)
end


function KeyboardActionScriptInput:getText()
        return self:getText(self:getKeyArray())
end


function KeyboardActionScriptInput:setText(text)
        self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. text, self, "setText")
        local integerArray = self:integerArrayValue(text)
        self:setKeyArray(integerArray)
end


-- Java overloaded method: Lua keeps the last definition
function KeyboardActionScriptInput.getText(integerArray)
        local index = 0
        local stringBuffer = StringMaker.new()
        while index < (integerArray.n or #integerArray) do
            local nextInteger = integerArray[index + 1]
            if KeyUtil.isNormallyDisplayed(nextInteger) then
                stringBuffer:append(KeyEvent.getKeyText(nextInteger))
            else
                stringBuffer:append("&#" .. tostring(nextInteger) .. ";")
            end
            index = index + 1
        end
        return tostring(stringBuffer)
end


function KeyboardActionScriptInput:integerArrayValue(text)
        self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. text, self, "integerArrayValue")
        local vector = BasicArrayListD.new()
        local index = 0
        while index < #text do
            local aChar = string.sub(text, (index) + 1, (index) + 1)
            if aChar == "&" then
                if string.sub(text, (index + 1) + 1, (index + 1) + 1) == "#" then
                    local endIndex = ((string.find(text, ";", (index + 1) + 1, true) or 0) - 1)
                    if endIndex ~= -1 then
                        local nextCharString = string.sub(text, (index + 2) + 1, endIndex)
                        self.logUtil:putF(tostring(CommonLabels.getInstance().NEXT) .. " Char String: " .. nextCharString, self, "integerArrayValue")
                        vector:add(tostring(string.sub(nextCharString, (index) + 1, #nextCharString)))
                        index = index + #nextCharString + 3
                        goto continue_N69468
                    end
                end
            end
            vector:add(KeySingletonFactory.getHashtable():get(tostring(aChar)))
            index = index + 1
            ::continue_N69468::
        end
        local integerArray = vector:toArrayType(java_new_array(nil, vector:size()))
        return integerArray
end


function KeyboardActionScriptInput:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        for index = 0, (self:getKeyArray().n or #self:getKeyArray()) - 1 do
            hashMap:put(KeyboardActionScriptInputData.KEY + index, tostring(self:getKeyArray()[index + 1]))
        end
        hashMap:put(KeyboardActionScriptInputData.DELAY_BETWEEN_KEYS, tostring(self:getDelayBetweenKeys()))
        hashMap:put(KeyboardActionScriptInputData.PRESS, tostring(self:isPress()))
        hashMap:put(KeyboardActionScriptInputData.RELEASE, tostring(self:isRelease()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function KeyboardActionScriptInput:toXmlNode(document)
        local node = BasicProfileActionScriptInput.toXmlNode(self, document)
        node:appendChild(ModDomHelper.createNodeWithValueNodes(document, KeyboardActionScriptInputData.NAME, self:toHashMap()))
        return node
end


-- throws Exception
function KeyboardActionScriptInput:process(frame)
        KeyboardInputAutomationProcessor.process(self)
end


function KeyboardActionScriptInput:log()
        self.logUtil:putF(tostring(self), self, "log")
end


function KeyboardActionScriptInput:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicProfileActionScriptInput))
        stringBuffer:append(" Text: ")
        stringBuffer:append(self:getText())
        stringBuffer:append(" isPress: ")
        stringBuffer:appendboolean(self:isPress())
        stringBuffer:append(" isRelease: ")
        stringBuffer:appendboolean(self:isRelease())
        stringBuffer:append(" Between Key Delay: ")
        stringBuffer:appendint(self:getDelayBetweenKeys())
        return tostring(stringBuffer)
end
KeyboardActionScriptInput.__tostring = function(self) return self:toString() end

KeyboardActionScriptInput.NAME = "Keyboard"

return KeyboardActionScriptInput

