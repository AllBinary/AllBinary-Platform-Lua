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

local LogoImageFileUtil = {}
package.loaded["org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoImageFileUtil"] = LogoImageFileUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileUtil = java_lazy("org.allbinary.logic.io.file.FileUtil")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local FileItem = java_lazy("org.apache.commons.fileupload.FileItem")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table LogoImageFileUtil is declared before the requires
LogoImageFileUtil.__index = LogoImageFileUtil
LogoImageFileUtil.className = "LogoImageFileUtil"
LogoImageFileUtil.javaClassName = "org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoImageFileUtil"

function LogoImageFileUtil:_init_fields()
    self.directory = Directory.getInstance()
    if self.fileName == nil then self.fileName = nil end
    if self.imageFileAbPath == nil then self.imageFileAbPath = nil end
end


function LogoImageFileUtil._jinit(self, imageAbPath, imageFile)
    LogoImageFileUtil._init_fields(self)
        self.fileName = imageFile
        self.imageFileAbPath = imageAbPath
    return self
end

function LogoImageFileUtil.new(...)
    local self = setmetatable({}, LogoImageFileUtil)
    LogoImageFileUtil._jinit(self, ...)
    return self
end


-- throws Exception
function LogoImageFileUtil:saveFiles(fileItem)
        if rawequal(self.fileName, nil) then
            error(require("java.lang.Exception").new("Image File Name Was Null"), 0)
        end
        if not (self.directory:create(self.imageFileAbPath)) then
            error(require("java.lang.Exception").new("Unable to save file to non creatable directory"), 0)
        end
        local originalImageFile = AbFile.createAbFile(require("allbinary_java").to_string(tostring(self.imageFileAbPath)) .. require("allbinary_java").to_string(self.fileName))
        originalImageFile:createNewFile()
        FileUtil.getInstance():write(ByteArrayInputStream.new(fileItem:get()), originalImageFile)
end

return LogoImageFileUtil

