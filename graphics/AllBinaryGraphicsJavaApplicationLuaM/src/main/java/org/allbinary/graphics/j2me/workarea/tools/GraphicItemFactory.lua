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

local GraphicItemFactory = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory"] = GraphicItemFactory

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

local HashMap = java_lazy("java.util.HashMap")
local LOGGING = java_lazy("org.allbinary.log.LOGGING")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Node = java_lazy("org.w3c.dom.Node")
local GraphicItemBuilder = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicItemBuilder")
local GraphicItemInterface = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local GraphicsItemInterfaceFactoryInterface = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicsItemInterfaceFactoryInterface")
local LinesGraphicItem = java_lazy("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local LinesGraphicItemFactory = java_lazy("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItemFactory")
local SelectionToolFactory = java_lazy("org.allbinary.graphics.j2me.workarea.tools.SelectionToolFactory")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

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

-- class table GraphicItemFactory is declared before the requires
GraphicItemFactory.__index = GraphicItemFactory
GraphicItemFactory.className = "GraphicItemFactory"
GraphicItemFactory.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory"

function GraphicItemFactory:_init_fields()
    if self.graphicItems == nil then self.graphicItems = nil end
    self.DEFAULT = SelectionToolFactory.new()
end


function GraphicItemFactory.getInstance()
        return GraphicItemFactory.instance_f
end


function GraphicItemFactory._jinit(self)
    GraphicItemFactory._init_fields(self)
        self.graphicItems = StdUtil.getInstance():createHashMap()
        self.graphicItems:put(LinesGraphicItem.getStaticName(), LinesGraphicItemFactory.new())
    return self
end

function GraphicItemFactory.new(...)
    local self = setmetatable({}, GraphicItemFactory)
    GraphicItemFactory._jinit(self, ...)
    return self
end


function GraphicItemFactory:getInstance_j1_1(itemName)
        local graphicsItemInterfaceFactoryInterface = self.graphicItems:get(itemName)
        if graphicsItemInterfaceFactoryInterface == nil then
            graphicsItemInterfaceFactoryInterface = self.DEFAULT
        end
        return graphicsItemInterfaceFactoryInterface
end


-- throws Exception
function GraphicItemFactory:getInstance_j1_2(graphicItemNodeList)
        local numberOfItems = graphicItemNodeList:size()
        local graphicItemHashMap = StdUtil.getInstance():createHashMap()
        if LOGGING.contains(LOGGING.MENUEVENT) then
        end
        for index = 0, numberOfItems - 1 do
            local graphicItem = GraphicItemBuilder.getInstance(graphicItemNodeList:get(index))
            graphicItemHashMap:put(graphicItem:getTreeNode(), graphicItem)
        end
        return graphicItemHashMap
end
function GraphicItemFactory:getInstance(...)
    local count = select("#", ...)
    if count == 1 then return self:getInstance_j1(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
GraphicItemFactory.getInstance__jdispatcher = GraphicItemFactory.getInstance
function GraphicItemFactory:getInstance_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") then return GraphicItemFactory.getInstance_j1_1(self, ...) end
    return GraphicItemFactory.getInstance_j1_2(self, ...)
end

GraphicItemFactory.instance_f = GraphicItemFactory.new()

return GraphicItemFactory

