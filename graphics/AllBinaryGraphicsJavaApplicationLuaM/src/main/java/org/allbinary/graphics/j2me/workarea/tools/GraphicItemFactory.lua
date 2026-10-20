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
-- package org.allbinary.graphics.j2me.workarea.tools

-- local HashMap = require("java.util.HashMap")
local LOGGING = require("org.allbinary.log.LOGGING")
local StdUtil = require("org.allbinary.logic.StdUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
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

local GraphicItemFactory = {}
GraphicItemFactory.__index = GraphicItemFactory
GraphicItemFactory.className = "GraphicItemFactory"

function GraphicItemFactory:_init_fields()
    self.graphicItems = nil
    self.DEFAULT = SelectionToolFactory.new()
end


function GraphicItemFactory.getInstance()
        return GraphicItemFactory.instance
end


function GraphicItemFactory.new()
    local self = setmetatable({}, GraphicItemFactory)
    self:_init_fields()
        self.graphicItems = StdUtil.getInstance():createHashMap()
        self.graphicItems:put(LinesGraphicItem.getStaticName(), LinesGraphicItemFactory.new())
    return self
end


-- Java overloaded method: Lua keeps the last definition
function GraphicItemFactory:getInstance(itemName)
        local graphicsItemInterfaceFactoryInterface = self.graphicItems:get(itemName)
        if graphicsItemInterfaceFactoryInterface == nil then
            graphicsItemInterfaceFactoryInterface = self.DEFAULT
        end
        return graphicsItemInterfaceFactoryInterface
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function GraphicItemFactory:getInstance(graphicItemNodeList)
        local numberOfItems = graphicItemNodeList:size()
        local graphicItemHashMap = StdUtil.getInstance():createHashMap()
        if self.LOGGING:contains(self.LOGGING.MENUEVENT) then
        end
        for index = 0, numberOfItems - 1 do
            local graphicItem = GraphicItemBuilder.getInstance(graphicItemNodeList:get(index))
            graphicItemHashMap:put(graphicItem:getTreeNode(), graphicItem)
        end
        return graphicItemHashMap
end

GraphicItemFactory.instance = GraphicItemFactory.new()

return GraphicItemFactory

