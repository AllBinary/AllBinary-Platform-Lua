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

local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbIOSystem = require("org.allbinary.logic.io.AbIOSystem")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InitializeCloud = {}
InitializeCloud.__index = InitializeCloud
InitializeCloud.className = "InitializeCloud"

function InitializeCloud:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InitializeCloud.new()
    local self = setmetatable({}, InitializeCloud)
    self:_init_fields()
    return self
end


function InitializeCloud:initialize(cloud, overwriteNewer, overwriteAll, current, total)
        local try_ok, try_error = pcall(function()
            if AbIOSystem.getInstance():isType("com.vobject.appengine.java.io") then
                local stringBuffer = StringMaker.new()
                stringBuffer:append(self.URLGLOBALS:getWebappPath())
                stringBuffer:append(cloud)
                stringBuffer:append(self.PATH_GLOBALS:getInstance().DATA_PATH)
                local path = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.URLGLOBALS:getWebappPath())
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
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Unable to copy installer files into cloud", self, "initialize()", e)
            return false
        end
end

InitializeCloud.CLOUD = "cloud/"
InitializeCloud.CLOUD_UPDATE = "cloudupdate/"

return InitializeCloud

