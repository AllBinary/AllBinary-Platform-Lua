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

local ColorsView = {}
package.loaded["org.allbinary.logic.visual.dhtml.style.color.ColorsView"] = ColorsView

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

local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local ColorData = java_lazy("org.allbinary.logic.visual.dhtml.style.color.ColorData")
local ColorsData = java_lazy("org.allbinary.logic.visual.dhtml.style.color.ColorsData")

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

-- class table ColorsView is declared before the requires
ColorsView.__index = ColorsView
ColorsView.className = "ColorsView"
ColorsView.javaClassName = "org.allbinary.logic.visual.dhtml.style.color.ColorsView"
ColorsView.java_implements = " DomNodeInterface "
ColorsView.java_interfaces = function() return {DomNodeInterface} end

function ColorsView:_init_fields()
    self.commonPhoneStrings = CommonPhoneStrings.getInstance()
    self.HEXRADIX = 16
    self.MAX = 255
    self.delta = 20
end


function ColorsView._jinit(self)
    ColorsView._init_fields(self)
    return self
end

function ColorsView.new(...)
    local self = setmetatable({}, ColorsView)
    ColorsView._jinit(self, ...)
    return self
end


-- throws Exception
function ColorsView:getColorNode(document, redIndex, greenIndex, blueIndex)
        local hexColorStringBuffer = StringMaker.new()
        if redIndex < self.HEXRADIX then
            hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
        end
        hexColorStringBuffer:append(require("java.lang.Integer").toString(redIndex, self.HEXRADIX))
        if greenIndex < self.HEXRADIX then
            hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
        end
        hexColorStringBuffer:append(require("java.lang.Integer").toString(greenIndex, self.HEXRADIX))
        if blueIndex < self.HEXRADIX then
            hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
        end
        hexColorStringBuffer:append(require("java.lang.Integer").toString(blueIndex, self.HEXRADIX))
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
            hexColorStringBuffer:append(require("java.lang.Integer").toString(index, self.HEXRADIX))
            if index < self.HEXRADIX then
                hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
            end
            hexColorStringBuffer:append(require("java.lang.Integer").toString(index, self.HEXRADIX))
            if index < self.HEXRADIX then
                hexColorStringBuffer:append(self.commonPhoneStrings.ZERO)
            end
            hexColorStringBuffer:append(require("java.lang.Integer").toString(index, self.HEXRADIX))
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

