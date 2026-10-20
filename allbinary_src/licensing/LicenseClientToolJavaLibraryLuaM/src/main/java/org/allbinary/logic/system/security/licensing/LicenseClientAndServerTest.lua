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

-- local File = require("java.io.File")
-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LicenseInitInfo = require("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = require("org.allbinary.business.init.LicenseInitInfoUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeLicenseRetrievalClient = require("org.allbinary.logic.system.security.licensing.client.XmlRpcAbeLicenseRetrievalClient")
local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
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

local LicenseClientAndServerTest = {}
LicenseClientAndServerTest.__index = LicenseClientAndServerTest
LicenseClientAndServerTest.className = "LicenseClientAndServerTest"

function LicenseClientAndServerTest:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.vector = BasicArrayListD.new()
end


function LicenseClientAndServerTest.new(options)
    local self = setmetatable({}, LicenseClientAndServerTest)
    self:_init_fields()
        LicenseInitInfoUtil.getInstance():setFilePath(PrintLicenseInitInfo.PATH + self.PATH_GLOBALS:getInstance().INIT_PATH)
        for index = 1, (options.n or #options) - 1 do
            self.vector:add(options[index + 1])
        end
        if (options.n or #options) < 2 then
            local file = File.new(tostring(PrintLicenseInitInfo.PATH) .. "testlicenseservers.txt")
            local reader = FileReader.new(file)
            local lineNumberReader = LineNumberReader.new(reader)
            while true do
                local line = lineNumberReader:readLine()
                if line ~= nil then
                    self.vector:add(line)
                else
                    break
                end
            end
        end
    return self
end


function LicenseClientAndServerTest:test()
        local stringBuffer = StringMaker.new()
        local try_ok, try_error = pcall(function()
            local list = BasicArrayListD.new()
            local TESTING = "Testing with new licence:<br/>"
            local PROCESSING = "Processing: <br/>"
            local END = "<br/>End<br/>"
            local RESULT = "Test Result: "
            local size = self.vector:size()
            for index = 0, size - 1 do
                stringBuffer:append(TESTING)
                local serverName = self.vector:get(index)
                local try_ok, try_error = pcall(function()
                    local licenseInitInfo = LicenseInitInfo.new()
                    licenseInitInfo:addServer(serverName)
                    LicenseInitInfoUtil.getInstance():write(licenseInitInfo)
                    local abeClientInformation = AbeClientInformationInterfaceFactory.getInstance()
                    local xmlRpcAbeLicenseClient = XmlRpcAbeLicenseRetrievalClient.new(abeClientInformation)
                    local abeLicenseInterface = xmlRpcAbeLicenseClient:get(nil)
                    if abeLicenseInterface ~= nil then
                        stringBuffer:append(PROCESSING)
                        stringBuffer:append(tostring(abeLicenseInterface))
                    end
                    stringBuffer:append(END)
                    self.logUtil:putF(RESULT .. tostring(stringBuffer), self, "test")
                    stringBuffer:delete(0, stringBuffer:length())
                end)
                if not try_ok then
                    local e = try_error
                    list:add(serverName)
                    self.logUtil:put("Test Error: " .. tostring(stringBuffer), self, "test", e)
                end
            end
            self.logUtil:putF("Total Servers Failed: " .. tostring(list:size()) .. " Failed Servers: " .. tostring(list), self, "test")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Test Error: " .. tostring(stringBuffer), self, "test", e)
        end
end


function LicenseClientAndServerTest.main(args)
        local try_ok, try_error = pcall(function()
            local licensingTest = LicenseClientAndServerTest.new(args)
            licensingTest:test()
        end)
        if not try_ok then
            local e = try_error
            local logUtil = LogUtil.getInstance()
            self.logUtil:put(self.commonStrings.EXCEPTION, "main()", "main()", e)
        end
end

return LicenseClientAndServerTest

