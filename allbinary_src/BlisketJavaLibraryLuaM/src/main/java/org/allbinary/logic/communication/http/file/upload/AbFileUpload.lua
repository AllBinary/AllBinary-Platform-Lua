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

-- local IOException = require("java.io.IOException")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local FileItemFactory = require("org.apache.commons.fileupload.FileItemFactory")
local FileItemIterator = require("org.apache.commons.fileupload.FileItemIterator")
local FileUpload = require("org.apache.commons.fileupload.FileUpload")
local FileUploadException = require("org.apache.commons.fileupload.FileUploadException")
local ServletRequestContext = require("org.apache.commons.fileupload.servlet.ServletRequestContext")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbFileUpload = {}
AbFileUpload.__index = AbFileUpload
AbFileUpload.className = "AbFileUpload"
setmetatable(AbFileUpload, {__index = FileUpload})


function AbFileUpload.new(fileItemFactory)
    local self = setmetatable(FileUpload.new(fileItemFactory), AbFileUpload)
        -- super(...) made self above
    return self
end


-- throws FileUploadException, IOException
function AbFileUpload:getItemIterator(request)
        return FileUpload.getItemIterator(self, ServletRequestContext.new(request))
end

return AbFileUpload

