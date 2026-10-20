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

-- local HashMap = require("java.util.HashMap")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
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

local FileDomDataModel = {}
FileDomDataModel.__index = FileDomDataModel
FileDomDataModel.className = "FileDomDataModel"

function FileDomDataModel:_init_fields()
    self.file = nil
end


function FileDomDataModel.new(file)
    local self = setmetatable({}, FileDomDataModel)
    self:_init_fields()
        self.file = file
    return self
end


-- throws Exception
function FileDomDataModel:toXmlNode(document)
        local tableMappingInterface = FileTableMapping.new(self.file)
        local hashMap = tableMappingInterface:toHashMap()
        return ModDomHelper.createNodeWithValueNodes(document, "file", hashMap)
end

return FileDomDataModel

