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
-- package org.allbinary.logic.visual.transform.info

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local Attr = require("org.w3c.dom.Attr")
local Document = require("org.w3c.dom.Document")
local NamedNodeMap = require("org.w3c.dom.NamedNodeMap")
local Node = require("org.w3c.dom.Node")
local TransformInfoDomNode = require("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoDomNodeView = {}
TransformInfoDomNodeView.__index = TransformInfoDomNodeView
TransformInfoDomNodeView.className = "TransformInfoDomNodeView"
setmetatable(TransformInfoDomNodeView, {__index = TransformInfoDomNode})

function TransformInfoDomNodeView.new(...)
    local count = select("#", ...)
    if count == 2 then return TransformInfoDomNodeView._new2(...)
    elseif count == 1 then return TransformInfoDomNodeView._new1(...)
    elseif count == 2 then return TransformInfoDomNodeView._new2(...)
    elseif count == 1 then return TransformInfoDomNodeView._new1(...)
    end
end


function TransformInfoDomNodeView._new2(transformInfoInterface, mapping)
    local self = setmetatable(TransformInfoDomNode.new(transformInfoInterface, mapping), TransformInfoDomNodeView)
        -- super(...) made self above
    return self
end


function TransformInfoDomNodeView._new1(transformInfoInterface)
    local self = setmetatable(TransformInfoDomNode.new(transformInfoInterface), TransformInfoDomNodeView)
        -- super(...) made self above
    return self
end


function TransformInfoDomNodeView._new2(name, mappedName)
    local self = setmetatable(TransformInfoDomNode.new(name, mappedName), TransformInfoDomNodeView)
        -- super(...) made self above
    return self
end


function TransformInfoDomNodeView._new1(name)
    local self = setmetatable(TransformInfoDomNode.new(name, nil), TransformInfoDomNodeView)
        -- super(...) made self above
    return self
end


-- throws Exception
function TransformInfoDomNodeView:toXmlNode(document)
        local transformInfoData = TransformInfoData.getInstance()
        local subViewNode = document:createElement(transformInfoData.NAME)
        local viewNameAttr = document:createAttribute(transformInfoData.NAME)
        viewNameAttr:setValue(self:getTransformInfoInterface():getName())
        local componentNodeAttributes = subViewNode:getAttributes()
        componentNodeAttributes:setNamedItem(viewNameAttr)
        if self:getMappedName() ~= nil then
            local mappedNameAttr = document:createAttribute(transformInfoData.MAPPED)
            mappedNameAttr:setValue(self:getMappedName())
            componentNodeAttributes:setNamedItem(mappedNameAttr)
        end
        return subViewNode
end

return TransformInfoDomNodeView

