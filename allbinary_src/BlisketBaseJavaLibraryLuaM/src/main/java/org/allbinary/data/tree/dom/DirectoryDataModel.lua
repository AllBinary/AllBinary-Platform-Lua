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

local DirectoryDataModel = {}
package.loaded["org.allbinary.data.tree.dom.DirectoryDataModel"] = DirectoryDataModel

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

local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local TransformInterface = java_lazy("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentFactory = java_lazy("org.allbinary.logic.visual.transform.data.TransformDocumentFactory")
local TransformDocumentInterface = java_lazy("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local FileDomDataModel = java_lazy("org.allbinary.data.tree.dom.FileDomDataModel")

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

-- class table DirectoryDataModel is declared before the requires
DirectoryDataModel.__index = DirectoryDataModel
DirectoryDataModel.className = "DirectoryDataModel"
DirectoryDataModel.javaClassName = "org.allbinary.data.tree.dom.DirectoryDataModel"
DirectoryDataModel.java_implements = " DomNodeInterface TransformInterface "
DirectoryDataModel.java_interfaces = function() return {DomNodeInterface, TransformInterface} end

function DirectoryDataModel:_init_fields()
    if self.fileBasicArrayList == nil then self.fileBasicArrayList = nil end
    if self.transformDocumentInterface == nil then self.transformDocumentInterface = nil end
    self.NO_TYPE = 0
end


function DirectoryDataModel._jinit(self, file)
    DirectoryDataModel._init_fields(self)
        self.fileBasicArrayList = Directory.getInstance():search(file)
        self.transformDocumentInterface = TransformDocumentFactory.getInstance()
    return self
end

function DirectoryDataModel.new(...)
    local self = setmetatable({}, DirectoryDataModel)
    DirectoryDataModel._jinit(self, ...)
    return self
end


function DirectoryDataModel:getTypeId()
        return self.NO_TYPE
end


-- throws Exception
function DirectoryDataModel:getTransformInfoInterface()
        return nil
end


function DirectoryDataModel:setTransformDocumentInterface(transformDocumentInterface)
        self.transformDocumentInterface = transformDocumentInterface
end


function DirectoryDataModel:getTransformDocumentInterface()
        return self.transformDocumentInterface
end


-- throws Exception
function DirectoryDataModel:toXmlNode(document)
        local dirNode = document:createElement("dir")
        local size = self.fileBasicArrayList:size()
        local nextFile = nil
        local fileNode = nil
        for index = 0, size - 1 do
            nextFile = self.fileBasicArrayList:get(index)
            fileNode = FileDomDataModel.new(nextFile):toXmlNode(document)
            dirNode:appendChild(fileNode)
        end
        return dirNode
end


-- throws Exception
function DirectoryDataModel:toXmlDoc()
        return self:getTransformDocumentInterface():getDoc()
end


-- throws Exception
function DirectoryDataModel:view()
        local node = self:toXmlNode(self:getTransformDocumentInterface():getDoc())
        self:getTransformDocumentInterface():getBaseNode():appendChild(node)
        return XmlDocumentHelper.toString(self:getTransformDocumentInterface():getDoc())
end

return DirectoryDataModel

