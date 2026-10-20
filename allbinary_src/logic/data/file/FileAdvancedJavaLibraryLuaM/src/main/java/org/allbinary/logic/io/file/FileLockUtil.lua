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

-- local FileChannel = require("java.nio.channels.FileChannel")
-- local FileLock = require("java.nio.channels.FileLock")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFileOutputStream = require("org.allbinary.logic.io.AbFileOutputStream")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileLockUtil = {}
FileLockUtil.__index = FileLockUtil
FileLockUtil.className = "FileLockUtil"

function FileLockUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function FileLockUtil.getInstance()
        return FileLockUtil.instance
end


function FileLockUtil.new()
    local self = setmetatable({}, FileLockUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function FileLockUtil:getAll(vector, isReturnOnFailure)
        local fileLockVector = BasicArrayListD.new()
        local size = vector:size()
        for index = 0, size - 1 do
            local file = vector:get(index)
            local fileLock = self:getLock(file)
            if fileLock ~= nil then
                self.logUtil:putF("File Lock Obtained: " .. tostring(file:getAbsolutePath()), self, "getAll")
                fileLockVector:add(fileLock)
            elseif isReturnOnFailure then
                self.logUtil:putF("Total Locks Obtained: " .. tostring(fileLockVector:size()), self, "getAll")
                return fileLockVector
            end
        end
        self.logUtil:putF("Total Locks Obtained: " .. tostring(fileLockVector:size()), self, "getAll")
        return fileLockVector
end


-- throws Exception
function FileLockUtil:getAllPossible(vector)
        return self:getAll(vector, false)
end


-- throws Exception
function FileLockUtil:getAllOrNone(vector)
        local fileLockVector = self:getAll(vector, true)
        if vector:size() ~= fileLockVector:size() then
            return BasicArrayListD.new()
        else
            return fileLockVector
        end
end


-- throws Exception
function FileLockUtil:getLock(file)
        local try_ok, try_error = pcall(function()
            return self:getLock(AbFileOutputStream.createFromAbFileAppend(file, true))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Exception returns null", self, "getLock", e)
            return nil
        end
        do -- finally
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileLockUtil:getLock(fileOutputStream)
        local try_ok, try_error = pcall(function()
            local fileLock = self:getLock(fileOutputStream:getChannel())
            return fileLock
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Exception returns null", self, "getLock", e)
            return nil
        end
        do -- finally
            self.logUtil:putF("Finally - Closing FileOutputStream", self, "getLock")
            StreamUtil.getInstance():close(fileOutputStream)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileLockUtil:getLock(fileChannel)
        local try_ok, try_error = pcall(function()
            local fileLock = fileChannel:tryLock()
            return fileLock
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Exception returns null", self, "getLock", e)
            return nil
        end
        do -- finally
            self.logUtil:putF("Finally - Closing FileChannel", self, "getLock")
            fileChannel:close()
        end
end

FileLockUtil.instance = FileLockUtil.new()

return FileLockUtil

