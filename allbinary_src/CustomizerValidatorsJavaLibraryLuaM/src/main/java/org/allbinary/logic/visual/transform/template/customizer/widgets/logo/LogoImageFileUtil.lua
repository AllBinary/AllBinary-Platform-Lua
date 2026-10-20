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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.logo

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local FileItem = require("org.apache.commons.fileupload.FileItem")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local LogoImageFileUtil = {}
LogoImageFileUtil.__index = LogoImageFileUtil
LogoImageFileUtil.className = "LogoImageFileUtil"

function LogoImageFileUtil:_init_fields()
    self.directory = Directory.getInstance()
    self.fileName = nil
    self.imageFileAbPath = nil
end


function LogoImageFileUtil.new(imageAbPath, imageFile)
    local self = setmetatable({}, LogoImageFileUtil)
    self:_init_fields()
        self.fileName = imageFile
        self.imageFileAbPath = imageAbPath
    return self
end


-- throws Exception
function LogoImageFileUtil:saveFiles(fileItem)
        if self.fileName == nil then
            error(java_exception("Exception", "Image File Name Was Null"), 0)
        end
        if not self.directory:create(self.imageFileAbPath) then
            error(java_exception("Exception", "Unable to save file to non creatable directory"), 0)
        end
        local originalImageFile = AbFile.createAbFile(tostring(self.imageFileAbPath) .. self.fileName)
        originalImageFile:createNewFile()
        FileUtil.getInstance():write(ByteArrayInputStream.new(fileItem:get()), originalImageFile)
end

return LogoImageFileUtil

