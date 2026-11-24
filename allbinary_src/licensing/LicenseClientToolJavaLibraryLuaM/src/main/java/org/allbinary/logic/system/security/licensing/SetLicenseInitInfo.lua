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

local SetLicenseInitInfo = {}
package.loaded["org.allbinary.logic.system.security.licensing.SetLicenseInitInfo"] = SetLicenseInitInfo

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

-- local BufferedReader = require("java.io.BufferedReader")
-- local InputStreamReader = require("java.io.InputStreamReader")
local LicenseInitInfo = java_lazy("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = java_lazy("org.allbinary.business.init.LicenseInitInfoUtil")
local FileFactory = java_lazy("org.allbinary.logic.io.file.FileFactory")
local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
local File = java_lazy("java.io.File")
-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local PrintLicenseInitInfo = java_lazy("org.allbinary.logic.system.security.licensing.PrintLicenseInitInfo")

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

-- class table SetLicenseInitInfo is declared before the requires
SetLicenseInitInfo.__index = SetLicenseInitInfo
SetLicenseInitInfo.className = "SetLicenseInitInfo"
SetLicenseInitInfo.javaClassName = "org.allbinary.logic.system.security.licensing.SetLicenseInitInfo"

function SetLicenseInitInfo:_init_fields()
    self.vector = BasicArrayListD.new()
end


function SetLicenseInitInfo._jinit(self, options)
    SetLicenseInitInfo._init_fields(self)
        LicenseInitInfoUtil.getInstance():setFilePath(PrintLicenseInitInfo.PATH + PATH_GLOBALS.getInstance().INIT_PATH)
        for index = 1, (options.n or #options) - 1 do
            self.vector:add(options[index + 1])
        end
    return self
end

function SetLicenseInitInfo.new(...)
    local self = setmetatable({}, SetLicenseInitInfo)
    SetLicenseInitInfo._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
            if licenceServerVector == nil then
                error(require("java.lang.Exception").new("null BasicArrayList Passed - Just Make Empty if you want"), 0)
            end
            local licenseInitInfo = self:getLicenseInitInfo()
            print("License Serv Example: http://www.dartstatistics.com/LicServ/serverssl.php")
            licenseInitInfo:clearServers()
            local file = File.new(tostring(PrintLicenseInitInfo.PATH) .. "licenseservers.txt")
            local reader = FileReader.new(file)
            local lineNumberReader = LineNumberReader.new(reader)
            while lineNumberReader:ready() do
                licenseInitInfo:addServer(lineNumberReader:readLine())
            end
            LicenseInitInfoUtil.getInstance():write(licenseInitInfo)
            LicenseInitInfoUtil.getInstance():read()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            io.write(tostring("Error: " .. tostring(e)))
            print(debug.traceback(tostring(e)))
        end
end


-- throws Exception
function SetLicenseInitInfo.main(args)
        local initInfo = SetLicenseInitInfo.new(args)
        initInfo:createNewLicenseInitInfo(BasicArrayListD.new())
end

SetLicenseInitInfo.stdinput = BufferedReader.new(InputStreamReader.new(require("java.lang.System").in_))

return SetLicenseInitInfo

