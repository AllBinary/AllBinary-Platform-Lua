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

-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FilePathData = require("org.allbinary.logic.io.file.FilePathData")
local SubDirectory = require("org.allbinary.logic.io.file.directory.SubDirectory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CpuInterface = require("org.allbinary.logic.system.hardware.components.interfaces.CpuInterface")
local HardwareComponentInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local Cpu = {}
Cpu.__index = Cpu
Cpu.className = "Cpu"

function Cpu:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.CPUFILE = "/proc/cpuinfo"
    self.cpuHashMap = nil
end

function Cpu.new(...)
    local count = select("#", ...)
    if count == 1 then return Cpu._new1(...)
    elseif count == 0 then return Cpu._new0(...)
    end
end


function Cpu._new1(filePath)
    local self = setmetatable({}, Cpu)
    self:_init_fields()
        self:init(filePath)
    return self
end


function Cpu._new0()
    local self = setmetatable({}, Cpu)
    self:_init_fields()
        self:init(self.CPUFILE)
    return self
end


-- throws Exception
function Cpu:init(filePath)
        local lineNumberReader = nil
        local try_ok, try_error = pcall(function()
            self:init(lineNumberReader, filePath)
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                self.logUtil:put(tostring(StringMaker.new():append("Cpu Data: "):append(tostring(self))), self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function Cpu:init(lineNumberReader, filePath)
        local try_ok, try_error = pcall(function()
            local fileReader = FileReader.new(filePath)
            lineNumberReader = LineNumberReader.new(fileReader)
            self.cpuHashMap = StdUtil.getInstance():createHashMap()
            if lineNumberReader == nil then
                local fileVector = SubDirectory.getInstance():search(filePath, AbFile.createAbFile(FilePathData.getInstance().PATH_START))
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                    self.logUtil:putF(tostring(StringMaker.new():append("Cpu File BasicArrayList Size: "):appendint(fileVector:size())), self, self.commonStrings.CONSTRUCTOR)
                end
                if not fileVector:isEmpty() then
                    local file = fileVector:get(0)
                    lineNumberReader = LineNumberReader.new(FileReader.new(file:getPath()))
                end
            end
            if lineNumberReader ~= nil then
                local nextLine = lineNumberReader:readLine()
                while lineNumberReader ~= nil and nextLine ~= nil do
                    local index = ((string.find(nextLine, ":", 1, true) or 0) - 1)
                    if index >= 0 then
                        local key = string.sub(nextLine, (0) + 1, index)
                        local valueIndex = index + 1
                        local value = string.sub(nextLine, (valueIndex) + 1, #nextLine)
                        if ((string.find(key, tostring(CpuInfo.PROCESSOR), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.PROCESSOR, value)
                        end
                        if ((string.find(key, tostring(CpuInfo.VENDORID), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.VENDORID, value)
                        end
                        if ((string.find(key, tostring(CpuInfo.CPUFAMILY), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.CPUFAMILY, value)
                        end
                        if ((string.find(key, tostring(CpuInfo.MODEL), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.MODEL, value)
                        end
                        if ((string.find(key, tostring(CpuInfo.MODELNAME), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.MODELNAME, value)
                        end
                        if ((string.find(key, tostring(CpuInfo.STEPPING), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.STEPPING, value)
                        end
                        if ((string.find(key, tostring(CpuInfo.CPUMHZ), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.CPUMHZ, value)
                        end
                        if ((string.find(key, tostring(CpuInfo.CACHESIZE), 1, true) or 0) - 1) >= 0 then
                            self.cpuHashMap:put(CpuInfo.CACHESIZE, value)
                        end
                    end
                    nextLine = lineNumberReader:readLine()
                end
            end
        end)
        do -- finally
            if lineNumberReader ~= nil then
                lineNumberReader:close()
            end
        end
        if not try_ok then error(try_error, 0) end
end


function Cpu:getProcessor()
        return self.cpuHashMap:get(CpuInfo.PROCESSOR)
end


function Cpu:getVendorId()
        return self.cpuHashMap:get(CpuInfo.VENDORID)
end


function Cpu:getCpuFamily()
        return self.cpuHashMap:get(CpuInfo.CPUFAMILY)
end


function Cpu:getModel()
        return self.cpuHashMap:get(CpuInfo.MODEL)
end


function Cpu:getModelName()
        return self.cpuHashMap:get(CpuInfo.MODELNAME)
end


function Cpu:getStepping()
        return self.cpuHashMap:get(CpuInfo.STEPPING)
end


function Cpu:getCpuSpeed()
        return self.cpuHashMap:get(CpuInfo.CPUMHZ)
end


function Cpu:getCacheSize()
        return self.cpuHashMap:get(CpuInfo.CACHESIZE)
end


function Cpu:compareTo(cpuInterface)
        return true
end


-- Java overloaded method: Lua keeps the last definition
function Cpu:compareTo(componentInterface)
        return true
end


function Cpu:toString()
        local commonLabels = CommonLabels.getInstance()
        local commonSeps = CommonSeps.getInstance()
        local stringMaker = StringMaker.new()
        stringMaker:append(tostring(CpuInfo.PROCESSOR)):append(commonLabels.COLON_SEP):append(self:getProcessor())
        stringMaker:append(commonSeps.NEW_LINE)
        stringMaker:append(tostring(CpuInfo.VENDORID)):append(commonLabels.COLON_SEP):append(self:getVendorId())
        stringMaker:append(commonSeps.NEW_LINE)
        stringMaker:append(tostring(CpuInfo.CPUFAMILY)):append(commonLabels.COLON_SEP):append(self:getCpuFamily())
        stringMaker:append(commonSeps.NEW_LINE)
        stringMaker:append(tostring(CpuInfo.MODEL)):append(commonLabels.COLON_SEP):append(self:getModel())
        stringMaker:append(commonSeps.NEW_LINE)
        stringMaker:append(tostring(CpuInfo.MODELNAME)):append(commonLabels.COLON_SEP):append(self:getModelName())
        stringMaker:append(commonSeps.NEW_LINE)
        stringMaker:append(tostring(CpuInfo.STEPPING)):append(commonLabels.COLON_SEP):append(self:getStepping())
        stringMaker:append(commonSeps.NEW_LINE)
        stringMaker:append(tostring(CpuInfo.CPUMHZ)):append(commonLabels.COLON_SEP):append(self:getCpuSpeed())
        stringMaker:append(commonSeps.NEW_LINE)
        stringMaker:append(tostring(CpuInfo.CACHESIZE)):append(commonLabels.COLON_SEP):append(self:getCacheSize())
        return tostring(stringMaker)
end
Cpu.__tostring = function(self) return self:toString() end

return Cpu

