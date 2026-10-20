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
-- package org.allbinary.logic.io.file

-- local FileNotFoundException = require("java.io.FileNotFoundException")
local Context = require("android.content.Context")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileFactory = {}
FileFactory.__index = FileFactory
FileFactory.className = "FileFactory"

function FileFactory:_init_fields()
    self.context = nil
end


function FileFactory.new(context)
    local self = setmetatable({}, FileFactory)
    self:_init_fields()
        self.context = context
    return self
end


function FileFactory.getInstance()
        return FileFactory.SINGLETON
end


-- throws Exception
function FileFactory:isFile(path)
        local try_ok, try_error = pcall(function()
            self.context:openFileInput(path)
            return true
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end


function FileFactory:getContext()
        return self.context
end


-- throws Exception
function FileFactory:getFile(filePath)
        return AbFile.createAbFileFromRawPath(filePath)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileFactory:getInstance(file, childFilePath)
        return AbFile.createAbFileWithChild(file, childFilePath)
end

FileFactory.SINGLETON = FileFactory.new(ResourceUtil.getInstance():getContext())

return FileFactory

