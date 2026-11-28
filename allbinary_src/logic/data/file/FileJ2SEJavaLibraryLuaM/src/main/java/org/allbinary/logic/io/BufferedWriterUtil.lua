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
-- package org.allbinary.logic.io

local BufferedWriterUtil = {}
package.loaded["org.allbinary.logic.io.BufferedWriterUtil"] = BufferedWriterUtil

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

-- local BufferedWriter = require("java.io.BufferedWriter")
local FileWriter = java_lazy("java.io.FileWriter")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = java_lazy("org.allbinary.logic.io.file.AbFileNativeUtil")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table BufferedWriterUtil is declared before the requires
BufferedWriterUtil.__index = BufferedWriterUtil
BufferedWriterUtil.className = "BufferedWriterUtil"
BufferedWriterUtil.javaClassName = "org.allbinary.logic.io.BufferedWriterUtil"

function BufferedWriterUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonLabels = CommonLabels.getInstance()
    self.REMOVING_OLD = "Remove old for overwriting: "
end

function BufferedWriterUtil._jinit(self)
    BufferedWriterUtil._init_fields(self)
    return self
end

function BufferedWriterUtil.new()
    return BufferedWriterUtil._jinit(setmetatable({}, BufferedWriterUtil))
end


function BufferedWriterUtil.getInstance()
        return BufferedWriterUtil.instance_f
end


-- throws Exception
function BufferedWriterUtil:overwrite_j2_1(path, data)
        local abFile = AbFile.createAbFile(path)
        if abFile:exists() then
            self.logUtil:putF(require("allbinary_java").to_string(self.REMOVING_OLD) .. require("allbinary_java").to_string(path), self, self.commonStrings.CREATE)
            abFile:delete()
        else
            local name = AbPathData.getInstance():removeNameFromPath(path)
            local abFileDirectory = AbFile.createAbFile(name)
            if abFileDirectory:exists() then
            else
                local stringBuilder = StringMaker.new()
                self.logUtil:putF(tostring(stringBuilder:append(self.commonStrings.CREATE):append(self.commonLabels.COLON_SEP):append(name)), self, self.commonStrings.CREATE)
                local result = abFileDirectory:mkdirs()
                stringBuilder:delete(0, stringBuilder:length())
                self.logUtil:putF(tostring(stringBuilder:append(self.commonLabels.RESULT_):appendboolean(result)), self, self.commonStrings.CREATE)
            end
        end
        self:write(abFile, data)
end


-- throws Exception
function BufferedWriterUtil:overwrite_j2_2(abFile, data)
        if abFile:exists() then
            self.logUtil:putF(require("allbinary_java").to_string(self.REMOVING_OLD) .. require("allbinary_java").to_string(abFile:getPath()), self, self.commonStrings.CREATE)
            abFile:delete()
        else
            local name = AbPathData.getInstance():removeNameFromPath(abFile:getAbsolutePath())
            local abFileDirectory = AbFile.createAbFile(name)
            if abFileDirectory:exists() then
            else
                local stringBuilder = StringMaker.new()
                self.logUtil:putF(tostring(stringBuilder:append(self.commonStrings.CREATE):append(self.commonLabels.COLON_SEP):append(name)), self, self.commonStrings.CREATE)
                local result = abFileDirectory:mkdirs()
                stringBuilder:delete(0, stringBuilder:length())
                self.logUtil:putF(tostring(stringBuilder:append(self.commonLabels.RESULT_):appendboolean(result)), self, self.commonStrings.CREATE)
            end
        end
        self:write(abFile, data)
end
function BufferedWriterUtil:overwrite(...)
    local count = select("#", ...)
    if count == 2 then return self:overwrite_j2(...) end
    error("No method overwrite takes " .. count .. " arguments")
end
BufferedWriterUtil.overwrite__jdispatcher = BufferedWriterUtil.overwrite
function BufferedWriterUtil:overwrite_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") then return BufferedWriterUtil.overwrite_j2_1(self, ...) end
    return BufferedWriterUtil.overwrite_j2_2(self, ...)
end


-- throws Exception
function BufferedWriterUtil:write(abFile, data)
        local fileOut = BufferedWriter.new(FileWriter.new(AbFileNativeUtil.get(abFile)))
        fileOut:write(data, 0, #data)
        fileOut:newLine()
        fileOut:flush()
end

BufferedWriterUtil.instance_f = BufferedWriterUtil.new()

return BufferedWriterUtil

