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

local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentFactory = require("org.allbinary.logic.visual.transform.data.TransformDocumentFactory")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DirectoryDataModel = {}
DirectoryDataModel.__index = DirectoryDataModel
DirectoryDataModel.className = "DirectoryDataModel"

function DirectoryDataModel:_init_fields()
    self.fileBasicArrayList = nil
    self.transformDocumentInterface = nil
    self.NO_TYPE = 0
end


function DirectoryDataModel.new(file)
    local self = setmetatable({}, DirectoryDataModel)
    self:_init_fields()
        self.fileBasicArrayList = Directory.getInstance():search(file)
        self.transformDocumentInterface = TransformDocumentFactory.getInstance()
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

