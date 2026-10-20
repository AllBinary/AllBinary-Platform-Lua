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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CpuInfo = {}
CpuInfo.__index = CpuInfo
CpuInfo.className = "CpuInfo"

function CpuInfo:_init_fields()
    self.name = nil
end


function CpuInfo.new(name)
    local self = setmetatable({}, CpuInfo)
    self:_init_fields()
        self.name = name
    return self
end


function CpuInfo:toString()
        return self.name
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

