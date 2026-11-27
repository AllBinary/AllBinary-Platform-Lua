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
-- package org.allbinary.data.tree.dom

local FileDomDataModel = {}
package.loaded["org.allbinary.data.tree.dom.FileDomDataModel"] = FileDomDataModel

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
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local FileTableMapping = java_lazy("org.allbinary.data.tree.dom.FileTableMapping")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")

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

-- class table FileDomDataModel is declared before the requires
FileDomDataModel.__index = FileDomDataModel
FileDomDataModel.className = "FileDomDataModel"
FileDomDataModel.javaClassName = "org.allbinary.data.tree.dom.FileDomDataModel"
FileDomDataModel.java_implements = " DomNodeInterface "
FileDomDataModel.java_interfaces = function() return {DomNodeInterface} end

function FileDomDataModel:_init_fields()
    if self.file == nil then self.file = nil end
end


function FileDomDataModel._jinit(self, file)
    FileDomDataModel._init_fields(self)
        self.file = file
    return self
end

function FileDomDataModel.new(...)
    local self = setmetatable({}, FileDomDataModel)
    FileDomDataModel._jinit(self, ...)
    return self
end


-- throws Exception
function FileDomDataModel:toXmlNode(document)
        local tableMappingInterface = FileTableMapping.new(self.file)
        local hashMap = tableMappingInterface:toHashMap()
        return ModDomHelper.createNodeWithValueNodes(document, "file", hashMap)
end

return FileDomDataModel

