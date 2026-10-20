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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileData = {}
FileData.__index = FileData
FileData.className = "FileData"

function FileData:_init_fields()
    self.NAME = "FILE_NAME"
    self.ISFILE = "FILE_ISFILE"
    self.ISDIRECTORY = "FILE_ISDIRECTORY"
    self.ISHIDDEN = "FILE_ISHIDDEN"
    self.ISABSOLUTE = "FILE_ISABSOLUTE"
    self.ROOT_NAME = "FILE_ROOT_NAME"
    self.PATH = "FILE_PATH"
    self.ABSOLUTE_PATH = "FILE_ABSOLUTE_PATH"
    self.CANONICAL_PATH = "FILE_CANONICAL_PATH"
    self.PARENT = "FILE_PARENT"
    self.MINLEN = 1
    self.MAXLEN = 120
    self.MAXIMAGEFILESIZE = 1048576
    self.MINIMAGEFILESIZE = 32
    self.MAXDOWNLOADABLEFILESIZE = 1048576 * 20
    self.MINDOWNLOADABLEFILESIZE = 1
end


function FileData.getInstance()
        return FileData.instance
end


function FileData.new()
    local self = setmetatable({}, FileData)
    self:_init_fields()
    return self
end

FileData.instance = FileData.new()

return FileData

