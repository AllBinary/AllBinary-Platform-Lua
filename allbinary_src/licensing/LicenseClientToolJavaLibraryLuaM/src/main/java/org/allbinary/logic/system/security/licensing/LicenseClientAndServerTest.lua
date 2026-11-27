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

local LicenseClientAndServerTest = {}
package.loaded["org.allbinary.logic.system.security.licensing.LicenseClientAndServerTest"] = LicenseClientAndServerTest

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

local File = java_lazy("java.io.File")
-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LicenseInitInfo = java_lazy("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = java_lazy("org.allbinary.business.init.LicenseInitInfoUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeLicenseRetrievalClient = java_lazy("org.allbinary.logic.system.security.licensing.client.XmlRpcAbeLicenseRetrievalClient")
local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local PrintLicenseInitInfo = java_lazy("org.allbinary.logic.system.security.licensing.PrintLicenseInitInfo")

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

-- class table LicenseClientAndServerTest is declared before the requires
LicenseClientAndServerTest.__index = LicenseClientAndServerTest
LicenseClientAndServerTest.className = "LicenseClientAndServerTest"
LicenseClientAndServerTest.javaClassName = "org.allbinary.logic.system.security.licensing.LicenseClientAndServerTest"

function LicenseClientAndServerTest:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.vector = BasicArrayListD.new()
end


function LicenseClientAndServerTest._jinit(self, options)
    LicenseClientAndServerTest._init_fields(self)
        LicenseInitInfoUtil.getInstance():setFilePath(PrintLicenseInitInfo.PATH + PATH_GLOBALS.getInstance().INIT_PATH)
        for index = 1, (options.n or #options) - 1 do
            self.vector:add(options[index + 1])
        end
        if (options.n or #options) < 2 then
            local file = File.new(tostring(PrintLicenseInitInfo.PATH) .. "testlicenseservers.txt")
            local reader = FileReader.new(file)
            local lineNumberReader = LineNumberReader.new(reader)
            while lineNumberReader:ready() do
                self.vector:add(lineNumberReader:readLine())
            end
        end
    return self
end

function LicenseClientAndServerTest.new(...)
    local self = setmetatable({}, LicenseClientAndServerTest)
    LicenseClientAndServerTest._jinit(self, ...)
    return self
end


function LicenseClientAndServerTest:test()
        local stringBuffer = StringMaker.new()
        local try_ok, try_error, try_value = pcall(function()
            local list = BasicArrayListD.new()
            local TESTING = "Testing with new licence:<br/>"
            local PROCESSING = "Processing: <br/>"
            local END = "<br/>End<br/>"
            local RESULT = "Test Result: "
            local size = self.vector:size()
            for index = 0, size - 1 do
                stringBuffer:append(TESTING)
                local serverName = self.vector:get(index)
                local try_ok, try_error, try_value = pcall(function()
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
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    list:add(serverName)
                    self.logUtil:put("Test Error: " .. tostring(stringBuffer), self, "test", e)
                end
            end
            self.logUtil:putF("Total Servers Failed: " .. tostring(list:size()) .. " Failed Servers: " .. tostring(list), self, "test")
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Test Error: " .. tostring(stringBuffer), self, "test", e)
        end
end


function LicenseClientAndServerTest.main(args)
        local try_ok, try_error, try_value = pcall(function()
            local licensingTest = LicenseClientAndServerTest.new(args)
            licensingTest:test()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local logUtil = LogUtil.getInstance()
            logUtil:put(CommonStrings.getInstance().EXCEPTION, "main()", "main()", e)
        end
end

return LicenseClientAndServerTest

