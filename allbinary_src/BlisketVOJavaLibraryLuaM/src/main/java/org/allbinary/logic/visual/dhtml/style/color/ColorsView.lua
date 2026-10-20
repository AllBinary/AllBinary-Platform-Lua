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
-- package org.allbinary.logic.visual.dhtml.style.color

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
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

local ColorsView = {}
ColorsView.__index = ColorsView
ColorsView.className = "ColorsView"

function ColorsView:_init_fields()
    self.commonPhoneStrings = CommonPhoneStrings.getInstance()
    self.HEXRADIX = 16
    self.MAX = 255
    self.delta = 20
end


function ColorsView.new()
    local self = setmetatable({}, ColorsView)
    self:_init_fields()
    return self
end


-- throws Exception
function ColorsView:getColorNode(document, redIndex, greenIndex, blueIndex)
        local hexColorStringBuffer = StringMaker.new()
        if redIndex < self.HEXRADIX then
            hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
        end
        hexColorStringBuffer:append(Integer.toString(redIndex, self.HEXRADIX))
        if greenIndex < self.HEXRADIX then
            hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
        end
        hexColorStringBuffer:append(Integer.toString(greenIndex, self.HEXRADIX))
        if blueIndex < self.HEXRADIX then
            hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
        end
        hexColorStringBuffer:append(Integer.toString(blueIndex, self.HEXRADIX))
        local colorNode = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, tostring(hexColorStringBuffer))
        return colorNode
end


-- throws Exception
function ColorsView:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, ColorsData.getInstance().NAME, "RGB Colors In Hex")
        local blackNode = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, "000000")
        node:appendChild(blackNode)
        for index = 0, self.MAX - 1, self.delta do
            local hexColorStringBuffer = StringMaker.new()
            if index < self.HEXRADIX then
                hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
            end
            hexColorStringBuffer:append(Integer.toString(index, self.HEXRADIX))
            if index < self.HEXRADIX then
                hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
            end
            hexColorStringBuffer:append(Integer.toString(index, self.HEXRADIX))
            if index < self.HEXRADIX then
                hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
            end
            hexColorStringBuffer:append(Integer.toString(index, self.HEXRADIX))
            local colorNode = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, tostring(hexColorStringBuffer))
            node:appendChild(colorNode)
        end
        local whiteNode = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, "FFFFFF")
        node:appendChild(whiteNode)
        for blueIndex = java_idiv(self.MAX, 2), self.MAX - 1, self.delta do
            for greenIndex = 0, java_idiv(self.MAX, 2) - 1, self.delta do
                for redIndex = 0, java_idiv(self.MAX, 2) - 1, self.delta do
                    node:appendChild(self:getColorNode(document, redIndex, greenIndex, blueIndex))
                end
            end
        end
        for redIndex = java_idiv(self.MAX, 2), self.MAX - 1, self.delta do
            for greenIndex = 0, java_idiv(self.MAX, 2) - 1, self.delta do
                for blueIndex = 0, java_idiv(self.MAX, 2) - 1, self.delta do
                    node:appendChild(self:getColorNode(document, redIndex, greenIndex, blueIndex))
                end
            end
        end
        for greenIndex = java_idiv(self.MAX, 2), self.MAX - 1, self.delta do
            for redIndex = 0, java_idiv(self.MAX, 2) - 1, self.delta do
                for blueIndex = 0, java_idiv(self.MAX, 2) - 1, self.delta do
                    node:appendChild(self:getColorNode(document, redIndex, greenIndex, blueIndex))
                end
            end
        end
        for greenIndex = 0, self.MAX - 1, 2 * self.delta do
            for redIndex = 0, self.MAX - 1, 2 * self.delta do
                for blueIndex = 0, self.MAX - 1, 2 * self.delta do
                    node:appendChild(self:getColorNode(document, redIndex, greenIndex, blueIndex))
                end
            end
        end
        return node
end

return ColorsView

