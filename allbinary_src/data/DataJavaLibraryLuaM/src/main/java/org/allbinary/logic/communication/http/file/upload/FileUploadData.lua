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
-- package org.allbinary.logic.communication.http.file.upload


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileUploadData = {}
FileUploadData.__index = FileUploadData
FileUploadData.className = "FileUploadData"

function FileUploadData:_init_fields()
    self.FILE = "download_file_permissions.xml"
    self.UPLOAD_TO_FILE_PATH = "FILE_UPLOAD_UPLOAD_TO_FILE_PATH"
    self.FILE_DATA = "FILE_UPLOAD_FILE_DATA"
end

function FileUploadData.new()
    local self = setmetatable({}, FileUploadData)
    self:_init_fields()
    return self
end


function FileUploadData.getInstance()
        return FileUploadData.instance
end

FileUploadData.instance = FileUploadData.new()

return FileUploadData

