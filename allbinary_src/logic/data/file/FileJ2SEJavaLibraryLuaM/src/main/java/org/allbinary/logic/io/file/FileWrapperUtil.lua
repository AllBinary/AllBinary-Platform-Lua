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

-- local File = require("java.io.File")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileWrapperUtil = {}
FileWrapperUtil.__index = FileWrapperUtil
FileWrapperUtil.className = "FileWrapperUtil"

function FileWrapperUtil.new()
    local self = setmetatable({}, FileWrapperUtil)
    return self
end


function FileWrapperUtil.wrapFiles(files)
        local try_ok, try_error = pcall(function()
            local abFileArray = java_new_array(nil, (files.n or #files))
            for index = (files.n or #files) - 1, 0, -1 do
                abFileArray[index + 1] = AbFile.new(files[index + 1])
            end
            return abFileArray
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putSE("Exception Wrapping Files", "FileWrapperUtil", "wrapFiles", e)
            return java_new_array(nil, 0)
        end
end


function FileWrapperUtil.wrapFile(file)
        local try_ok, try_error = pcall(function()
            return AbFile.new(file)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putSE("Exception Wrapping File", "FileWrapperUtil", "wrapFile", e)
            return AbFile.NULL_FILE
        end
end

return FileWrapperUtil

