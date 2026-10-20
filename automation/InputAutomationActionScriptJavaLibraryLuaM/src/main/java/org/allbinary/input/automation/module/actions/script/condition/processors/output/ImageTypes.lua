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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local InputImageType = require("org.allbinary.input.media.image.InputImageType")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local ImageTypes = {}
ImageTypes.__index = ImageTypes
ImageTypes.className = "ImageTypes"

function ImageTypes:_init_fields()
    self.vector = BasicArrayListD.new()
end

function ImageTypes.new(...)
    local count = select("#", ...)
    if count == 0 then return ImageTypes._new0(...)
    elseif count == 1 then return ImageTypes._new1(...)
    end
end


function ImageTypes._new0()
    local self = setmetatable({}, ImageTypes)
    self:_init_fields()
    return self
end


function ImageTypes._new1(node)
    local self = setmetatable({}, ImageTypes)
    self:_init_fields()
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local childNode = nodeList:item(index)
            if childNode:getNodeName():compareTo(ImageActionScriptOutputData.TYPE) == 0 then
                local nextImageTypeString = DomNodeHelper.getTextNodeValue(childNode)
                self:getVector():add(InputImageType.getInstance(nextImageTypeString))
            else
                error(java_exception("Exception", "ImageTypes Unknown Node"), 0)
            end
        end
    return self
end


function ImageTypes.valueOf(anyType)
        local imageTypes = ImageTypes.new()
        for index = 0, (anyType.n or #anyType) - 1 do
            local imageType = InputImageType.getInstance(anyType[index + 1])
            imageTypes:getVector():add(imageType)
        end
        return imageTypes
end


function ImageTypes:getVector()
        return self.vector
end


-- throws Exception
function ImageTypes:toXmlNode(document)
        local newNode = document:createElement(ImageActionScriptOutputData.TYPES)
        local size = self.vector:size()
        for index = 0, size - 1 do
            local imageType = self.vector:get(index)
            newNode:appendChild(ModDomHelper.createTextNode(document, ImageActionScriptOutputData.TYPE, imageType:getName()))
        end
        return newNode
end


function ImageTypes:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("ImageTypes: ")
        local size = self.vector:size()
        for index = 0, size - 1 do
            local imageType = self.vector:get(index)
            stringBuffer:append(imageType:getName())
            if index < size - 1 then
                stringBuffer:append(", ")
            end
        end
        return tostring(stringBuffer)
end
ImageTypes.__tostring = function(self) return self:toString() end

return ImageTypes

