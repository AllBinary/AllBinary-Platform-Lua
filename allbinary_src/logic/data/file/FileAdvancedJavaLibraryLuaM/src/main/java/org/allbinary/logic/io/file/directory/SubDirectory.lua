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
-- package org.allbinary.logic.io.file.directory

-- local FileFilter = require("java.io.FileFilter")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SubDirectory = {}
SubDirectory.__index = SubDirectory
SubDirectory.className = "SubDirectory"

function SubDirectory:_init_fields()
    self.directory = Directory.getInstance()
end


function SubDirectory.getInstance()
        return SubDirectory.instance
end


function SubDirectory.new()
    local self = setmetatable({}, SubDirectory)
    self:_init_fields()
    return self
end


function SubDirectory:search(fileFilter, file)
        return self.directory:search(fileFilter, file, true)
end


-- Java overloaded method: Lua keeps the last definition
function SubDirectory:search(file)
        return self.directory:search(file, true)
end


-- Java overloaded method: Lua keeps the last definition
function SubDirectory:search(searchValue, file)
        return self.directory:search(searchValue, file, true)
end


-- Java overloaded method: Lua keeps the last definition
function SubDirectory:search(level, file)
        return self.directory:search(level, file, true)
end


function SubDirectory.toString(files)
        local stringBuffer = StringMaker.new()
        local NEW_LINE = CommonSeps.getInstance().NEW_LINE
        local size = files:size()
        for index = 0, size - 1 do
            local file = files:get(index)
            stringBuffer:append(file:getPath())
            stringBuffer:append(NEW_LINE)
        end
        return tostring(stringBuffer)
end

SubDirectory.instance = SubDirectory.new()

return SubDirectory

