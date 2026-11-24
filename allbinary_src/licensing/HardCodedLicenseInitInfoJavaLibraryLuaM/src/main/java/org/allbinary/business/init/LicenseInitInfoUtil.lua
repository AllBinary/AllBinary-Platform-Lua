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
-- package org.allbinary.business.init

local LicenseInitInfoUtil = {}
package.loaded["org.allbinary.business.init.LicenseInitInfoUtil"] = LicenseInitInfoUtil

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

-- class table LicenseInitInfoUtil is declared before the requires
LicenseInitInfoUtil.__index = LicenseInitInfoUtil
LicenseInitInfoUtil.className = "LicenseInitInfoUtil"
LicenseInitInfoUtil.javaClassName = "org.allbinary.business.init.LicenseInitInfoUtil"

function LicenseInitInfoUtil:_init_fields()
    self.INITFILENAME = "licenseinitdata.dat"
    self.ABOUT = "about"
    self.PRIVACY_POLICY = "privacy_policy"
    self.OFFICIAL_ALLBINARY_SERVICES_SERVER = "https://services.allbinary.com/LicServ/serverssl.php"
end


function LicenseInitInfoUtil.getInstance()
        return LicenseInitInfoUtil.instance_f
end


function LicenseInitInfoUtil:setFilePath(filePath)
end


function LicenseInitInfoUtil._jinit(self)
    LicenseInitInfoUtil._init_fields(self)
    return self
end

function LicenseInitInfoUtil.new(...)
    local self = setmetatable({}, LicenseInitInfoUtil)
    LicenseInitInfoUtil._jinit(self, ...)
    return self
end


-- throws Exception
function LicenseInitInfoUtil:write(initData)
end


-- throws Exception
function LicenseInitInfoUtil:read()
        return self:readAgain(0)
end


-- throws Exception
function LicenseInitInfoUtil:readAgain(initializeCounter)
        local licenseInitInfo = LicenseInitInfo.new()
        licenseInitInfo:clearServers()
        licenseInitInfo:addServer(self.OFFICIAL_ALLBINARY_SERVICES_SERVER)
        return licenseInitInfo
end

LicenseInitInfoUtil.instance_f = LicenseInitInfoUtil.new()

return LicenseInitInfoUtil

