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

-- local BufferedReader = require("java.io.BufferedReader")
-- local InputStreamReader = require("java.io.InputStreamReader")
local LicenseInitInfo = require("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = require("org.allbinary.business.init.LicenseInitInfoUtil")
local FileFactory = require("org.allbinary.logic.io.file.FileFactory")
local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
-- local File = require("java.io.File")
-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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

local SetLicenseInitInfo = {}
SetLicenseInitInfo.__index = SetLicenseInitInfo
SetLicenseInitInfo.className = "SetLicenseInitInfo"

function SetLicenseInitInfo:_init_fields()
    self.vector = BasicArrayListD.new()
end


function SetLicenseInitInfo.new(options)
    local self = setmetatable({}, SetLicenseInitInfo)
    self:_init_fields()
        LicenseInitInfoUtil.getInstance():setFilePath(PrintLicenseInitInfo.PATH + self.PATH_GLOBALS:getInstance().INIT_PATH)
        for index = 1, (options.n or #options) - 1 do
            self.vector:add(options[index + 1])
        end
    return self
end


-- throws Exception
function SetLicenseInitInfo:getLicenseInitInfo()
        local licenseInitInfoUtil = LicenseInitInfoUtil.getInstance()
        if FileFactory.getInstance():isFile(licenseInitInfoUtil.INITFILENAME) then
            return licenseInitInfoUtil:read()
        else
            return LicenseInitInfo.new()
        end
end


function SetLicenseInitInfo:createNewLicenseInitInfo(licenceServerVector)
        local try_ok, try_error = pcall(function()
            if licenceServerVector == nil then
                error(java_exception("Exception", "null BasicArrayList Passed - Just Make Empty if you want"), 0)
            end
            local licenseInitInfo = self:getLicenseInitInfo()
            print("License Serv Example: http://www.dartstatistics.com/LicServ/serverssl.php")
            licenseInitInfo:clearServers()
            local file = File.new(tostring(PrintLicenseInitInfo.PATH) .. "licenseservers.txt")
            local reader = FileReader.new(file)
            local lineNumberReader = LineNumberReader.new(reader)
            while true do
                local line = lineNumberReader:readLine()
                if line ~= nil then
                    licenseInitInfo:addServer(line)
                else
                    break
                end
            end
            LicenseInitInfoUtil.getInstance():write(licenseInitInfo)
            LicenseInitInfoUtil.getInstance():read()
        end)
        if not try_ok then
            local e = try_error
            io.write(tostring("Error: " .. tostring(e)))
            print(debug.traceback(tostring(e)))
        end
end


-- throws Exception
function SetLicenseInitInfo.main(args)
        local initInfo = SetLicenseInitInfo.new(args)
        initInfo:createNewLicenseInitInfo(BasicArrayListD.new())
end

SetLicenseInitInfo.stdinput = BufferedReader.new(InputStreamReader.new(System.in_))

return SetLicenseInitInfo

