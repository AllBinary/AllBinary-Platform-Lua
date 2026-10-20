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
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileData = require("org.allbinary.logic.io.file.FileData")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local PathUtil = require("org.allbinary.logic.io.path.PathUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileTableMapping = {}
FileTableMapping.__index = FileTableMapping
FileTableMapping.className = "FileTableMapping"

function FileTableMapping:_init_fields()
    self.file = nil
end


function FileTableMapping.new(file)
    local self = setmetatable({}, FileTableMapping)
    self:_init_fields()
        self.file = file
    return self
end


-- throws Exception
function FileTableMapping:getKey()
        return self.file:getPath()
end


-- throws Exception
function FileTableMapping:toVector()
        local filePropertyVector = BasicArrayListD.new()
        filePropertyVector:add(self.file:getAbsolutePath())
        filePropertyVector:add(self.file:getCanonicalPath())
        filePropertyVector:add(self.file:getName())
        filePropertyVector:add(self.file:getParent())
        filePropertyVector:add(self.file:getPath())
        return filePropertyVector
end


-- throws Exception
function FileTableMapping:toHashMap()
        local filePropertyHashMap = StdUtil.getInstance():createHashMap()
        local pathData = AbPathData.getInstance()
        local pathUtil = PathUtil.getInstance()
        local rootFileName = pathData:getNameFromPath(pathUtil:getWithoutExtension(self.file:getPath()))
        local fileData = FileData.getInstance()
        filePropertyHashMap:put(fileData.ROOT_NAME, rootFileName)
        filePropertyHashMap:put(fileData.ISFILE, tostring(tostring(self.file:isFile())))
        filePropertyHashMap:put(fileData.ISDIRECTORY, tostring(tostring(self.file:isDirectory())))
        filePropertyHashMap:put(fileData.ISHIDDEN, tostring(tostring(self.file:isHidden())))
        filePropertyHashMap:put(fileData.ISABSOLUTE, tostring(tostring(self.file:isAbsolute())))
        filePropertyHashMap:put(fileData.ABSOLUTE_PATH, self.file:getAbsolutePath())
        filePropertyHashMap:put(fileData.CANONICAL_PATH, self.file:getCanonicalPath())
        filePropertyHashMap:put(fileData.NAME, self.file:getName())
        filePropertyHashMap:put(fileData.PARENT, self.file:getParent())
        filePropertyHashMap:put(fileData.PATH, self.file:getPath())
        return filePropertyHashMap
end

return FileTableMapping

