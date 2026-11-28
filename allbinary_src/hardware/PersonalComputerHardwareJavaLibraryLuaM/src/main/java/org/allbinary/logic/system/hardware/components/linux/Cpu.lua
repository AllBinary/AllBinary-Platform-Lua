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

local Cpu = {}
package.loaded["org.allbinary.logic.system.hardware.components.linux.Cpu"] = Cpu

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

-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local HashMap = java_lazy("java.util.HashMap")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FilePathData = java_lazy("org.allbinary.logic.io.file.FilePathData")
local SubDirectory = java_lazy("org.allbinary.logic.io.file.directory.SubDirectory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CpuInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.CpuInterface")
local HardwareComponentInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local CpuInfo = java_lazy("org.allbinary.logic.system.hardware.components.linux.CpuInfo")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table Cpu is declared before the requires
Cpu.__index = Cpu
Cpu.className = "Cpu"
Cpu.javaClassName = "org.allbinary.logic.system.hardware.components.linux.Cpu"
Cpu.java_implements = " CpuInterface HardwareComponentInterface "
Cpu.java_interfaces = function() return {CpuInterface, HardwareComponentInterface} end

function Cpu:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.CPUFILE = "/proc/cpuinfo"
    if self.cpuHashMap == nil then self.cpuHashMap = nil end
end

function Cpu._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return Cpu._new1(self, ...)
    elseif count == 0 then return Cpu._new0(self, ...)
    end
    error("No constructor of Cpu takes " .. count .. " arguments")
end

function Cpu.new(...)
    local self = setmetatable({}, Cpu)
    Cpu._jinit(self, ...)
    return self
end


function Cpu._new1(self, filePath)
    Cpu._init_fields(self)
        self:init(filePath)
    return self
end


function Cpu._new0(self)
    Cpu._init_fields(self)
        self:init(self.CPUFILE)
    return self
end


-- throws Exception
function Cpu:init_j1(filePath)
        local lineNumberReader = nil
        local try_ok, try_error, try_value = pcall(function()
            self:init(lineNumberReader, filePath)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                self.logUtil:put(tostring(StringMaker.new():append("Cpu Data: "):append(tostring(self))), self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
end


-- throws Exception
function Cpu:init_j2(lineNumberReader, filePath)
        local try_ok, try_error, try_value = pcall(function()
            local fileReader = FileReader.new(filePath)
            lineNumberReader = LineNumberReader.new(fileReader)
            self.cpuHashMap = StdUtil.getInstance():createHashMap()
            if rawequal(lineNumberReader, nil) then
                local fileVector = SubDirectory.getInstance():search(filePath, AbFile.createAbFile(FilePathData.getInstance().PATH_START))
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                    self.logUtil:putF(tostring(StringMaker.new():append("Cpu File BasicArrayList Size: "):appendint(fileVector:size())), self, self.commonStrings.CONSTRUCTOR)
                end
                if not (fileVector:isEmpty()) then
                    local file = fileVector:get(0)
                    lineNumberReader = LineNumberReader.new(FileReader.new(file:getPath()))
                end
            end
            if not rawequal(lineNumberReader, nil) then
                local nextLine = lineNumberReader:readLine()
                while not rawequal(nextLine, nil) do
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
            if not rawequal(lineNumberReader, nil) then
                lineNumberReader:close()
            end
        end
        if not try_ok then error(try_error, 0) end
end
function Cpu:init(...)
    local count = select("#", ...)
    if count == 1 then return self:init_j1(...) end
    if count == 2 then return self:init_j2(...) end
    error("No method init takes " .. count .. " arguments")
end
Cpu.init__jdispatcher = Cpu.init


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


function Cpu:compareTo_j1_1(cpuInterface)
        return true
end


function Cpu:compareTo_j1_2(componentInterface)
        return true
end
function Cpu:compareTo(...)
    local count = select("#", ...)
    if count == 1 then return self:compareTo_j1(...) end
    error("No method compareTo takes " .. count .. " arguments")
end
Cpu.compareTo__jdispatcher = Cpu.compareTo
function Cpu:compareTo_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "CpuInterface")) then return Cpu.compareTo_j1_1(self, ...) end
    return Cpu.compareTo_j1_2(self, ...)
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

