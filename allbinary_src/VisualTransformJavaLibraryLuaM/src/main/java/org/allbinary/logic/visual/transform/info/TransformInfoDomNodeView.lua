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

local TransformInfoDomNodeView = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoDomNodeView"] = TransformInfoDomNodeView

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
local Attr = java_lazy("org.w3c.dom.Attr")
local Document = java_lazy("org.w3c.dom.Document")
local NamedNodeMap = java_lazy("org.w3c.dom.NamedNodeMap")
local Node = java_lazy("org.w3c.dom.Node")
local TransformInfoDomNode = require("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table TransformInfoDomNodeView is declared before the requires
TransformInfoDomNodeView.__index = TransformInfoDomNodeView
TransformInfoDomNodeView.className = "TransformInfoDomNodeView"
TransformInfoDomNodeView.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoDomNodeView"
setmetatable(TransformInfoDomNodeView, {__index = TransformInfoDomNode})
TransformInfoDomNodeView.java_implements = " DomNodeInterface "
TransformInfoDomNodeView.java_interfaces = function() return {DomNodeInterface} end

function TransformInfoDomNodeView._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return TransformInfoDomNodeView._new2(self, ...)
    elseif count == 1 then return TransformInfoDomNodeView._new1(self, ...)
    end
    error("No constructor of TransformInfoDomNodeView takes " .. count .. " arguments")
end

function TransformInfoDomNodeView.new(...)
    local self = setmetatable({}, TransformInfoDomNodeView)
    TransformInfoDomNodeView._jinit(self, ...)
    return self
end

function TransformInfoDomNodeView._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or type(java_a2) == "string") then return TransformInfoDomNodeView._new2_1(self, ...) end
    return TransformInfoDomNodeView._new2_2(self, ...)
end

function TransformInfoDomNodeView._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) then return TransformInfoDomNodeView._new1_1(self, ...) end
    return TransformInfoDomNodeView._new1_2(self, ...)
end


function TransformInfoDomNodeView._new2_1(self, transformInfoInterface, mapping)
    java_super_init(TransformInfoDomNode, self, transformInfoInterface, mapping)
        -- super(...) made self above
    return self
end


function TransformInfoDomNodeView._new1_1(self, transformInfoInterface)
    java_super_init(TransformInfoDomNode, self, transformInfoInterface)
        -- super(...) made self above
    return self
end


function TransformInfoDomNodeView._new2_2(self, name, mappedName)
    java_super_init(TransformInfoDomNode, self, name, mappedName)
        -- super(...) made self above
    return self
end


function TransformInfoDomNodeView._new1_2(self, name)
    java_super_init(TransformInfoDomNode, self, name, nil)
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
java_overload(TransformInfoDomNodeView, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

return TransformInfoDomNodeView

