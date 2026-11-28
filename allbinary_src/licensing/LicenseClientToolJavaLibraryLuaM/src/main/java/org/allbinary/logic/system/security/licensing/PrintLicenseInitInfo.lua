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

local PrintLicenseInitInfo = {}
package.loaded["org.allbinary.logic.system.security.licensing.PrintLicenseInitInfo"] = PrintLicenseInitInfo

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

local LicenseInitInfo = java_lazy("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = java_lazy("org.allbinary.business.init.LicenseInitInfoUtil")
local FileFactory = java_lazy("org.allbinary.logic.io.file.FileFactory")
local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
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

-- class table PrintLicenseInitInfo is declared before the requires
PrintLicenseInitInfo.__index = PrintLicenseInitInfo
PrintLicenseInitInfo.className = "PrintLicenseInitInfo"
PrintLicenseInitInfo.javaClassName = "org.allbinary.logic.system.security.licensing.PrintLicenseInitInfo"


function PrintLicenseInitInfo._jinit(self, options)
        LicenseInitInfoUtil.getInstance():setFilePath(PrintLicenseInitInfo.PATH + PATH_GLOBALS.getInstance().INIT_PATH)
    return self
end

function PrintLicenseInitInfo.new(...)
    local self = setmetatable({}, PrintLicenseInitInfo)
    PrintLicenseInitInfo._jinit(self, ...)
    return self
end


-- throws Exception
function PrintLicenseInitInfo:getLicenseInitInfo()
        local licenseInitInfoUtil = LicenseInitInfoUtil.getInstance()
        if FileFactory.getInstance():isFile(licenseInitInfoUtil:getFilePath()) then
            return licenseInitInfoUtil:read()
        else
            print(require("allbinary_java").to_string("No Licence File at: ") .. require("allbinary_java").to_string(licenseInitInfoUtil:getFilePath()))
            return LicenseInitInfo.new()
        end
end


function PrintLicenseInitInfo:printInitInfo()
        local try_ok, try_error, try_value = pcall(function()
            local licenseInitInfo = self:getLicenseInitInfo()
            print(require("allbinary_java").to_string("License ID: ") .. require("allbinary_java").to_string(licenseInitInfo:getLicenseId()))
            local list = licenseInitInfo:getServerList()
            local size = list:size()
            for index = 0, size - 1 do
                print(require("allbinary_java").to_string("Lic Serv: ") .. require("allbinary_java").to_string(list:get(index)))
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            io.write(tostring(require("allbinary_java").to_string("Error: ") .. require("allbinary_java").to_string(e)))
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

