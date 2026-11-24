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
-- package org.allbinary.logic.system.hardware.components.linux

local CpuInfo = {}
package.loaded["org.allbinary.logic.system.hardware.components.linux.CpuInfo"] = CpuInfo

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

-- class table CpuInfo is declared before the requires
CpuInfo.__index = CpuInfo
CpuInfo.className = "CpuInfo"
CpuInfo.javaClassName = "org.allbinary.logic.system.hardware.components.linux.CpuInfo"

function CpuInfo:_init_fields()
    if self.name_f == nil then self.name_f = nil end
end


function CpuInfo._jinit(self, name)
    CpuInfo._init_fields(self)
        self.name_f = name
    return self
end

function CpuInfo.new(...)
    local self = setmetatable({}, CpuInfo)
    CpuInfo._jinit(self, ...)
    return self
end


function CpuInfo:toString()
        return self.name_f
end
CpuInfo.__tostring = function(self) return self:toString() end

CpuInfo.PROCESSOR = CpuInfo.new("processor")
CpuInfo.VENDORID = CpuInfo.new("vendor_id")
CpuInfo.CPUFAMILY = CpuInfo.new("cpu family")
CpuInfo.MODEL = CpuInfo.new("model")
CpuInfo.MODELNAME = CpuInfo.new("model name")
CpuInfo.STEPPING = CpuInfo.new("stepping")
CpuInfo.CPUMHZ = CpuInfo.new("cpu MHz")
CpuInfo.CACHESIZE = CpuInfo.new("cache size")
CpuInfo.FDIVBUG = CpuInfo.new("fdiv_bug")
CpuInfo.HLTBUG = CpuInfo.new("hlt_bug")
CpuInfo.F00FBUG = CpuInfo.new("f00f_bug")
CpuInfo.COMABUG = CpuInfo.new("coma_bug")
CpuInfo.FPU = CpuInfo.new("fpu")
CpuInfo.FPUEXCEPTION = CpuInfo.new("fpu_exception")
CpuInfo.CPUIDLEVEL = CpuInfo.new("cache size")
CpuInfo.WP = CpuInfo.new("yes")
CpuInfo.FLAGS = CpuInfo.new("flags")
CpuInfo.BOGOMIPS = CpuInfo.new("bogomips")

return CpuInfo

