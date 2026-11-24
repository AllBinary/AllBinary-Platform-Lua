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

local FileTableMapping = {}
package.loaded["org.allbinary.data.tree.dom.FileTableMapping"] = FileTableMapping

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileData = java_lazy("org.allbinary.logic.io.file.FileData")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local PathUtil = java_lazy("org.allbinary.logic.io.path.PathUtil")

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

-- class table FileTableMapping is declared before the requires
FileTableMapping.__index = FileTableMapping
FileTableMapping.className = "FileTableMapping"
FileTableMapping.javaClassName = "org.allbinary.data.tree.dom.FileTableMapping"
FileTableMapping.java_implements = " TableMappingInterface "
FileTableMapping.java_interfaces = function() return {TableMappingInterface} end

function FileTableMapping:_init_fields()
    if self.file == nil then self.file = nil end
end


function FileTableMapping._jinit(self, file)
    FileTableMapping._init_fields(self)
        self.file = file
    return self
end

function FileTableMapping.new(...)
    local self = setmetatable({}, FileTableMapping)
    FileTableMapping._jinit(self, ...)
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

