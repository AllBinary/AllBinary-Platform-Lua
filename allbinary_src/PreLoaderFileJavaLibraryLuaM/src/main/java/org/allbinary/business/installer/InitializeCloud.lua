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
-- package org.allbinary.business.installer

local InitializeCloud = {}
package.loaded["org.allbinary.business.installer.InitializeCloud"] = InitializeCloud

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

local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbIOSystem = java_lazy("org.allbinary.logic.io.AbIOSystem")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileUtil = java_lazy("org.allbinary.logic.io.file.FileUtil")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table InitializeCloud is declared before the requires
InitializeCloud.__index = InitializeCloud
InitializeCloud.className = "InitializeCloud"
InitializeCloud.javaClassName = "org.allbinary.business.installer.InitializeCloud"

function InitializeCloud:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InitializeCloud._jinit(self)
    InitializeCloud._init_fields(self)
    return self
end

function InitializeCloud.new(...)
    local self = setmetatable({}, InitializeCloud)
    InitializeCloud._jinit(self, ...)
    return self
end


function InitializeCloud:initialize(cloud, overwriteNewer, overwriteAll, current, total)
        local try_ok, try_error, try_value = pcall(function()
            if AbIOSystem.getInstance():isType("com.vobject.appengine.java.io") then
                local stringBuffer = StringMaker.new()
                stringBuffer:append(URLGLOBALS.getWebappPath())
                stringBuffer:append(cloud)
                stringBuffer:append(PATH_GLOBALS.getInstance().DATA_PATH)
                local path = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(URLGLOBALS.getWebappPath())
                local realPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
                local file = AbFile.createAbFileFromAbPath(path)
                local fileBasicArrayList = Directory.getInstance():search(file, true)
                local size = fileBasicArrayList:size()
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Searched: ")
                stringBuffer:append(path:toFileSystemString())
                stringBuffer:append(" BasicArrayList: ")
                stringBuffer:appendint(size)
                local portion = java_idiv(size, total) + 1
                local start = portion * current
                local end_ = start + portion
                if end_ > size then
                    end_ = size
                end
                stringBuffer:append(" Section: ")
                stringBuffer:appendint(start)
                stringBuffer:append(" - ")
                stringBuffer:appendint(end_)
                self.logUtil:putF(tostring(stringBuffer), self, "initialize()")
                local nextFile = nil
                for index = start, end_ - 1 do
                    nextFile = fileBasicArrayList:get(index)
                    if nextFile:isDirectory() then
                    else
                        FileUtil.getInstance():copyToCloud(nextFile, path, realPath, cloud, overwriteNewer, overwriteAll)
                    end
                end
                self.logUtil:putF("Copied Files To Cloud", self, "initialize()")
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Unable to copy installer files into cloud", self, "initialize()", e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

InitializeCloud.CLOUD = "cloud/"
InitializeCloud.CLOUD_UPDATE = "cloudupdate/"

return InitializeCloud

