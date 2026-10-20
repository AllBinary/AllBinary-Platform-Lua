-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileUnamedUtil = {}
FileUnamedUtil.__index = FileUnamedUtil
FileUnamedUtil.className = "FileUnamedUtil"

function FileUnamedUtil:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
end

function FileUnamedUtil.new()
    local self = setmetatable({}, FileUnamedUtil)
    self:_init_fields()
    return self
end


function FileUnamedUtil.getInstance()
        return FileUnamedUtil.instance
end


function FileUnamedUtil:process(string)
        local simplifiedString = string.lower(string)
        simplifiedString = simplifiedString:replace(self.commonSeps.SPACE, self.commonSeps.UNDERSCORE)
        simplifiedString = simplifiedString:replace(self.commonSeps.DASH, self.commonSeps.UNDERSCORE)
        return simplifiedString
end

FileUnamedUtil.instance = FileUnamedUtil.new()

return FileUnamedUtil

