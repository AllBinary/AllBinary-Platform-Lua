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
-- package org.allbinary.logic.system.security.licensing

-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
local LicenseInitInfoUtil = require("org.allbinary.business.init.LicenseInitInfoUtil")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local FileStreamFactory = require("org.allbinary.logic.io.FileStreamFactory")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local FileFactory = require("org.allbinary.logic.io.file.FileFactory")
local SimpleFileUtil = require("org.allbinary.logic.io.file.SimpleFileUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseServerInitFileUtil = {}
LicenseServerInitFileUtil.__index = LicenseServerInitFileUtil
LicenseServerInitFileUtil.className = "LicenseServerInitFileUtil"

function LicenseServerInitFileUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.NULL_OUTPUT_STREAM = SimpleFileUtil.nullOutputStream()
end

function LicenseServerInitFileUtil.new()
    local self = setmetatable({}, LicenseServerInitFileUtil)
    self:_init_fields()
    return self
end


function LicenseServerInitFileUtil:init()
        local try_ok, try_error = pcall(function()
            local filePath = LicenseInitInfoUtil.getInstance().INITFILENAME
            LicenseInitInfoUtil.getInstance():setFilePath(StringUtil.getInstance().EMPTY_STRING)
            if FileFactory.getInstance():isFile(filePath) then
                self.logUtil:putF("Using Existing License File", self, self.commonStrings.INIT)
            else
                self:write()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end


function LicenseServerInitFileUtil:write()
        local fileOutputStream = self.NULL_OUTPUT_STREAM
        local try_ok, try_error = pcall(function()
            local resourceUtil = ResourceUtil.getInstance()
            local filePath = LicenseInitInfoUtil.getInstance().INITFILENAME
            local inputStream = resourceUtil:getResourceAsStream(filePath)
            self.logUtil:putF("Writing Default License File", self, self.commonStrings.INIT)
            local fileStreamFactory = FileStreamFactory.getInstance()
            fileOutputStream = fileStreamFactory:getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, filePath)
            local b = 0
            local index = 0
            while true do
                b = inputStream:read()
                if b == -1 then
                    break
                end
                fileOutputStream:write(b)
                index = index + 1
            end
            self.logUtil:putF("Wrote Bytes: " .. tostring(index), self, self.commonStrings.INIT)
            fileOutputStream:flush()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
        do -- finally
            StreamUtil.getInstance():close(fileOutputStream)
        end
end

return LicenseServerInitFileUtil

