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

local LicenseInitInfo = require("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = require("org.allbinary.business.init.LicenseInitInfoUtil")
local FileFactory = require("org.allbinary.logic.io.file.FileFactory")
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

local PrintLicenseInitInfo = {}
PrintLicenseInitInfo.__index = PrintLicenseInitInfo
PrintLicenseInitInfo.className = "PrintLicenseInitInfo"


function PrintLicenseInitInfo.new(options)
    local self = setmetatable({}, PrintLicenseInitInfo)
        LicenseInitInfoUtil.getInstance():setFilePath(PrintLicenseInitInfo.PATH + self.PATH_GLOBALS:getInstance().INIT_PATH)
    return self
end


-- throws Exception
function PrintLicenseInitInfo:getLicenseInitInfo()
        local licenseInitInfoUtil = LicenseInitInfoUtil.getInstance()
        if FileFactory.getInstance():isFile(licenseInitInfoUtil:getFilePath()) then
            return licenseInitInfoUtil:read()
        else
            print("No Licence File at: " .. tostring(licenseInitInfoUtil:getFilePath()))
            return LicenseInitInfo.new()
        end
end


function PrintLicenseInitInfo:printInitInfo()
        local try_ok, try_error = pcall(function()
            local licenseInitInfo = self:getLicenseInitInfo()
            print("License ID: " .. tostring(licenseInitInfo:getLicenseId()))
            local list = licenseInitInfo:getServerList()
            local size = list:size()
            for index = 0, size - 1 do
                print("Lic Serv: " .. tostring(list:get(index)))
            end
        end)
        if not try_ok then
            local e = try_error
            io.write(tostring("Error: " .. tostring(e)))
            print(debug.traceback(tostring(e)))
        end
end


-- throws Exception
function PrintLicenseInitInfo.main(args)
        local initInfo = PrintLicenseInitInfo.new(args)
        initInfo:printInitInfo()
end

PrintLicenseInitInfo.PATH = "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\"

return PrintLicenseInitInfo

