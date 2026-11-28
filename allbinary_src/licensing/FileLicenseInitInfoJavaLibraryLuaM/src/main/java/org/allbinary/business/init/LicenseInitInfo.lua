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

local LicenseInitInfo = {}
package.loaded["org.allbinary.business.init.LicenseInitInfo"] = LicenseInitInfo

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

local DebugFactory = java_lazy("org.allbinary.debug.DebugFactory")
local NoDebug = java_lazy("org.allbinary.debug.NoDebug")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table LicenseInitInfo is declared before the requires
LicenseInitInfo.__index = LicenseInitInfo
LicenseInitInfo.className = "LicenseInitInfo"
LicenseInitInfo.javaClassName = "org.allbinary.business.init.LicenseInitInfo"

function LicenseInitInfo:_init_fields()
    self.id = StringUtil.getInstance().EMPTY_STRING
    self.serverVector = BasicArrayListD.new()
end


function LicenseInitInfo._jinit(self)
    LicenseInitInfo._init_fields(self)
    return self
end

function LicenseInitInfo.new(...)
    local self = setmetatable({}, LicenseInitInfo)
    LicenseInitInfo._jinit(self, ...)
    return self
end


function LicenseInitInfo:getLicenseId()
        return self.id
end


function LicenseInitInfo:getServer(index)
        return self.serverVector.objectArray[index + 1]
end


function LicenseInitInfo:getNumberOfServers()
        return self.serverVector:size()
end


function LicenseInitInfo:setLicenseId(value)
        self.id = value
end


function LicenseInitInfo:clearServers()
        self.serverVector = BasicArrayListD.new()
end


function LicenseInitInfo:setServer(value, index)
        self.serverVector:addAt(index, value)
end


function LicenseInitInfo:addServer(value)
        self.serverVector:add(value)
end


function LicenseInitInfo:getServerList()
        return self.serverVector
end


function LicenseInitInfo:setServerList(servers)
        if rawequal(DebugFactory.getInstance(), NoDebug.getInstance()) then
            self.serverVector = servers
        end
end

return LicenseInitInfo

