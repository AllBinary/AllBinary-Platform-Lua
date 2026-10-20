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
-- package org.allbinary.input.automation.module.actions.script.condition.processors.output

-- local HashMap = require("java.util.HashMap")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local BasicProfileActionScriptOutput = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.BasicProfileActionScriptOutput")
local ImageActionScriptOutputInterface = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputInterface")

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

local ImageActionScriptOutput = {}
ImageActionScriptOutput.__index = ImageActionScriptOutput
ImageActionScriptOutput.className = "ImageActionScriptOutput"
setmetatable(ImageActionScriptOutput, {__index = BasicProfileActionScriptOutput})

function ImageActionScriptOutput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.saved = false
    self.display = false
    self.imageTypes = nil
    self.actionScriptOutputJPanel = nil
end

function ImageActionScriptOutput.new(...)
    local count = select("#", ...)
    if count == 1 then return ImageActionScriptOutput._new1(...)
    elseif count == 0 then return ImageActionScriptOutput._new0(...)
    end
end


function ImageActionScriptOutput._new1(node)
    local self = setmetatable(BasicProfileActionScriptOutput.new(ImageActionScriptOutput.NAME, node), ImageActionScriptOutput)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        local actionNode = DomSearchHelper.getNode(ImageActionScriptOutputData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():compareTo(ImageActionScriptOutputData.SAVE) == 0 then
                    local booleanString = DomNodeHelper.getTextNodeValue(childNode)
                    self:setSaved(booleanString)
                elseif childNode:getNodeName():compareTo(ImageActionScriptOutputData.DISPLAY) == 0 then
                    local booleanString = DomNodeHelper.getTextNodeValue(childNode)
                    self:setSaved(booleanString)
                elseif childNode:getNodeName():compareTo(ImageActionScriptOutputData.TYPES) == 0 then
                    self:setImageTypes(ImageTypes.new(childNode))
                else
                    error(java_exception("Exception", "Action Script Output Unknown Node"), 0)
                end
            end
        else
            error(java_exception("Exception", "Action Script Output Node Null"), 0)
        end
        self:setAllowsChildren(false)
        self.actionScriptOutputJPanel = ImageActionScriptOutputJPanel.new(self)
    return self
end


function ImageActionScriptOutput._new0()
    local self = setmetatable(BasicProfileActionScriptOutput.new(ImageActionScriptOutput.NAME), ImageActionScriptOutput)
    self:_init_fields()
        -- super(...) made self above
        self:setImageTypes(ImageTypes.new())
        self:setAllowsChildren(false)
        self.actionScriptOutputJPanel = ImageActionScriptOutputJPanel.new(self)
    return self
end


function ImageActionScriptOutput:getActionScriptOutputJPanel()
        return self.actionScriptOutputJPanel
end


function ImageActionScriptOutput:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(ImageActionScriptOutputData.DISPLAY, tostring(self:isDisplay()))
        hashMap:put(ImageActionScriptOutputData.SAVE, tostring(self:isSaved()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function ImageActionScriptOutput:toXmlNode(document)
        local node = BasicProfileActionScriptOutput.toXmlNode(self, document)
        local newNode = ModDomHelper.createNodeWithValueNodes(document, ImageActionScriptOutputData.NAME, self:toHashMap())
        newNode:appendChild(self:getImageTypes():toXmlNode(document))
        node:appendChild(newNode)
        return node
end


-- throws Exception
function ImageActionScriptOutput:process(frame)
        ImageActionScriptOutputProcessor.process(self, frame)
end


function ImageActionScriptOutput:showDialog()
        self.actionScriptOutputJPanel:getCapturedImageActionJDialog():setVisible(true)
end


function ImageActionScriptOutput:isSaved()
        return self.saved
end


function ImageActionScriptOutput:setSaved(saved)
        self.saved = saved
end


function ImageActionScriptOutput:isDisplay()
        return self.display
end


function ImageActionScriptOutput:setDisplay(display)
        self.display = display
end


function ImageActionScriptOutput:future_toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(" Is Save: ")
        stringBuffer:appendboolean(self:isSaved())
        stringBuffer:append(" Is Display: ")
        stringBuffer:appendboolean(self:isDisplay())
        stringBuffer:append(" ")
        stringBuffer:append(tostring(self:getImageTypes()))
        return tostring(stringBuffer)
end


function ImageActionScriptOutput:log()
        self.logUtil:putF(self:future_toString(), self, "log")
end


function ImageActionScriptOutput:getImageTypes()
        return self.imageTypes
end


function ImageActionScriptOutput:setImageTypes(imageTypes)
        self.imageTypes = imageTypes
end

ImageActionScriptOutput.NAME = "Captures"

return ImageActionScriptOutput

