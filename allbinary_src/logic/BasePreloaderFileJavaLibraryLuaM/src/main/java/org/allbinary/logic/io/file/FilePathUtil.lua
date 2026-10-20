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

local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Used to correct user input for paths
local FilePathUtil = {}
FilePathUtil.__index = FilePathUtil
FilePathUtil.className = "FilePathUtil"


function FilePathUtil.new()
    local self = setmetatable({}, FilePathUtil)
    return self
end


function FilePathUtil.adjust(path)
        local abPathData = AbPathData.getInstance()
        local stringValidationUtil = StringValidationUtil.getInstance()
        local filePathData = FilePathData.getInstance()
        if stringValidationUtil:isEmpty(path) then
            return filePathData.PATH_START
        end
        path = path:replace(abPathData.SEPARATORCHAR, filePathData.SEPARATORCHAR)
        return path
end

return FilePathUtil

